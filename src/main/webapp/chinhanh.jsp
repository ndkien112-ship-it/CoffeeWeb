<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Hệ thống chi nhánh - KMN COFFEE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root { --coffee-dark: #4B3621; --coffee-light: #FDF5E6; --coffee-accent: #D2B48C; }
        body { background-color: var(--coffee-light); display: flex; min-height: 100vh; }
        
        /* Tách Sidebar (nếu bạn chưa làm file riêng thì dùng tạm CSS này) */
        #sidebar { min-width: 280px; background: var(--coffee-dark); color: white; }
        .nav-link { color: rgba(255,255,255,0.7); padding: 12px 20px; transition: 0.3s; text-decoration: none; display: block; }
        .nav-link:hover, .nav-link.active { color: white; background: rgba(255,255,255,0.1); border-left: 4px solid var(--coffee-accent); }
        
        .main-content { flex: 1; padding: 30px; }
        .card-branch { border-radius: 15px; border: none; transition: 0.3s; background: white; }
        .card-branch:hover { transform: translateY(-5px); box-shadow: 0 10px 20px rgba(0,0,0,0.1); }
        .bg-brown { background-color: #5D4037 !important; }
    </style>
</head>
<body>
    <nav id="sidebar" class="shadow">
        <div class="p-4 text-center border-bottom border-secondary">
            <h4 class="fw-bold mb-0">☕ KMN COFFEE</h4>
        </div>
        <div class="py-4">
            <a href="admin" class="nav-link"><i class="fas fa-chart-line me-2"></i> Dashboard</a>
            <a href="menu" class="nav-link"><i class="fas fa-coffee me-2"></i> Thực đơn</a>
            <a href="branch" class="nav-link active"><i class="fas fa-store me-2"></i> Chi nhánh</a>
            <a href="employee" class="nav-link"><i class="fas fa-users me-2"></i> Nhân sự</a>
            <a href="invoices" class="nav-link"><i class="fas fa-receipt me-2"></i> Hóa đơn</a>
        </div>
    </nav>

    <main class="main-content">
        <div class="d-flex justify-content-between align-items-center mb-5">
            <h2 class="fw-bold m-0" style="color: var(--coffee-dark);">📍 HỆ THỐNG CHI NHÁNH</h2>
            <button class="btn btn-success fw-bold px-4 shadow-sm" data-bs-toggle="modal" data-bs-target="#addBranchModal">
                <i class="fas fa-plus-circle me-2"></i> Thêm Chi Nhánh
            </button>
        </div>

        <div class="row">
            <c:forEach items="${listB}" var="b">
                <div class="col-md-4 mb-4">
                    <div class="card h-100 card-branch shadow-sm">
                        <div class="card-header bg-brown text-white text-center py-3" style="border-radius: 15px 15px 0 0;">
                            <h5 class="mb-0 text-uppercase fw-bold">${b.tenCN}</h5>
                        </div>
                        <div class="card-body p-4">
                            <p class="mb-2"><strong>📍 Địa chỉ:</strong> ${b.diaChi}</p>
                            <p class="mb-2"><strong>📞 Hotline:</strong> <span class="text-danger fw-bold">${b.soDienThoai}</span></p>
                            <p class="mb-3"><strong>👤 Quản lý:</strong> ${b.quanLy}</p>
                            <hr>
                            <div class="d-flex justify-content-between gap-2">
                                <a href="loadBranch?id=${b.maCN}" class="btn btn-outline-warning fw-bold w-50">Sửa</a>
                                <a href="branchManager?action=delete&id=${b.maCN}" class="btn btn-outline-danger fw-bold w-50" 
                                   onclick="return confirm('Bạn có chắc chắn muốn xóa chi nhánh này?')">Xóa</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </main>

    <div class="modal fade" id="addBranchModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <form action="branchManager?action=add" method="post" class="modal-content border-0 shadow">
                <div class="modal-header bg-success text-white">
                    <h5 class="modal-title fw-bold">➕ THÊM CƠ SỞ MỚI</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body p-4">
                    <div class="mb-3">
                        <label class="form-label fw-bold">Mã chi nhánh</label>
                        <input type="text" name="maCN" class="form-control" placeholder="VD: CN01" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-bold">Tên chi nhánh</label>
                        <input type="text" name="tenCN" class="form-control" placeholder="VD: KMN Cầu Giấy" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-bold">Địa chỉ</label>
                        <input type="text" name="diaChi" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-bold">Số điện thoại</label>
                        <input type="text" name="sdt" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-bold">Người quản lý</label>
                        <input type="text" name="quanLy" class="form-control" required>
                    </div>
                </div>
                <div class="modal-footer border-0">
                    <button type="submit" class="btn btn-success px-4 fw-bold w-100">LƯU THÔNG TIN</button>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>