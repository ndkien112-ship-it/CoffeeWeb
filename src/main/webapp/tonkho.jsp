<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản lý tồn kho - KMN COFFEE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root { --coffee-dark: #4B3621; --coffee-light: #FDF5E6; --coffee-accent: #D2B48C; }
        body { background-color: var(--coffee-light); display: flex; min-height: 100vh; }
        #sidebar { min-width: 280px; background: var(--coffee-dark); color: white; }
        .nav-link { color: rgba(255,255,255,0.7); padding: 12px 20px; transition: 0.3s; text-decoration: none; display: block; }
        .nav-link:hover, .nav-link.active { color: white; background: rgba(255,255,255,0.1); border-left: 4px solid var(--coffee-accent); }
        .main-content { flex: 1; padding: 30px; }
        .table-container { background: white; border-radius: 15px; padding: 25px; box-shadow: 0 5px 15px rgba(0,0,0,0.05); border-top: 5px solid var(--coffee-dark); }
    </style>
</head>
<body>
    <nav id="sidebar" class="shadow">
        <div class="p-4 text-center border-bottom border-secondary">
            <h4 class="fw-bold mb-0">☕ KMN COFFEE</h4>
        </div>
        <div class="py-4">
            <a href="admin" class="nav-link"><i class="fas fa-chart-line me-2"></i> Dashboard</a>
            <a href="menu" class="nav-link"><i class="fas fa-coffee me-2"></i> Thực đơn</a>
            <a href="branch" class="nav-link"><i class="fas fa-store me-2"></i> Chi nhánh</a>
            <a href="inventory" class="nav-link active"><i class="fas fa-boxes me-2"></i> Tồn kho</a>
            <a href="employee" class="nav-link"><i class="fas fa-users me-2"></i> Nhân sự</a>
            <a href="invoices" class="nav-link"><i class="fas fa-receipt me-2"></i> Hóa đơn</a>
        </div>
    </nav>

    <main class="main-content">
        <h2 class="fw-bold mb-4" style="color: var(--coffee-dark);">📦 QUẢN LÝ TỒN KHO NGUYÊN LIỆU</h2>
        
        <div class="table-container">
            <table class="table table-hover align-middle text-center">
                <thead class="table-dark">
                    <tr>
                        <th>Tên Nguyên Liệu</th>
                        <th>Chi Nhánh</th>
                        <th>Số lượng tồn</th>
                        <th>Đơn vị tính</th>
                        <th>Trạng thái</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listI}" var="i">
                        <tr>
                            <td class="fw-bold">${i.tenNL}</td>
                            <td><span class="badge bg-info text-dark">${i.tenCN}</span></td>
                            <td class="fs-5 fw-bold">${i.soLuong}</td>
                            <td>${i.donVi}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${i.soLuong < 5}">
                                        <span class="badge bg-danger">Sắp hết hàng!</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-success">Còn hàng</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>