<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Hồ Sơ Nhân Sự - KMN COFFEE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .text-coffee { color: #4B3621; }
        .table-custom { border-radius: 10px; overflow: hidden; box-shadow: 0 0 15px rgba(0,0,0,0.05); }
    </style>
</head>
<body class="d-flex bg-light">

    <jsp:include page="sidebar.jsp">
        <jsp:param name="active" value="nhanvien"/>
    </jsp:include>

    <div class="container-fluid p-4 w-100 overflow-auto" style="height: 100vh;">
        
        <div class="d-flex justify-content-between align-items-center mb-4 bg-white p-3 rounded-4 shadow-sm border-start border-5 border-success">
            <div>
                <h3 class="m-0 fw-bold text-dark"><i class="fas fa-users-cog me-2"></i>HỒ SƠ NHÂN SỰ</h3>
            </div>
            <div>
                <button type="button" class="btn btn-success fw-bold" data-bs-toggle="modal" data-bs-target="#modalAddNV">
                    <i class="fas fa-plus-circle me-1"></i> Thêm Nhân Viên
                </button>
            </div>
        </div>

        <div class="card shadow-sm border-0 rounded-4">
            <div class="card-body p-0 table-custom">
                <table class="table table-hover align-middle mb-0">
                    <thead class="bg-light">
                        <tr>
                            <th class="py-3 px-4">Mã NV</th>
                            <th>Họ và Tên</th>
                            <th>Giới tính</th>
                            <th>Chức vụ</th>
                            <th>SĐT</th>
                            <th>Lương (VNĐ)</th>
                            <th class="text-center">Thao tác</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white">
                        <c:forEach items="${listNV}" var="nv">
                            <tr>
                                <td class="fw-bold px-4 text-primary">${nv.maNV}</td>
                                <td class="fw-bold text-dark">${nv.ho} ${nv.dem} ${nv.ten}</td>
                                <td>${nv.gioiTinh}</td>
                                <td><span class="badge bg-info text-dark">${nv.chucVu}</span></td>
                                <td>${nv.sdt}</td>
                                <td class="fw-bold text-danger">${nv.luong}</td>
                                <td class="text-center">
                                    <a href="nhanvien?action=edit&id=${nv.maNV}" class="btn btn-sm btn-outline-warning fw-bold px-2">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <a href="nhanvien?action=delete&id=${nv.maNV}" class="btn btn-sm btn-outline-danger fw-bold ms-1 px-2" 
                                       onclick="return confirm('Xóa hồ sơ nhân viên này? Lịch làm việc liên quan cũng sẽ bị xóa!');">
                                        <i class="fas fa-trash-alt"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty listNV}">
                            <tr><td colspan="7" class="text-center py-5 text-muted">Chưa có nhân viên nào tại cơ sở này.</td></tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- MODAL THÊM NHÂN VIÊN -->
    <div class="modal fade" id="modalAddNV" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <form action="nhanvien" method="post" class="modal-content border-0 shadow">
                <input type="hidden" name="action" value="add">
                <div class="modal-header bg-success text-white">
                    <h5 class="modal-title fw-bold"><i class="fas fa-user-plus me-2"></i>THÊM NHÂN VIÊN</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body p-4 bg-light">
                    <div class="bg-white p-3 rounded border shadow-sm">
                        <div class="row">
                            <div class="col-md-3 mb-3">
                                <label class="fw-bold mb-1">Mã NV <span class="text-danger">*</span></label>
                                <input type="text" name="maNV" class="form-control" required>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label class="fw-bold mb-1">Họ <span class="text-danger">*</span></label>
                                <input type="text" name="ho" class="form-control" required>
                            </div>
                            <div class="col-md-3 mb-3">
                                <label class="fw-bold mb-1">Đệm</label>
                                <input type="text" name="dem" class="form-control">
                            </div>
                            <div class="col-md-3 mb-3">
                                <label class="fw-bold mb-1">Tên <span class="text-danger">*</span></label>
                                <input type="text" name="ten" class="form-control" required>
                            </div>
                            
                            <div class="col-md-6 mb-3">
                                <label class="fw-bold mb-1">Giới tính</label>
                                <select name="gioiTinh" class="form-select">
                                    <option value="Nam">Nam</option>
                                    <option value="Nữ">Nữ</option>
                                </select>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="fw-bold mb-1">Chức vụ <span class="text-danger">*</span></label>
                                <input type="text" name="chucVu" class="form-control" placeholder="VD: Pha chế" required>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="fw-bold mb-1">Số điện thoại <span class="text-danger">*</span></label>
                                <input type="text" name="sdt" class="form-control" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="fw-bold mb-1">Mức lương <span class="text-danger">*</span></label>
                                <input type="number" name="luong" class="form-control" required>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer border-0 p-3 bg-white">
                    <button type="button" class="btn btn-secondary fw-bold px-4" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-success fw-bold px-5">LƯU NHÂN VIÊN</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap Script -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>