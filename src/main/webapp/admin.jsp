<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - KMN COFFEE Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root { 
            --coffee-dark: #4B3621; 
            --coffee-medium: #5D4037;
            --coffee-light: #FDF5E6; 
            --coffee-accent: #D2B48C; 
        }
        
        body { 
            background-color: var(--coffee-light); 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            overflow-x: hidden;
        }
        
        /* Sidebar Styles */
        #sidebar { 
            min-width: 260px; 
            max-width: 260px; 
            background: var(--coffee-dark); 
            color: white; 
            min-height: 100vh; 
            position: fixed;
            transition: all 0.3s;
            z-index: 1000;
        }
        
        .sidebar-header { 
            padding: 25px 20px; 
            background: rgba(0,0,0,0.2); 
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }
        
        .nav-link { 
            color: rgba(255,255,255,0.7) !important; 
            padding: 15px 25px; 
            display: flex;
            align-items: center;
            transition: 0.3s;
            text-decoration: none;
            border-left: 4px solid transparent;
        }
        
        .nav-link:hover, .nav-link.active { 
            color: white !important; 
            background: rgba(255,255,255,0.1); 
            border-left: 4px solid var(--coffee-accent); 
        }
        
        .nav-link i { 
            margin-right: 12px; 
            width: 20px; 
            font-size: 1.1rem;
        }

        /* Main Content Styles */
        .main-content { 
            margin-left: 260px;
            width: calc(100% - 260px);
            padding: 40px; 
            transition: all 0.3s;
        }
        
        .card-stat { 
            border: none; 
            border-radius: 15px; 
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
            transition: 0.3s; 
            background: white;
        }
        
        .card-stat:hover { 
            transform: translateY(-5px); 
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
        }
        
        .icon-box {
            width: 50px;
            height: 50px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
        }
        
        .table-custom {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.05);
        }
    </style>
</head>
<body>

    <nav id="sidebar">
        <div class="sidebar-header text-center">
            <h4 class="fw-bold mb-0">☕ KMN COFFEE</h4>
            <small class="text-warning opacity-75">Hệ thống quản trị chuỗi</small>
        </div>
        <div class="mt-4">
            <div class="px-4 mb-2 text-uppercase small opacity-50 fw-bold">Tổng quan</div>
            <a href="admin" class="nav-link active"><i class="fas fa-chart-line"></i> Dashboard</a>
            
            <div class="px-4 mt-4 mb-2 text-uppercase small opacity-50 fw-bold">Quản lý vận hành</div>
            <a href="menu" class="nav-link"><i class="fas fa-mug-hot"></i> Thực đơn đồ uống</a>
            <a href="branch" class="nav-link"><i class="fas fa-store"></i> Hệ thống chi nhánh</a>
            <a href="employee" class="nav-link"><i class="fas fa-users"></i> Hồ sơ nhân viên</a>
            <a href="assignment" class="nav-link"><i class="fas fa-calendar-alt"></i> Phân ca làm việc</a>
            
            <div class="px-4 mt-4 mb-2 text-uppercase small opacity-50 fw-bold">Báo cáo tài chính</div>
            <a href="invoices" class="nav-link"><i class="fas fa-receipt"></i> Hóa đơn bán hàng</a>
            <a href="imports" class="nav-link"><i class="fas fa-file-import"></i> Phiếu nhập kho</a>
        </div>
    </nav>

    <main class="main-content">
        <div class="d-flex justify-content-between align-items-center mb-5">
            <div>
                <h2 class="fw-bold mb-1" style="color: var(--coffee-dark);">Chào mừng trở lại!</h2>
                <p class="text-muted">Hôm nay là Thứ Sáu, ngày 24 tháng 4 năm 2026</p>
            </div>
            <div class="d-flex align-items-center">
                <div class="me-3 text-end">
                    <div class="fw-bold">Admin: Nhóm 10</div>
                    <small class="text-success">Trực tuyến</small>
                </div>
                <img src="https://ui-avatars.com/api/?name=Nhom+10&background=4B3621&color=fff" class="rounded-circle shadow-sm" width="50" alt="Avatar">
            </div>
        </div>

        
    

        <div class="row g-4">
            <div class="col-md-8">
                <div class="card table-custom border-0 p-4">
                    <h5 class="fw-bold mb-4" style="color: var(--coffee-dark);"><i class="fas fa-history me-2"></i> Giao dịch mới nhất</h5>
                    <table class="table table-hover align-middle">
                        <thead class="table-light">
                            <tr>
                                <th>Mã HĐ</th>
                                <th>Thời gian</th>
                                <th>Chi nhánh</th>
                                <th>Tổng tiền</th>
                                <th>Trạng thái</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>HD1024</td>
                                <td>11:45</td>
                                <td>Cơ sở Cầu Giấy</td>
                                <td class="fw-bold">45.000đ</td>
                                <td><span class="badge bg-success">Hoàn thành</span></td>
                            </tr>
                            <tr>
                                <td>HD1025</td>
                                <td>11:50</td>
                                <td>Cơ sở Hà Đông</td>
                                <td class="fw-bold">120.000đ</td>
                                <td><span class="badge bg-success">Hoàn thành</span></td>
                            </tr>
                            <tr>
                                <td>HD1026</td>
                                <td>12:05</td>
                                <td>Cơ sở Hai Bà Trưng</td>
                                <td class="fw-bold">35.000đ</td>
                                <td><span class="badge bg-warning text-dark">Đang pha chế</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card border-0 rounded-4 shadow-sm p-4 h-100 bg-white">
                    <h5 class="fw-bold mb-4" style="color: var(--coffee-dark);"><i class="fas fa-bell me-2"></i> Cảnh báo hệ thống</h5>
                    <div class="alert alert-warning py-2 mb-3 small">
                        <i class="fas fa-exclamation-triangle me-2"></i> <strong>Cà phê bột</strong> tại CN Hà Đông sắp hết (dưới 500g)!
                    </div>
                    <div class="alert alert-info py-2 mb-3 small">
                        <i class="fas fa-info-circle me-2"></i> Nhân viên <strong>NV02</strong> vừa đăng ký nghỉ phép ngày mai.
                    </div>
                    <div class="alert alert-danger py-2 mb-0 small">
                        <i class="fas fa-times-circle me-2"></i> Phiếu nhập <strong>PN202</strong> chưa được thanh toán!
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>