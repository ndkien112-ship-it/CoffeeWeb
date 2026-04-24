<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Hồ sơ Nhân sự - KMN COFFEE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root { --coffee-dark: #4B3621; --coffee-light: #FDF5E6; --coffee-accent: #D2B48C; }
        body { background-color: var(--coffee-light); display: flex; min-height: 100vh; }
        
        /* CSS Sidebar */
        #sidebar { min-width: 280px; background: var(--coffee-dark); color: white; }
        .nav-link { color: rgba(255,255,255,0.7); padding: 12px 20px; transition: 0.3s; text-decoration: none; display: block; }
        .nav-link:hover, .nav-link.active { color: white; background: rgba(255,255,255,0.1); border-left: 4px solid var(--coffee-accent); }
        
        /* CSS Nội dung */
        .main-content { flex: 1; padding: 30px; }
        .table-container { background: white; border-radius: 15px; padding: 25px; box-shadow: 0 5px 15px rgba(0,0,0,0.05); border-top: 5px solid var(--coffee-dark); }
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
            <a href="branch" class="nav-link"><i class="fas fa-store me-2"></i> Chi nhánh</a>
            <a href="employee" class="nav-link active"><i class="fas fa-users me-2"></i> Nhân sự</a>
            <a href="assignment" class="nav-link"><i class="fas fa-calendar-check me-2"></i> Phân ca</a>
            <a href="invoices" class="nav-link"><i class="fas fa-receipt me-2"></i> Hóa đơn</a>
        </div>
    </nav>

    <main class="main-content">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="fw-bold m-0" style="color: var(--coffee-dark);">👥 QUẢN LÝ HỒ SƠ NHÂN SỰ</h2>
            <button class="btn btn-success fw-bold px-4 shadow-sm" data-bs-toggle="modal" data-bs-target="#addStaffModal">
                <i class="fas fa-user-plus me-2"></i> Thêm Nhân Viên
            </button>
        </div>

        <div class="table-container">
            <table class="table table-hover align-middle text-center">
                <thead class="table-dark">
                    <tr>
                        <th>Mã NV</th>
                        <th>Họ và Tên</th>
                        <th>Giới tính</th>
                        <th>Chức vụ</th>
                        <th>Mức lương</th>
                        <th>Trực thuộc Chi nhánh</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listE}" var="e">
                        <tr>
                            <td class="fw-bold">${e.maNV}</td>
                            <td>${e.fullTen}</td>
                            <td>${e.gioiTinh}</td>
                            <td><span class="badge bg-secondary">${e.chucVu}</span></td>
                            <td class="text-danger fw-bold">${e.luong}</td>
                            <td><span class="badge bg-info text-dark">${e.maCN}</span></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </main>

    <div class="modal fade" id="addStaffModal" tabindex="-1">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <form action="employee" method="post" class="modal-content border-0 shadow">
                <div class="modal-header bg-success text-white">
                    <h5 class="modal-title fw-bold">➕ THÊM NHÂN VIÊN MỚI</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body p-4">
                    <div class="row mb-3">
                        <div class="col-md-4">
                            <label class="form-label fw-bold">Mã NV</label>
                            <input type="text" name="maNV" class="form-control" placeholder="VD: NV01" required>
                        </div>
                        <div class="col-md-8">
                            <label class="form-label fw-bold">Trực thuộc Chi nhánh</label>
                            <select name="maCN" class="form-select" required>
                                <c:forEach items="${listB}" var="b">
                                    <option value="${b.maCN}">${b.tenCN} (${b.maCN})</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    
                    <label class="form-label fw-bold">Họ và tên</label>
                    <div class="row mb-3">
                        <div class="col"><input type="text" name="ho" class="form-control" placeholder="Họ"></div>
                        <div class="col"><input type="text" name="dem" class="form-control" placeholder="Đệm"></div>
                        <div class="col"><input type="text" name="ten" class="form-control" placeholder="Tên" required></div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Giới tính</label>
                            <select name="gioiTinh" class="form-select">
                                <option value="Nam">Nam</option>
                                <option value="Nữ">Nữ</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Ngày sinh</label>
                            <input type="date" name="ngaySinh" class="form-control">
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Chức vụ</label>
                            <input type="text" name="chucVu" class="form-control" placeholder="VD: Pha chế">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Lương cơ bản</label>
                            <input type="number" name="luong" class="form-control" placeholder="VNĐ" required>
                        </div>
                    </div>
                </div>
                <div class="modal-footer border-0">
                    <button type="submit" class="btn btn-success px-4 fw-bold w-100">LƯU NHÂN VIÊN</button>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>