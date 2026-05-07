<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Phân Ca Làm Việc - KMN COFFEE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .text-coffee { color: #4B3621; }
        .table-custom { border-radius: 10px; overflow: hidden; box-shadow: 0 0 15px rgba(0,0,0,0.05); }
    </style>
</head>
<body class="d-flex bg-light">

    <jsp:include page="sidebar.jsp">
        <jsp:param name="active" value="phanca"/>
    </jsp:include>

    <div class="container-fluid p-4 w-100 overflow-auto" style="height: 100vh;">
        
        <div class="d-flex justify-content-between align-items-center mb-4 bg-white p-3 rounded-4 shadow-sm border-start border-5" style="border-color: #4B3621 !important;">
            <div>
                <h3 class="m-0 fw-bold text-coffee"><i class="fas fa-calendar-alt me-2"></i>PHÂN CA LÀM VIỆC</h3>
                <small class="text-muted">Lên lịch làm việc cho nhân sự tại cơ sở</small>
            </div>
            <div>
                <button type="button" class="btn btn-primary fw-bold" data-bs-toggle="modal" data-bs-target="#modalAddShift">
                    <i class="fas fa-plus-circle me-1"></i> Phân Ca Mới
                </button>
            </div>
        </div>

        <div class="card shadow-sm border-0 rounded-4">
            <div class="card-body p-0 table-custom">
                <table class="table table-hover align-middle mb-0">
                    <thead class="bg-dark text-white">
                        <tr>
                            <th class="py-3 px-4">Ngày Làm</th>
                            <th>Ca Làm Việc</th>
                            <th>Nhân Viên Phụ Trách</th>
                            <th class="text-center">Thao Tác</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white">
                        <c:forEach items="${listPC}" var="pc">
                            <tr>
                                <td class="fw-bold px-4 text-primary">${pc.ngayLam}</td>
                                <td>
                                    <span class="badge bg-info text-dark fw-bold border"><i class="fas fa-clock me-1"></i> ${pc.caLam} (${pc.gioBatDau} - ${pc.gioKetThuc})</span>
                                </td>
                                <td class="fw-bold text-dark"><i class="fas fa-user-circle text-secondary me-2"></i> ${pc.tenNV}</td>
                                <td class="text-center">
                                    <a href="phanca?action=edit&maNV=${pc.maNV}&ngayLam=${pc.ngayLam}&caLam=${pc.caLam}" class="btn btn-sm btn-outline-warning fw-bold px-3">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <a href="phanca?action=delete&maNV=${pc.maNV}&ngayLam=${pc.ngayLam}&caLam=${pc.caLam}" class="btn btn-sm btn-outline-danger fw-bold ms-1 px-3" 
                                       onclick="return confirm('Bạn có chắc chắn muốn xóa ca làm này không?');">
                                        <i class="fas fa-trash-alt"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty listPC}">
                            <tr><td colspan="4" class="text-center py-5 text-muted">Chưa có lịch phân ca nào được tạo.</td></tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalAddShift" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <form action="phanca" method="post" class="modal-content border-0 shadow">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title fw-bold"><i class="fas fa-calendar-plus me-2"></i>THÊM LỊCH LÀM VIỆC</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                
                <div class="modal-body p-4 bg-light">
                    <div class="bg-white p-3 rounded border shadow-sm">
                        
                        <div class="mb-3">
                            <label class="fw-bold mb-1">Nhân Viên <span class="text-danger">*</span></label>
                            <select name="maNV" class="form-select border-primary-subtle" required>
                                <option value="">-- Chọn Nhân Viên --</option>
                                <c:forEach items="${listNV}" var="nv">
                                    <option value="${nv.maNV}">${nv.ho} ${nv.dem} ${nv.ten} - ${nv.chucVu}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="fw-bold mb-1">Ngày Làm <span class="text-danger">*</span></label>
                                <input type="date" name="ngayLam" class="form-control" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="fw-bold mb-1">Ca Làm Việc <span class="text-danger">*</span></label>
                                <select name="caLam" class="form-select border-primary-subtle" required>
                                    <option value="">-- Chọn Ca Làm Việc --</option>
                                    <option value="Ca Sáng">Ca Sáng (07:00 - 12:00)</option>
                                    <option value="Ca Chiều">Ca Chiều (12:00 - 17:00)</option>
                                    <option value="Ca Tối">Ca Tối (17:00 - 22:30)</option>
                                </select>
                            </div>
                        </div>

                    </div>
                </div>
                
                <div class="modal-footer border-0 p-3 bg-white">
                    <button type="button" class="btn btn-secondary fw-bold px-4" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-primary fw-bold px-5">LƯU LỊCH</button>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>