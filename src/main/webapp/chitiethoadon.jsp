<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chi Tiết Hóa Đơn - KMN COFFEE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="d-flex bg-light">

    <!-- Sidebar dùng chung của nhóm 10 -->
    <jsp:include page="sidebar.jsp">
        <jsp:param name="active" value="hoadon"/>
    </jsp:include>

    <div class="container-fluid p-4 w-100 overflow-auto" style="height: 100vh;">
        
        <div class="mb-4">
            <a href="hoadon" class="btn btn-outline-dark fw-bold">
                <i class="fas fa-arrow-left me-2"></i> Quay lại Danh sách Hóa Đơn
            </a>
        </div>

        <div class="card shadow-sm border-0 rounded-4">
            <div class="card-header bg-white border-bottom p-4">
                <h4 class="m-0 fw-bold" style="color: #4B3621;">
                    <i class="fas fa-receipt me-2"></i> CHI TIẾT HÓA ĐƠN: <span class="text-primary">#${maHD}</span>
                </h4>
            </div>
            <div class="card-body p-0">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-dark">
                        <tr>
                            <th class="py-3 px-4">Mã SP</th>
                            <th>Tên Đồ Uống</th>
                            <th class="text-center">Số Lượng</th>
                            <th class="text-end px-4">Giá Lúc Mua</th>
                            <th class="text-end px-4">Thành Tiền</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white">
                        <c:set var="tongTien" value="0" />
                        
                        <c:forEach items="${listDetail}" var="d">
                            <tr>
                                <td class="fw-bold px-4 text-secondary">${d.maSP}</td>
                                <td class="fw-bold text-primary"><i class="fas fa-coffee me-2 text-secondary"></i>${d.tenSanPham}</td>
                                <td class="text-center fw-bold fs-5">${d.soLuong}</td>
                                <td class="text-end px-4 text-muted">${d.giaLucMua} đ</td>
                                <td class="text-end px-4 fw-bold text-danger">
                                    ${d.soLuong * d.giaLucMua} đ
                                    <c:set var="tongTien" value="${tongTien + (d.soLuong * d.giaLucMua)}" />
                                </td>
                            </tr>
                        </c:forEach>
                        
                        <tr class="bg-light">
                            <td colspan="4" class="text-end py-3 fw-bold fs-5">TỔNG CỘNG ĐƠN HÀNG:</td>
                            <td class="text-end px-4 py-3 fw-bold fs-4 text-danger">${tongTien} đ</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>