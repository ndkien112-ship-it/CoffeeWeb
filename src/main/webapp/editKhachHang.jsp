<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Sửa Khách Hàng - KMN COFFEE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="d-flex bg-light">

    <jsp:include page="sidebar.jsp">
        <jsp:param name="active" value="khachhang"/>
    </jsp:include>

    <div class="container-fluid p-4 w-100 overflow-auto" style="height: 100vh;">
        
        <div class="mb-4">
            <a href="khachhang" class="btn btn-outline-dark fw-bold">
                <i class="fas fa-arrow-left me-2"></i> Quay lại Danh sách Khách Hàng
            </a>
        </div>

        <div class="card shadow-sm border-0 rounded-4" style="max-width: 800px; margin: 0 auto;">
            <div class="card-header text-white" style="background-color: #ffc107;">
                <h4 class="m-0 fw-bold text-dark"><i class="fas fa-user-edit me-2"></i> CHỈNH SỬA KHÁCH HÀNG: #${kh.maKH}</h4>
            </div>
            
            <div class="card-body p-4">
                <form action="khachhang" method="post">
                    <!-- Báo cho Servlet biết đây là lệnh update -->
                    <input type="hidden" name="action" value="update">
                    <!-- Truyền ngầm mã KH để update -->
                    <input type="hidden" name="maKH" value="${kh.maKH}">

                    <div class="row">
                        <div class="col-md-4 mb-3">
                            <label class="fw-bold mb-1">Họ</label>
                            <input type="text" name="ho" class="form-control" value="${kh.ho}" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label class="fw-bold mb-1">Đệm</label>
                            <input type="text" name="dem" class="form-control" value="${kh.dem}">
                        </div>
                        <div class="col-md-4 mb-3">
                            <label class="fw-bold mb-1">Tên <span class="text-danger">*</span></label>
                            <input type="text" name="ten" class="form-control" value="${kh.ten}" required>
                        </div>
                        <div class="col-md-12 mb-4">
                            <label class="fw-bold mb-1">Số Điện Thoại <span class="text-danger">*</span></label>
                            <input type="text" name="sdt" class="form-control border-warning-subtle" value="${kh.sdt}" required>
                        </div>
                    </div>
                    
                    <div class="text-end">
                        <button type="submit" class="btn btn-warning fw-bold px-5 text-dark fs-5"><i class="fas fa-save me-2"></i> LƯU CẬP NHẬT</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>