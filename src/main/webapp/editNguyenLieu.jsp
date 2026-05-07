<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Sửa Nguyên Liệu - KMN COFFEE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-light">
    <div class="container mt-5" style="max-width: 500px;">
        <div class="card shadow border-0 rounded-4">
            <div class="card-header bg-warning text-dark fw-bold h5 py-3">
                <i class="fas fa-edit me-2"></i> CẬP NHẬT NGUYÊN LIỆU
            </div>
            <div class="card-body p-4">
                <form action="sanpham" method="post">
                    <input type="hidden" name="action" value="updateNL">
                    
                    <div class="mb-3">
                        <label class="fw-bold mb-1">Mã Nguyên Liệu</label>
                        <input type="text" name="maNL" class="form-control bg-light" value="${nlEdit.maNL}" readonly>
                    </div>
                    
                    <div class="mb-3">
                        <label class="fw-bold mb-1">Tên Nguyên Liệu <span class="text-danger">*</span></label>
                        <input type="text" name="tenNL" class="form-control border-warning-subtle" value="${nlEdit.tenNL}" required>
                    </div>
                    
                    <div class="mb-4">
                        <label class="fw-bold mb-1">Đơn Vị Tính <span class="text-danger">*</span></label>
                        <input type="text" name="donVi" class="form-control border-warning-subtle" value="${nlEdit.donVi}" required>
                    </div>
                    
                    <div class="d-flex justify-content-between mt-3">
                        <a href="sanpham" class="btn btn-secondary px-4 fw-bold">Hủy & Trở Về</a>
                        <button type="submit" class="btn btn-warning text-dark fw-bold px-5">LƯU CẬP NHẬT</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <script>
        localStorage.setItem('activeTab_SanPham', '#kho');
    </script>
</body>
</html>