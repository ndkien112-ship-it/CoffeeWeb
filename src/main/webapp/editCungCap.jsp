<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Sửa Báo Giá - KMN COFFEE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-light">
    <div class="container mt-5" style="max-width: 500px;">
        <div class="card shadow border-0 rounded-4">
            <div class="card-header bg-info text-dark fw-bold h5 py-3">
                <i class="fas fa-tags me-2"></i> CẬP NHẬT BÁO GIÁ
            </div>
            <div class="card-body p-4">
                <form action="sanpham" method="post">
                    <input type="hidden" name="action" value="updateCC">
                    <input type="hidden" name="maNCC" value="${ccEdit.maNCC}">
                    <input type="hidden" name="maNL" value="${ccEdit.maNL}">
                    
                    <div class="mb-3">
                        <label class="fw-bold mb-1 text-muted">Nhà Cung Cấp</label>
                        <input type="text" class="form-control bg-light" value="${ccEdit.tenNCC}" readonly>
                    </div>
                    
                    <div class="mb-3">
                        <label class="fw-bold mb-1 text-muted">Nguyên Liệu</label>
                        <input type="text" class="form-control bg-light" value="${ccEdit.tenNL} (${ccEdit.donVi})" readonly>
                    </div>
                    
                    <div class="mb-4">
                        <label class="fw-bold mb-1">Đơn Giá Niêm Yết Mới (VNĐ) <span class="text-danger">*</span></label>
                        <input type="number" name="donGiaNiemYet" class="form-control border-info-subtle" value="${ccEdit.donGiaNiemYet}" required>
                    </div>
                    
                    <div class="d-flex justify-content-between mt-3">
                        <a href="sanpham" class="btn btn-light px-4 fw-bold">Hủy</a>
                        <button type="submit" class="btn btn-info fw-bold px-5">LƯU CẬP NHẬT</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>localStorage.setItem('activeTab_SanPham', '#doitac');</script>
</body>
</html>