<?php
session_start();
include('config/config.php');
include('config/checklogin.php');
check_login();
//Delete Staff
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];
    $adn = "DELETE FROM  rpos_customers  WHERE  customer_id = ?";
    $stmt = $mysqli->prepare($adn);
    $stmt->bind_param('s', $id);
    $stmt->execute();
    $stmt->close();
    if ($stmt) {
        $success = "Xóa thành công" && header("refresh:1; url=customes.php");
    } else {
        $err = "Vui lòng thử lại sau";
    }
}
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
                            <h3 class="mb-0">Danh sách khách hàng</h3>
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
                                        <th scope="col">Họ tên</th>
                                        <th scope="col">Số điện thoại</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $search = isset($_GET['search']) ? $_GET['search'] : '';
                                    if (!empty($search)) {
                                        $ret = "SELECT * FROM rpos_customers WHERE customer_name LIKE ? OR customer_phoneno LIKE ?";
                                        $stmt = $mysqli->prepare($ret);
                                        $searchParam = "%{$search}%";
                                        $stmt->bind_param('ss', $searchParam, $searchParam);
                                    } else {
                                        $ret = "SELECT * FROM rpos_customers ORDER BY created_at DESC";
                                        $stmt = $mysqli->prepare($ret);
                                    }
                                    $stmt->execute();
                                    $res = $stmt->get_result();
                                    while ($cust = $res->fetch_object()) {
                                        ?>
                                          <tr>
                                            <td><?php echo $cust->customer_name; ?></td>
                                            <td><?php echo $cust->customer_phoneno; ?></td>
                                            <td><?php echo $cust->customer_email; ?></td>
                                            <td>
                                              <a href="update_customer.php?update=<?php echo $cust->customer_id; ?>">
                                                <button class="btn btn-sm btn-primary">
                                                  <i class="fas fa-user-edit"></i>
                                                  Cập nhật
                                                </button>
                                              </a>  

                                              <a href="customes.php?delete=<?php echo $cust->customer_id; ?>">
                                                <button class="btn btn-sm btn-danger">
                                                  <i class="fas fa-trash"></i>
                                                  Xóa
                                                </button>
                                              </a>
                                            </td>
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