<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Phân ca làm việc - KMN COFFEE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root { --coffee-dark: #4B3621; --coffee-light: #FDF5E6; --coffee-accent: #D2B48C; }
        body { background-color: var(--coffee-light); display: flex; min-height: 100vh; font-family: 'Segoe UI', sans-serif; }
        
        /* Sidebar Styles */
        #sidebar { min-width: 280px; max-width: 280px; background: var(--coffee-dark); color: white; transition: all 0.3s; }
        .sidebar-header { padding: 25px 20px; background: rgba(0,0,0,0.2); border-bottom: 1px solid rgba(255,255,255,0.1); }
        .nav-link { color: rgba(255,255,255,0.7) !important; padding: 15px 25px; transition: 0.3s; text-decoration: none; display: block; border-left: 4px solid transparent; }
        .nav-link:hover, .nav-link.active { color: white !important; background: rgba(255,255,255,0.1); border-left: 4px solid var(--coffee-accent); }
        .nav-link i { margin-right: 12px; width: 20px; }

        /* Main Content Styles */
        .main-content { flex: 1; padding: 40px; }
        .table-container { background: white; border-radius: 15px; padding: 30px; box-shadow: 0 5px 15px rgba(0,0,0,0.05); border-top: 5px solid var(--coffee-dark); }
        .table thead { background-color: #212529; color: white; }
    </style>
</head>
<body>
    <nav id="sidebar" class="shadow">
        <div class="sidebar-header text-center">
            <h4 class="fw-bold mb-0">☕ KMN COFFEE</h4>
            <small class="text-warning">Quản lý Chuỗi Cửa Hàng</small>
        </div>
        <div class="py-4">
            <a href="admin" class="nav-link"><i class="fas fa-chart-line"></i> Dashboard</a>
            <a href="menu" class="nav-link"><i class="fas fa-mug-hot"></i> Thực đơn đồ uống</a>
            <a href="branch" class="nav-link"><i class="fas fa-store"></i> Hệ thống chi nhánh</a>
            <a href="employee" class="nav-link"><i class="fas fa-users"></i> Hồ sơ nhân viên</a>
            <a href="assignment" class="nav-link active"><i class="fas fa-calendar-check"></i> Phân ca làm việc</a>
            <a href="invoices" class="nav-link"><i class="fas fa-receipt"></i> Hóa đơn bán hàng</a>
            <a href="imports" class="nav-link"><i class="fas fa-truck-loading"></i> Nhập hàng kho</a>
        </div>
    </nav>

    <main class="main-content">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="fw-bold m-0" style="color: var(--coffee-dark);">📅 BẢNG PHÂN CÔNG & CHẤM CÔNG</h2>
            <button class="btn btn-success fw-bold px-4 shadow-sm" data-bs-toggle="modal" data-bs-target="#addAssignmentModal">
                <i class="fas fa-plus-circle me-2"></i> Phân ca mới
            </button>
        </div>

        <div class="table-container">
            <table class="table table-hover align-middle text-center">
                <thead>
                    <tr>
                        <th>Ngày Làm</th>
                        <th>Ca Làm Việc</th>
                        <th>Mã NV</th>
                        <th>Tên Nhân Viên</th>
                        <th>Trạng Thái</th>
                        <th>Thao tác</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listA}" var="a">
                        <tr>
                            <td class="fw-bold">${a.ngayLam}</td>
                            <td><span class="badge bg-secondary p-2 px-3">${a.tenCa}</span></td>
                            <td>${a.maNV}</td>
                            <td>${a.tenNV}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${a.trangThai == 'Đã làm'}">
                                        <span class="badge bg-success"><i class="fas fa-check-circle me-1"></i> Đã làm</span>
                                    </c:when>
                                    <c:when test="${a.trangThai == 'Nghỉ phép'}">
                                        <span class="badge bg-danger"><i class="fas fa-times-circle me-1"></i> Nghỉ phép</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-warning text-dark"><i class="fas fa-clock me-1"></i> Chưa làm</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <a href="loadAssignment?maNV=${a.maNV}&maCa=${a.maCa}&ngayLam=${a.ngayLam}" 
                                   class="btn btn-sm btn-outline-warning fw-bold me-1">
                                   <i class="fas fa-edit"></i> Sửa
                                </a>
                                <a href="assignment?action=delete&maNV=${a.maNV}&maCa=${a.maCa}&ngayLam=${a.ngayLam}" 
                                   class="btn btn-sm btn-outline-danger fw-bold" 
                                   onclick="return confirm('Bạn có chắc muốn xóa lịch phân công này?')">
                                   <i class="fas fa-trash"></i> Xóa
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </main>

    <div class="modal fade" id="addAssignmentModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <form action="assignment" method="post" class="modal-content border-0 shadow">
                <div class="modal-header bg-success text-white">
                    <h5 class="modal-title fw-bold">➕ THÊM LỊCH PHÂN CA</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body p-4">
                    <div class="mb-3">
                        <label class="form-label fw-bold">Chọn Nhân viên</label>
                        <select name="maNV" class="form-select" required>
                            <c:forEach items="${listE}" var="e">
                                <option value="${e.maNV}">${e.maNV} - ${e.fullTen}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-bold">Chọn Ca làm việc</label>
                        <select name="maCa" class="form-select" required>
                            <c:forEach items="${listS}" var="s">
                                <option value="${s.maCa}">${s.tenCa} (${s.gioBatDau} - ${s.gioKetThuc})</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-bold">Ngày làm</label>
                        <input type="date" name="ngayLam" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-bold">Trạng thái ban đầu</label>
                        <select name="trangThai" class="form-select">
                            <option value="Chưa làm">⏳ Chưa làm</option>
                            <option value="Đã làm">✅ Đã làm</option>
                            <option value="Nghỉ phép">❌ Nghỉ phép</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer border-0">
                    <button type="submit" class="btn btn-success px-4 fw-bold w-100 py-2">LƯU PHÂN CÔNG</button>
                </div>
            </form>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>