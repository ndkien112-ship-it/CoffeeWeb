<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>KMN COFFEE - Hệ Thống Quản Trị Hợp Nhất</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root { --coffee-dark: #4B3621; --coffee-light: #FDF5E6; --coffee-accent: #D2B48C; }
        body { background-color: var(--coffee-light); font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
        
        /* Sidebar Styles */
        #sidebar { min-width: 280px; max-width: 280px; background: var(--coffee-dark); color: white; min-height: 100vh; transition: all 0.3s; }
        .sidebar-header { padding: 20px; background: rgba(0,0,0,0.2); }
        .nav-link { color: rgba(255,255,255,0.7); padding: 12px 20px; border-radius: 0; transition: 0.3s; }
        .nav-link:hover, .nav-link.active { color: white; background: rgba(255,255,255,0.1); border-left: 4px solid var(--coffee-accent); }
        .nav-link i { margin-right: 10px; width: 20px; }

        /* Content Styles */
        .main-content { width: 100%; padding: 30px; }
        .stat-card { border: none; border-radius: 15px; transition: 0.3s; }
        .stat-card:hover { transform: translateY(-5px); }
        .section-title { border-bottom: 2px solid var(--coffee-accent); padding-bottom: 10px; margin-bottom: 25px; color: var(--coffee-dark); }
    </style>
</head>
<body>
    <div class="d-flex">
        <nav id="sidebar" class="shadow">
            <div class="sidebar-header text-center">
                <h4 class="fw-bold mb-0">☕ KMN COFFEE</h4>
                <small class="text-warning">Quản lý chuỗi cửa hàng</small>
            </div>
            <div class="py-4">
                <div class="px-3 mb-2 text-uppercase small opacity-50">Tổng quan</div>
                <a href="admin" class="nav-link active"><i class="fas fa-chart-line"></i> Dashboard</a>
                
                <div class="px-3 mt-4 mb-2 text-uppercase small opacity-50">Vận hành</div>
                <a href="menu" class="nav-link"><i class="fas fa-coffee"></i> Thực đơn & Công thức</a>
                <a href="branch" class="nav-link"><i class="fas fa-store"></i> Hệ thống Chi nhánh</a>
                <a href="inventory" class="nav-link"><i class="fas fa-boxes-stacked"></i> Kho & Tồn kho</a>
                
                <div class="px-3 mt-4 mb-2 text-uppercase small opacity-50">Nhân sự</div>
                <a href="employee" class="nav-link"><i class="fas fa-users"></i> Hồ sơ Nhân viên</a>
                <a href="assignment" class="nav-link"><i class="fas fa-calendar-check"></i> Phân ca & Chấm công</a>
                
                <div class="px-3 mt-4 mb-2 text-uppercase small opacity-50">Tài chính</div>
                <a href="invoices" class="nav-link"><i class="fas fa-file-invoice-dollar"></i> Hóa đơn bán lẻ</a>
                <a href="imports" class="nav-link"><i class="fas fa-truck-loading"></i> Nhập hàng kho</a>
            </div>
        </nav>

        <main class="main-content">
            <header class="d-flex justify-content-between align-items-center mb-5">
                <h3 class="fw-bold m-0">BẢNG ĐIỀU KHIỂN HỆ THỐNG</h3>
                <div class="dropdown">
                    <button class="btn btn-outline-dark dropdown-toggle" type="button" data-bs-toggle="dropdown">
                        <i class="fas fa-user-circle me-2"></i> Admin: Nhóm 10
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Thông tin cá nhân</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-danger" href="#">Đăng xuất</a></li>
                    </ul>
                </div>
            </header>

            <div class="row g-4 mb-5">
                <div class="col-md-3">
                    <div class="card stat-card shadow-sm p-3 bg-white">
                        <div class="d-flex justify-content-between align-items-center">
                            <div><h6 class="text-muted mb-1">Chi nhánh</h6><h3 class="fw-bold mb-0">03</h3></div>
                            <div class="bg-primary bg-opacity-10 p-3 rounded-circle"><i class="fas fa-store text-primary"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card stat-card shadow-sm p-3 bg-white">
                        <div class="d-flex justify-content-between align-items-center">
                            <div><h6 class="text-muted mb-1">Nhân viên</h6><h3 class="fw-bold mb-0">45</h3></div>
                            <div class="bg-success bg-opacity-10 p-3 rounded-circle"><i class="fas fa-users text-success"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card stat-card shadow-sm p-3 bg-white">
                        <div class="d-flex justify-content-between align-items-center">
                            <div><h6 class="text-muted mb-1">Món uống</h6><h3 class="fw-bold mb-0">24</h3></div>
                            <div class="bg-warning bg-opacity-10 p-3 rounded-circle"><i class="fas fa-mug-hot text-warning"></i></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card stat-card shadow-sm p-3 bg-white">
                        <div class="d-flex justify-content-between align-items-center">
                            <div><h6 class="text-muted mb-1">Hóa đơn hôm nay</h6><h3 class="fw-bold mb-0">128</h3></div>
                            <div class="bg-info bg-opacity-10 p-3 rounded-circle"><i class="fas fa-receipt text-info"></i></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-8">
                    <div class="card shadow-sm border-0 rounded-4 p-4">
                        <h5 class="fw-bold mb-4"><i class="fas fa-history me-2"></i> Giao dịch gần đây</h5>
                        <table class="table table-hover align-middle">
                            <thead class="table-light">
                                <tr><th>Mã HĐ</th><th>Thời gian</th><th>Tổng tiền</th><th>Trạng thái</th></tr>
                            </thead>
                            <tbody>
                                <tr><td>HD2024001</td><td>10:15 24/04</td><td class="fw-bold text-danger">45,000đ</td><td><span class="badge bg-success">Thành công</span></td></tr>
                                <tr><td>HD2024002</td><td>10:30 24/04</td><td class="fw-bold text-danger">125,000đ</td><td><span class="badge bg-success">Thành công</span></td></tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card shadow-sm border-0 rounded-4 p-4 h-100">
                        <h5 class="fw-bold mb-4"><i class="fas fa-bell me-2"></i> Thông báo kho</h5>
                        <div class="alert alert-warning py-2 mb-2 small"><i class="fas fa-exclamation-triangle me-2"></i> <strong>Cà phê bột</strong> tại CN Cầu Giấy sắp hết!</div>
                        <div class="alert alert-info py-2 mb-2 small"><i class="fas fa-info-circle me-2"></i> Phiếu nhập <strong>PN102</strong> đã hoàn tất.</div>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>