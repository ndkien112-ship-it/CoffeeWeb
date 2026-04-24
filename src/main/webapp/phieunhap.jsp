<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Phiếu nhập kho - KMN COFFEE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root { --coffee-dark: #4B3621; --coffee-light: #FDF5E6; --coffee-accent: #D2B48C; }
        body { background-color: var(--coffee-light); display: flex; min-height: 100vh; }
        
        /* CSS Sidebar */
        #sidebar { min-width: 280px; background: var(--coffee-dark); color: white; }
        .nav-link { color: rgba(255,255,255,0.7); padding: 12px 20px; transition: 0.3s; text-decoration: none; display: block; }
        .nav-link:hover, .nav-link.active { color: white; background: rgba(255,255,255,0.1); border-left: 4px solid var(--coffee-accent); }
        
        /* CSS Nội dung */
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
            <a href="employee" class="nav-link"><i class="fas fa-users me-2"></i> Nhân sự</a>
            <a href="assignment" class="nav-link"><i class="fas fa-calendar-check me-2"></i> Phân ca</a>
            <a href="invoices" class="nav-link"><i class="fas fa-receipt me-2"></i> Hóa đơn</a>
            <a href="imports" class="nav-link active"><i class="fas fa-truck-loading me-2"></i> Nhập hàng kho</a>
        </div>
    </nav>

    <main class="main-content">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="fw-bold m-0" style="color: var(--coffee-dark);">📦 LỊCH SỬ NHẬP KHO NGUYÊN LIỆU</h2>
            <button class="btn btn-success fw-bold px-4 shadow-sm">
                <i class="fas fa-plus-circle me-2"></i> Tạo phiếu nhập mới
            </button>
        </div>

        <div class="table-container">
            <table class="table table-hover align-middle text-center">
                <thead class="table-dark">
                    <tr>
                        <th>Mã Phiếu</th>
                        <th>Ngày nhập</th>
                        <th>Mã Nhà Cung Cấp</th>
                        <th>Chi nhánh nhận</th>
                        <th>Tổng tiền hàng</th>
                        <th>Trạng thái thanh toán</th>
                        <th>Chi tiết</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${listP}" var="p">
                        <tr>
                            <td class="fw-bold text-primary">${p.maPhieu}</td>
                            <td>${p.ngayNhap}</td>
                            <td><span class="badge bg-secondary">${p.maNCC}</span></td>
                            <td><span class="badge bg-info text-dark">${p.maCN}</span></td>
                            <td class="text-danger fw-bold fs-5">${p.thanhTien} đ</td>
                            <td>
                                <c:choose>
                                    <c:when test="${p.ttThanhToan == 'Đã thanh toán'}">
                                        <span class="badge bg-success"><i class="fas fa-check-circle me-1"></i> Đã thanh toán</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-warning text-dark"><i class="fas fa-clock me-1"></i> Công nợ</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <button class="btn btn-sm btn-outline-dark"><i class="fas fa-eye"></i> Xem</button>
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