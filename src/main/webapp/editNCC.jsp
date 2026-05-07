<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Sửa Nhà Cung Cấp - KMN COFFEE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-light">
    <div class="container mt-5" style="max-width: 500px;">
        <div class="card shadow border-0 rounded-4">
            <div class="card-header bg-secondary text-white fw-bold h5 py-3">
                <i class="fas fa-edit me-2"></i> CẬP NHẬT NHÀ CUNG CẤP
            </div>
            <div class="card-body p-4">
                <form action="sanpham" method="post">
                    <input type="hidden" name="action" value="updateNCC">
                    
                    <div class="mb-3">
                        <label class="fw-bold mb-1">Mã NCC</label>
                        <input type="text" name="maNCC" class="form-control bg-light" value="${nccEdit.maNCC}" readonly>
                    </div>
                    
                    <div class="mb-3">
                        <label class="fw-bold mb-1">Tên Nhà Cung Cấp <span class="text-danger">*</span></label>
                        <input type="text" name="tenNCC" class="form-control border-secondary-subtle" value="${nccEdit.tenNCC}" required>
                    </div>
                    
                    <div class="mb-3">
                        <label class="fw-bold mb-1">Số Điện Thoại</label>
                        <input type="text" name="sdt" class="form-control" value="${nccEdit.sdt}">
                    </div>
                    
                    <div class="mb-4">
                        <label class="fw-bold mb-1">Email</label>
                        <input type="email" name="email" class="form-control" value="${nccEdit.email}">
                    </div>
                    
                    <div class="d-flex justify-content-between mt-3">
                        <a href="sanpham" class="btn btn-light px-4 fw-bold">Hủy</a>
                        <button type="submit" class="btn btn-secondary fw-bold px-5">LƯU CẬP NHẬT</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>localStorage.setItem('activeTab_SanPham', '#doitac');</script>
</body>
</html>