<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Sửa Lịch Làm Việc - KMN COFFEE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-light">
    <div class="container mt-5" style="max-width: 600px;">
        <div class="card shadow border-0 rounded-4">
            <div class="card-header bg-warning text-dark fw-bold h5 py-3">
                <i class="fas fa-edit me-2"></i> CẬP NHẬT LỊCH LÀM VIỆC
            </div>
            <div class="card-body p-4">
                <form action="phanca" method="post">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="oldMaNV" value="${pcEdit.maNV}">
                    <input type="hidden" name="oldNgayLam" value="${pcEdit.ngayLam}">
                    <input type="hidden" name="oldCaLam" value="${pcEdit.caLam}">

                    <div class="mb-3">
                        <label class="fw-bold mb-1">Nhân Viên Phụ Trách <span class="text-danger">*</span></label>
                        <select name="maNV" class="form-select border-warning-subtle" required>
                            <c:forEach items="${listNV}" var="nv">
                                <option value="${nv.maNV}" ${nv.maNV == pcEdit.maNV ? 'selected' : ''}>
                                    ${nv.ho} ${nv.dem} ${nv.ten} - ${nv.chucVu}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="fw-bold mb-1">Ngày Làm <span class="text-danger">*</span></label>
                            <input type="date" name="ngayLam" class="form-control" value="${pcEdit.ngayLam}" required>
                        </div>
                        <div class="col-md-6 mb-4">
                            <label class="fw-bold mb-1">Ca Làm Việc <span class="text-danger">*</span></label>
                            <select name="caLam" class="form-select border-warning-subtle" required>
                                <option value="Ca Sáng" ${pcEdit.caLam == 'Ca Sáng' ? 'selected' : ''}>Ca Sáng (07:00 - 12:00)</option>
                                <option value="Ca Chiều" ${pcEdit.caLam == 'Ca Chiều' ? 'selected' : ''}>Ca Chiều (12:00 - 17:00)</option>
                                <option value="Ca Tối" ${pcEdit.caLam == 'Ca Tối' ? 'selected' : ''}>Ca Tối (17:00 - 22:30)</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="d-flex justify-content-between mt-3">
                        <a href="phanca" class="btn btn-secondary px-4 fw-bold">Hủy & Trở Về</a>
                        <button type="submit" class="btn btn-warning text-dark fw-bold px-5">LƯU CẬP NHẬT</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>