<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thực đơn - KMN COFFEE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root { --coffee-dark: #4B3621; --coffee-light: #FDF5E6; --coffee-accent: #D2B48C; }
        body { background-color: var(--coffee-light); display: flex; min-height: 100vh; font-family: 'Segoe UI', sans-serif;}
        
        /* CSS Sidebar */
        #sidebar { min-width: 260px; background: var(--coffee-dark); color: white; min-height: 100vh;}
        .nav-link { color: rgba(255,255,255,0.7); padding: 15px 20px; transition: 0.3s; text-decoration: none; display: block; border-left: 4px solid transparent; }
        .nav-link:hover, .nav-link.active { color: white; background: rgba(255,255,255,0.1); border-left: 4px solid var(--coffee-accent); }
        .nav-link i { margin-right: 12px; width: 20px; }
        
        /* CSS Nội dung */
        .main-content { flex: 1; padding: 40px; }
    </style>
</head>
<body>
    <nav id="sidebar" class="shadow">
        <div class="p-4 text-center border-bottom border-secondary">
            <a href="employee" style="text-decoration: none; color: inherit;">
                <h4 class="fw-bold mb-0">☕ KMN COFFEE</h4>
            </a>
            <small class="text-warning opacity-75">Hệ thống quản trị chuỗi</small>
        </div>
        <div class="py-4">
            <div class="px-4 mb-2 text-uppercase small opacity-50 fw-bold">Quản lý vận hành</div>
            <a href="menu" class="nav-link active"><i class="fas fa-coffee"></i> Thực đơn đồ uống</a>
            <a href="branch" class="nav-link"><i class="fas fa-store"></i> Hệ thống chi nhánh</a>
            <a href="employee" class="nav-link"><i class="fas fa-users"></i> Hồ sơ nhân viên</a>
            <a href="assignment" class="nav-link"><i class="fas fa-calendar-check"></i> Phân ca làm việc</a>
            
            <div class="px-4 mt-4 mb-2 text-uppercase small opacity-50 fw-bold">Báo cáo tài chính</div>
            <a href="invoices" class="nav-link"><i class="fas fa-receipt"></i> Hóa đơn bán hàng</a>
            <a href="imports" class="nav-link"><i class="fas fa-truck-loading"></i> Nhập hàng kho</a>
        </div>
    </nav>

    <main class="main-content">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="fw-bold m-0" style="color: var(--coffee-dark);">☕ QUẢN LÝ THỰC ĐƠN ĐỒ UỐNG</h2>
            <button class="btn btn-success fw-bold px-4 shadow-sm" data-bs-toggle="modal" data-bs-target="#addProductModal">
                <i class="fas fa-plus me-2"></i> Thêm Đồ Uống Mới
            </button>
        </div>

        <div class="table-container mt-4">
            <table class="table table-hover align-middle text-center">
                <thead class="table-dark">
                    <tr>
                        <th>Mã Món</th>
                        <th>Tên Đồ Uống</th>
                        <th>Danh Mục</th>
                        <th>Đơn Giá</th>
                        <th>Trạng Thái</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listP}" var="p">
                        <tr>
                            <td class="fw-bold">${p.maSP}</td>
                            <td class="text-start fw-bold text-primary">${p.tenSP}</td>
                            <td><span class="badge bg-secondary">${p.danhMuc}</span></td>
                            <td class="text-danger fw-bold">${p.giaBan} đ</td>
                            <td>
                                <span class="badge bg-success">Đang bán</span>
                            </td>
                            <td>
                                <a href="loadProduct?id=${p.maSP}" class="btn btn-sm btn-outline-warning fw-bold me-1">Sửa</a>
                                <a href="menu?action=delete&id=${p.maSP}" class="btn btn-sm btn-outline-danger fw-bold" onclick="return confirm('Xóa món này khỏi menu?')">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </main>

    <div class="modal fade" id="addProductModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <form action="menu" method="post" class="modal-content border-0 shadow">
                <div class="modal-header bg-success text-white">
                    <h5 class="modal-title fw-bold">➕ THÊM ĐỒ UỐNG MỚI</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body p-4">
                    <div class="mb-3">
                        <label class="form-label fw-bold">Mã Món</label>
                        <input type="text" name="maSP" class="form-control" placeholder="VD: SP01" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-bold">Tên Đồ Uống</label>
                        <input type="text" name="tenSP" class="form-control" placeholder="VD: Cà phê Sữa" required>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Danh Mục</label>
                            <select name="maLoai" class="form-select">
                                <option value="1">Cà phê</option>
                                <option value="2">Trà</option>
                                <option value="3">Đá xay</option>
                                <option value="4">Nước ép</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Giá bán (VNĐ)</label>
                            <input type="number" name="giaNiemYet" class="form-control" required>
                        </div>
                    </div>
                </div>
                <div class="modal-footer border-0">
                    <button type="submit" class="btn btn-success px-4 fw-bold w-100 py-2">LƯU VÀO THỰC ĐƠN</button>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>