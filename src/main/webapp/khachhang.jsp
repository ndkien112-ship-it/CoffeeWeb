<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản Lý Khách Hàng - KMN COFFEE</title>
    <!-- Thư viện Bootstrap & FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .text-coffee { color: #4B3621; }
        .table-custom { border-radius: 10px; overflow: hidden; box-shadow: 0 0 15px rgba(0,0,0,0.05); }
    </style>
</head>
<body class="d-flex bg-light">

    <!-- Nhúng Sidebar -->
    <jsp:include page="sidebar.jsp">
        <jsp:param name="active" value="khachhang"/>
    </jsp:include>

    <div class="container-fluid p-4 w-100 overflow-auto" style="height: 100vh;">
        
        <!-- HEADER -->
        <div class="d-flex justify-content-between align-items-center mb-4 bg-white p-3 rounded-4 shadow-sm border-start border-5 border-primary">
            <div>
                <h3 class="m-0 fw-bold text-dark"><i class="fas fa-users me-2"></i>QUẢN LÝ KHÁCH HÀNG</h3>
                <small class="text-muted">Hệ thống lưu trữ dữ liệu hội viên KMN COFFEE</small>
            </div>
            <div>
                <a href="hoadon" class="btn btn-outline-dark fw-bold me-2"><i class="fas fa-file-invoice-dollar me-1"></i> Bán Hàng</a>
                <button type="button" class="btn btn-primary fw-bold" data-bs-toggle="modal" data-bs-target="#modalAddKH">
                    <i class="fas fa-user-plus me-1"></i> Thêm Khách Hàng
                </button>
            </div>
        </div>

        <!-- BẢNG DANH SÁCH -->
        <div class="card shadow-sm border-0 rounded-4">
            <div class="card-body p-0 table-custom">
                <table class="table table-hover align-middle mb-0">
                    <thead class="bg-light">
                        <tr>
                            <th class="py-3 px-4">Mã KH</th>
                            <th>Họ và Tên Khách Hàng</th>
                            <th>Số Điện Thoại</th>
                            <th class="text-center">Thao Tác</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white">
                        <c:forEach items="${listKH}" var="kh">
                            <tr>
                                <td class="fw-bold px-4 text-primary">${kh.maKH}</td>
                                <td class="fw-bold text-dark"><i class="fas fa-user-circle text-secondary me-2"></i> ${kh.ho} ${kh.dem} ${kh.ten}</td>
                                <td><span class="badge bg-light text-dark border"><i class="fas fa-phone-alt text-success me-1"></i> ${kh.sdt}</span></td>
                                <td class="text-center">
                                    <a href="khachhang?action=edit&id=${kh.maKH}" class="btn btn-sm btn-outline-warning fw-bold px-3">
                                        <i class="fas fa-edit me-1"></i> Sửa
                                    </a>
                                    <a href="khachhang?action=delete&id=${kh.maKH}" class="btn btn-sm btn-outline-danger fw-bold ms-1 px-3" 
                                       onclick="return confirm('Bạn có chắc chắn muốn xóa hồ sơ khách hàng ${kh.ho} ${kh.ten} không?');">
                                        <i class="fas fa-trash-alt me-1"></i> Xóa
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty listKH}">
                            <tr><td colspan="4" class="text-center py-5 text-muted">Chưa có khách hàng nào trong hệ thống.</td></tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- MODAL THÊM KHÁCH HÀNG -->
    <div class="modal fade" id="modalAddKH" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <form action="khachhang" method="post" class="modal-content border-0 shadow">
                <input type="hidden" name="action" value="add">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title fw-bold"><i class="fas fa-user-plus me-2"></i>THÊM KHÁCH HÀNG</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body p-4 bg-light">
                    <div class="bg-white p-3 rounded border shadow-sm">
                        <div class="mb-3">
                            <label class="fw-bold mb-1">Mã KH <span class="text-danger">*</span></label>
                            <input type="text" name="maKH" class="form-control" placeholder="VD: KH01" required>
                        </div>
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <label class="fw-bold mb-1">Họ</label>
                                <input type="text" name="ho" class="form-control" required>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label class="fw-bold mb-1">Đệm</label>
                                <input type="text" name="dem" class="form-control">
                            </div>
                            <div class="col-md-4 mb-3">
                                <label class="fw-bold mb-1">Tên <span class="text-danger">*</span></label>
                                <input type="text" name="ten" class="form-control" required>
                            </div>
                        </div>
                        <div class="mb-2">
                            <label class="fw-bold mb-1">Số Điện Thoại <span class="text-danger">*</span></label>
                            <input type="text" name="sdt" class="form-control" required>
                        </div>
                    </div>
                </div>
                <div class="modal-footer border-0 p-3 bg-white">
                    <button type="button" class="btn btn-secondary fw-bold px-4" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-primary fw-bold px-5">LƯU THÔNG TIN</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap Script -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>