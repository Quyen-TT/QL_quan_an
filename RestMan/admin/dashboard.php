<?php
session_start();
include('config/config.php');
include('config/checklogin.php');
check_login();
require_once('partials/_head.php');
require_once('partials/_analytics.php');

$currentYear = date('Y');
$currentMonth = date('m');

$query1 = "SELECT MONTH(created_at) AS month, pay_amt AS revenue 
                 FROM rpos_payments 
                 WHERE YEAR(created_at) = YEAR(CURRENT_DATE)
                 GROUP BY MONTH(created_at)";
$result1 = $mysqli->query($query1);

$months = [];
$revenues = [];
while ($row = $result1->fetch_assoc()) {
    $months[] = $row['month'];
    $revenues[] = $row['revenue'];
}

$query2 = "SELECT prod_name, SUM(prod_qty) AS total_qty 
                      FROM rpos_orders 
                      WHERE MONTH(created_at) = MONTH(CURRENT_DATE)
                      GROUP BY prod_name 
                      ORDER BY total_qty DESC LIMIT 5";
$result2 = $mysqli->query($query2);

$popularItems = [];
$popularQuantities = [];
while ($row = $result2->fetch_assoc()) {
    $popularItems[] = $row['prod_name'];
    $popularQuantities[] = $row['total_qty'];
}
?>

<body>
  <!-- Sidenav -->
  <?php require_once('partials/_sidebar.php'); ?>
  <!-- Main content -->
  <div class="main-content">
    <!-- Top navbar -->
    <?php require_once('partials/_topnav.php'); ?>
    <!-- Header -->
    <div style="background-image: url(assets/img/theme/restro00.jpg); background-size: cover;" class="header pb-8 pt-5 pt-md-8">
      <span class="mask bg-gradient-dark opacity-8"></span>
      <div class="container-fluid">
        <div class="header-body">
          <div class="row">
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">Khách hàng</h5>
                      <span class="h2 font-weight-bold mb-0"><?php echo $customers; ?></span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-danger text-white rounded-circle shadow">
                        <i class="fas fa-users"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">Sản phẩm</h5>
                      <span class="h2 font-weight-bold mb-0"><?php echo $products; ?></span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-primary text-white rounded-circle shadow">
                        <i class="fas fa-utensils"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">Đơn hàng</h5>
                      <span class="h2 font-weight-bold mb-0"><?php echo $orders; ?></span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-warning text-white rounded-circle shadow">
                        <i class="fas fa-shopping-cart"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-lg-6">
              <div class="card card-stats mb-4 mb-xl-0">
                <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="card-title text-uppercase text-muted mb-0">Doanh thu</h5>
                      <span class="h2 font-weight-bold mb-0"><?php echo $sales; ?> VND</span>
                    </div>
                    <div class="col-auto">
                      <div class="icon icon-shape bg-green text-white rounded-circle shadow">
                        <i class="fas fa-dollar-sign"></i>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Page content -->
    <div class="container-fluid mt--7">
      <div class="row mt-5">
        <!-- Biểu đồ doanh thu theo tháng -->
        <div class="col-md-6">
            <div class="card shadow h-100">
                <div class="card-header">
                    <h3 class="mb-0">Doanh thu năm <?php echo $currentYear; ?></h3>
                </div>
                <div class="card-body">
                    <div class="chart-container" style="position: relative; height: 50vh; width: 100%;">
                        <canvas id="revenueChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <!-- Biểu đồ các món ăn được gọi nhiều nhất -->
        <div class="col-md-6">
            <div class="card shadow h-100">
                <div class="card-header">
                    <h3 class="mb-0">Top 5 món ăn phổ biến tháng <?php echo $currentMonth; ?></h3>
                <div class="card-body d-flex justify-content-center align-items-center">
                  <div class="chart-container" style="height: 50vh; width: 50vh;">
                      <canvas id="popularItemsChart"></canvas>
                  </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <?php require_once('partials/_footer.php'); ?>
    </div>
  </div>
  <!-- Argon Scripts -->
  <?php require_once('partials/_scripts.php'); ?>
  <!-- Chart.js -->
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script>
    // Dữ liệu biểu đồ doanh thu theo tháng
    const revenueCtx = document.getElementById('revenueChart').getContext('2d');
    new Chart(revenueCtx, {
        type: 'line',
        data: {
            labels: <?php echo json_encode($months); ?>,
            datasets: [{
                label: 'Doanh thu (VND)',
                data: <?php echo json_encode($revenues); ?>,
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 2
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: { display: true }
            },
            scales: {
                y: { beginAtZero: true , ticks: {stepSize: 100000}},
                x: { title: { display: true, text: 'Tháng' } }
            }
        }
    });

    // Dữ liệu biểu đồ các món ăn được gọi nhiều nhất
    const popularItemsCtx = document.getElementById('popularItemsChart').getContext('2d');
    new Chart(popularItemsCtx, {
        type: 'pie',
        data: {
            labels: <?php echo json_encode($popularItems); ?>,
            datasets: [{
                label: 'Số lượng',
                data: <?php echo json_encode($popularQuantities); ?>,
                backgroundColor: [
                    'rgba(255, 99, 132, 0.6)',
                    'rgba(54, 162, 235, 0.6)',
                    'rgba(255, 206, 86, 0.6)',
                    'rgba(75, 192, 192, 0.6)',
                    'rgba(153, 102, 255, 0.6)',
                ],
                borderWidth: 1,
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: { display: true },
            },
        }
    });

  </script>
</body>
</html>