<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Quản lý Nhân sự - Coffee Chain</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #FDF5E6; color: #4B3621; }
        .header-section { background-color: #6F4E37; color: white; padding: 20px; border-radius: 0 0 20px 20px; }
        .card-custom { border: none; border-radius: 15px; box-shadow: 0 4px 12px rgba(0,0,0,0.1); margin-top: -30px; background: white; }
        .btn-coffee { background-color: #6F4E37; color: white; border-radius: 8px; }
        .btn-coffee:hover { background-color: #4B3621; color: white; }
        .badge-shift { font-size: 0.85rem; padding: 5px 10px; }
    </style>
</head>
<body>

    <div class="header-section text-center">
        <h2>👥 HỆ THỐNG QUẢN TRỊ NHÂN SỰ</h2>
        <p>Quản lý đội ngũ & Phân ca làm việc tập trung</p>
    </div>

    <div class="container mb-5">
        <div class="card card-custom p-4">
            <div class="row g-3 mb-4">
                <div class="col-md-4">
                    <label class="form-label fw-bold">Tìm nhân viên</label>
                    <input type="text" class="form-control" placeholder="Nhập tên hoặc mã NV...">
                </div>
                <div class="col-md-3">
                    <label class="form-label fw-bold">Chi nhánh</label>
                    <select class="form-select">
                        <option>Tất cả chi nhánh</option>
                        <option>Chi nhánh Quận 1</option>
                        <option>Chi nhánh Thủ Đức</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <label class="form-label fw-bold">Ca trực</label>
                    <select class="form-select">
                        <option>Tất cả ca</option>
                        <option>Sáng (07:00 - 12:00)</option>
                        <option>Chiều (12:00 - 17:00)</option>
                        <option>Tối (17:00 - 22:00)</option>
                    </select>
                </div>
                <div class="col-md-2 d-flex align-items-end">
                    <button class="btn btn-coffee w-100">Lọc</button>
                </div>
            </div>

            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead style="background-color: #f8f9fa;">
                        <tr>
                            <th>Mã NV</th>
                            <th>Họ Tên</th>
                            <th>Chức Vụ</th>
                            <th>Chi Nhánh</th>
                            <th>Ca Hiện Tại</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><strong>NV001</strong></td>
                            <td>Nguyễn Hoàng Nam</td>
                            <td>Quản lý</td>
                            <td>Chi nhánh Quận 1</td>
                            <td><span class="badge bg-success badge-shift">Ca Sáng</span></td>
                            <td>
                                <button class="btn btn-sm btn-outline-primary">Sửa</button>
                                <button class="btn btn-sm btn-outline-danger">Xóa</button>
                            </td>
                        </tr>
                        <tr>
                            <td><strong>NV002</strong></td>
                            <td>Lê Thị Mỹ Linh</td>
                            <td>Pha chế</td>
                            <td>Chi nhánh Thủ Đức</td>
                            <td><span class="badge bg-warning text-dark badge-shift">Ca Chiều</span></td>
                            <td>
                                <button class="btn btn-sm btn-outline-primary">Sửa</button>
                                <button class="btn btn-sm btn-outline-danger">Xóa</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <div class="text-end mt-3">
                <button class="btn btn-success">+ Thêm nhân viên mới</button>
            </div>
        </div>
    </div>

</body>
<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #4B3621; margin-bottom: 20px;">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">☕ COFFEE MANAGEMENT</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="menu">Quản lý Đồ uống</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="nhanvien.jsp">Quản lý Nhân sự</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Chi nhánh</a>
                </li>
            </ul>
            <span class="navbar-text text-warning">Xin chào, Admin!</span>
        </div>
    </div>
</nav>
</html>