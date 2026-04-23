<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hệ thống chi nhánh - KMN COFFEE</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .bg-brown { background-color: #5D4037 !important; }
            .text-brown { color: #5D4037 !important; }
            .card-branch { border-radius: 15px; border: none; transition: 0.3s; }
            .card-branch:hover { transform: translateY(-5px); box-shadow: 0 10px 20px rgba(0,0,0,0.1); }
        </style>
    </head>
    <body style="background-color: #F5F5DC;">
        <div class="container text-center mt-4">
             <h1 class="fw-bold text-brown">☕ KMN COFFEE</h1>
        </div>

        <div class="container mt-5">
            <h2 class="text-center mb-5 fw-bold text-brown">HỆ THỐNG CHI NHÁNH</h2>
            <div class="row">
                <c:forEach items="${listB}" var="b">
                    <div class="col-md-4 mb-4">
                        <div class="card h-100 card-branch shadow-sm">
                            <div class="card-header bg-brown text-white text-center py-3" style="border-radius: 15px 15px 0 0;">
                                <h5 class="mb-0 text-uppercase">${b.tenCN}</h5>
                            </div>
                            <div class="card-body">
                                <p><strong>📍 Địa chỉ:</strong> ${b.diaChi}</p>
                                <p><strong>📞 Hotline:</strong> <span class="text-danger fw-bold">${b.soDienThoai}</span></p>
                                <p><strong>👤 Quản lý:</strong> ${b.quanLy}</p>
                                <hr>
                                <a href="#" class="btn btn-outline-dark w-100">Xem trên bản đồ</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        
        <div class="text-center mt-4 mb-5">
            <a href="menu" class="btn btn-secondary">Quay lại thực đơn</a>
        </div>
    </body>
</html>