<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark" style="width: 280px; height: 100vh; background-color: #4B3621 !important;">
    <a href="branch" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
        <i class="fas fa-coffee me-3 fs-3"></i>
        <span class="fs-4 fw-bold">KMN COFFEE</span>
    </a>
    <small class="text-secondary mb-4 ms-5">Hệ thống quản trị chuỗi</small>
    
    <ul class="nav nav-pills flex-column mb-auto">
        <li class="nav-item mb-2">
            <a href="branch" class="nav-link ${param.active == 'branch' ? 'active bg-success' : 'text-white'}" aria-current="page">
                <i class="fas fa-store me-2"></i> Hệ Thống Chi Nhánh
            </a>
        </li>
        
        <c:if test="${not empty activeBranchName}">
            <li class="mb-4">
                <div class="p-2 rounded bg-success bg-opacity-75 text-center shadow-sm border border-success">
                    <small class="d-block text-white-50"><i class="fas fa-map-marker-alt me-1"></i> Đang quản lý cơ sở:</small>
                    <strong class="text-warning">${activeBranchName}</strong>
                </div>
            </li>
        </c:if>

        <li class="nav-item mb-2">
            <a href="sanpham" class="nav-link ${param.active == 'sanpham' ? 'active bg-success' : 'text-white'}">
                <i class="fas fa-mug-hot me-2"></i> Thực đơn & Kho
            </a>
        </li>
        <li class="nav-item mb-2">
            <a href="nhanvien" class="nav-link ${param.active == 'nhanvien' ? 'active bg-success' : 'text-white'}">
                <i class="fas fa-users me-2"></i> Nhân viên
            </a>
        </li>
        <li class="nav-item mb-4">
            <a href="phanca" class="nav-link ${param.active == 'phanca' ? 'active bg-success' : 'text-white'}">
                <i class="fas fa-calendar-alt me-2"></i> Phân ca
            </a>
        </li>

        <li class="nav-item mb-2">
            <a href="hoadon" class="nav-link ${param.active == 'hoadon' ? 'active bg-success' : 'text-white'}">
                <i class="fas fa-file-invoice-dollar me-2"></i> Hóa đơn bán hàng
            </a>
        </li>
        <li class="nav-item mb-2">
            <a href="phieunhap" class="nav-link ${param.active == 'phieunhap' ? 'active bg-success' : 'text-white'}">
                <i class="fas fa-file-import me-2"></i> Phiếu nhập kho
            </a>
        </li>
    </ul>
    
    </div>