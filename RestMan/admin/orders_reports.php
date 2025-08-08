<?php
session_start();
include('config/config.php');
include('config/checklogin.php');
check_login();
require_once('partials/_head.php');
?>

<body>
    <!-- Sidenav -->
    <?php
    require_once('partials/_sidebar.php');
    ?>
    <!-- Main content -->
    <div class="main-content">
        <!-- Top navbar -->
        <?php
        require_once('partials/_topnav.php');
        ?>
        <!-- Header -->
        <div style="background-image: url(assets/img/theme/restro00.jpg); background-size: cover;" class="header pb-8 pt-5 pt-md-8">
            <span class="mask bg-gradient-dark opacity-8"></span>
            <div class="container-fluid">
                <div class="header-body">
                </div>
            </div>
        </div>
        <!-- Page content -->
        <div class="container-fluid mt--8">
            <!-- Table -->
            <div class="row">
                <div class="col">
                    <div class="card shadow">
                        <div class="card-header border-0 d-flex justify-content-between align-items-center">
                            <h3 class="mb-0">Hồ sơ đơn hàng</h3>
                            <form class="d-flex" method="GET">
                                <div class="input-group">
                                    <input type="text" name="search" class="form-control" placeholder="Tìm kiếm..." value="<?= isset($_GET['search']) ? htmlspecialchars($_GET['search']) : ''; ?>">
                                    <button type="submit" class="btn btn-outline-success">
                                        <i class="fas fa-search"></i>
                                    </button>
                                </div>
                            </form>
                        </div>
                        <div class="table-responsive">
                            <table class="table align-items-center table-flush text-center">
                                <thead class="thead-light">
                                    <tr>
                                        <th class="text-success" scope="col">Mã</th>
                                        <th scope="col">Khách hàng</th>
                                        <th class="text-success" scope="col">Món ăn</th>
                                        <th scope="col">Giá</th>
                                        <th class="text-success" scope="col">Số lượng</th>
                                        <th scope="col">Tổng tiền</th>
                                        <th class="text-success" scope="col">Trạng thái</th>
                                        <th scope="col">Thời gian</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $search = isset($_GET['search']) ? $_GET['search'] : '';
                                    if (!empty($search)) {
                                        $ret = "SELECT * FROM rpos_orders WHERE order_code LIKE ? OR customer_name LIKE ? OR created_at LIKE ?";
                                        $stmt = $mysqli->prepare($ret);
                                        $searchParam = "%{$search}%";
                                        $stmt->bind_param('sss', $searchParam, $searchParam, $searchParam);
                                    } else {
                                        $ret = "SELECT * FROM rpos_orders ORDER BY created_at DESC";
                                        $stmt = $mysqli->prepare($ret);
                                    }
                                    $stmt->execute();
                                    $res = $stmt->get_result();
                                    while ($order = $res->fetch_object()) {
                                        $total = ($order->prod_price * $order->prod_qty);
                                    ?>
                                        <tr>
                                            <th class="text-success" scope="row"><?php echo $order->order_code; ?></th>
                                            <td><?php echo $order->customer_name; ?></td>
                                            <td class="text-success"><?php echo $order->prod_name; ?></td>
                                            <td><?php echo $order->prod_price; ?> VND</td>
                                            <td class="text-success"><?php echo $order->prod_qty; ?></td>
                                            <td><?php echo $total; ?> VND</td>
                                            <td><?php if ($order->order_status == '') {
                                                    echo "<span class='badge badge-danger'>Chưa thanh toán</span>";
                                                } else {
                                                    echo "<span class='badge badge-success'>$order->order_status</span>";
                                                } ?></td>
                                            <td><?php echo date('d/m/Y', strtotime($order->created_at)); ?></td>
                                        </tr>
                                    <?php } ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer -->
            <?php
            require_once('partials/_footer.php');
            ?>
        </div>
    </div>
    <!-- Argon Scripts -->
    <?php
    require_once('partials/_scripts.php');
    ?>
</body>
</html>