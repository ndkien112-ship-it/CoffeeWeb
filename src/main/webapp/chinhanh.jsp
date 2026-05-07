<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Hệ Thống Chi Nhánh - KMN COFFEE</title>
    <!-- Thư viện Bootstrap & FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .text-coffee { color: #4B3621; }
        .table-custom { border-radius: 10px; overflow: hidden; box-shadow: 0 0 15px rgba(0,0,0,0.05); }
    </style>
</head>
<body class="d-flex bg-light">

    <!-- Nhúng Sidebar của hệ thống -->
    <jsp:include page="sidebar.jsp">
        <jsp:param name="active" value="branch"/>
    </jsp:include>

    <!-- NỘI DUNG CHÍNH -->
    <div class="container-fluid p-4 w-100 overflow-auto" style="height: 100vh;">
        
        <!-- Header -->
        <div class="d-flex justify-content-between align-items-center mb-4 bg-white p-3 rounded-4 shadow-sm border-start border-5" style="border-color: #4B3621 !important;">
            <div>
                <h3 class="m-0 fw-bold text-coffee"><i class="fas fa-store me-2"></i>HỆ THỐNG CHI NHÁNH</h3>
                <small class="text-muted">Quản lý và chọn cơ sở KMN COFFEE để làm việc</small>
            </div>
            <div>
                <button class="btn btn-primary fw-bold px-4" data-bs-toggle="modal" data-bs-target="#modalAddBranch">
                    <i class="fas fa-plus-circle me-2"></i>Thêm Chi Nhánh Mới
                </button>
            </div>
        </div>

        <!-- Bảng Danh sách Chi nhánh -->
        <div class="card shadow-sm border-0 rounded-4">
            <div class="card-body p-0 table-custom">
                <table class="table table-hover align-middle mb-0">
                    <thead class="bg-dark text-white">
                        <tr>
                            <th class="py-3 px-4">Mã CN</th>
                            <th>Tên Chi Nhánh</th>
                            <th>Địa Chỉ</th>
                            <th>Liên Hệ</th>
                            <th class="text-center">Thao Tác</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white">
                        <c:forEach items="${listB}" var="b">
                            <tr>
                                <td class="fw-bold px-4 text-primary">${b.maCN}</td>
                                <td class="fw-bold text-dark fs-5">${b.tenCN}</td>
                                <td>${b.diaChiCuThe}, ${b.tinh}</td>
                                <td>
                                    <div><i class="fas fa-phone-alt text-success me-1"></i> ${b.sdt}</div>
                                    <div class="small text-muted"><i class="fas fa-envelope me-1"></i> ${b.email}</div>
                                </td>
                                <td class="text-center">
                                    
                                    <!-- NÚT CHỌN CHI NHÁNH (Lưu Session) -->
                                    <a href="branch?action=select&id=${b.maCN}" class="btn btn-sm btn-success fw-bold px-3 me-1">
                                        <i class="fas fa-sign-in-alt me-1"></i> Quản lý
                                    </a>
                                    
                                    <!-- Nút Sửa & Xóa -->
                                    <a href="editBranch?id=${b.maCN}" class="btn btn-sm btn-outline-warning fw-bold px-3">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <a href="branch?action=delete&id=${b.maCN}" class="btn btn-sm btn-outline-danger fw-bold ms-1 px-3" 
                                       onclick="return confirm('Bạn có chắc chắn muốn xóa chi nhánh này không? Mọi dữ liệu liên quan có thể bị ảnh hưởng!');">
                                        <i class="fas fa-trash-alt"></i>
                                    </a>
                                    
                                </td>
                            </tr>
                        </c:forEach>
                        
                        <!-- Hiển thị khi danh sách trống -->
                        <c:if test="${empty listB}">
                            <tr>
                                <td colspan="5" class="text-center py-5 text-muted">
                                    <i class="fas fa-store-slash fs-1 mb-3 d-block text-black-50"></i>
                                    Chưa có dữ liệu chi nhánh nào trong hệ thống.
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- ================= MODAL THÊM CHI NHÁNH MỚI ================= -->
    <div class="modal fade" id="modalAddBranch" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <form action="branch" method="post" class="modal-content border-0 shadow">
                <!-- Action để phân biệt với các form khác nếu cần -->
                <input type="hidden" name="action" value="add">
                
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title fw-bold"><i class="fas fa-plus-circle me-2"></i>THÊM CHI NHÁNH MỚI</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                
                <div class="modal-body p-4 bg-light">
                    <div class="bg-white p-3 rounded border shadow-sm">
                        <div class="mb-3">
                            <label class="fw-bold mb-1">Mã Chi Nhánh <span class="text-danger">*</span></label>
                            <input type="text" name="maCN" class="form-control" placeholder="VD: CN01" required>
                        </div>
                        <div class="mb-3">
                            <label class="fw-bold mb-1">Tên Chi Nhánh <span class="text-danger">*</span></label>
                            <input type="text" name="tenCN" class="form-control" placeholder="VD: KMN Coffee - Cầu Giấy" required>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label class="fw-bold mb-1">Tỉnh/Thành phố <span class="text-danger">*</span></label>
                                <input type="text" name="tinh" class="form-control" placeholder="Hà Nội" required>
                            </div>
                            <div class="col-md-6">
                                <label class="fw-bold mb-1">Số Điện Thoại <span class="text-danger">*</span></label>
                                <input type="text" name="sdt" class="form-control" required>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="fw-bold mb-1">Địa Chỉ Cụ Thể <span class="text-danger">*</span></label>
                            <input type="text" name="diaChiCuThe" class="form-control" placeholder="Số 1, đường ABC..." required>
                        </div>
                        <div class="mb-2">
                            <label class="fw-bold mb-1">Email Liên Hệ</label>
                            <input type="email" name="email" class="form-control" placeholder="example@kmn.com">
                        </div>
                    </div>
                </div>
                
                <div class="modal-footer border-0 p-3 bg-white">
                    <button type="button" class="btn btn-secondary fw-bold px-4" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-primary fw-bold px-5">LƯU CHI NHÁNH</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Script Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>