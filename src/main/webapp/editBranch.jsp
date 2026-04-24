<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Sửa Chi Nhánh - KMN COFFEE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root { --coffee-dark: #4B3621; --coffee-light: #FDF5E6; --coffee-accent: #D2B48C; }
        body { background-color: var(--coffee-light); display: flex; min-height: 100vh; }
        
        /* CSS Sidebar */
        #sidebar { min-width: 280px; background: var(--coffee-dark); color: white; }
        .nav-link { color: rgba(255,255,255,0.7); padding: 12px 20px; transition: 0.3s; text-decoration: none; display: block; }
        .nav-link:hover, .nav-link.active { color: white; background: rgba(255,255,255,0.1); border-left: 4px solid var(--coffee-accent); }
        
        /* CSS Form */
        .main-content { flex: 1; padding: 30px; }
        .form-container { background: white; padding: 30px; border-radius: 15px; box-shadow: 0 10px 20px rgba(0,0,0,0.1); max-width: 600px; margin: 0 auto; border-top: 5px solid var(--coffee-dark); }
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
            <a href="branch" class="nav-link active"><i class="fas fa-store me-2"></i> Chi nhánh</a>
            <a href="employee" class="nav-link"><i class="fas fa-users me-2"></i> Nhân sự</a>
            <a href="invoices" class="nav-link"><i class="fas fa-receipt me-2"></i> Hóa đơn</a>
        </div>
    </nav>

    <main class="main-content">
        <div class="form-container">
            <h3 class="text-center mb-4 fw-bold" style="color: var(--coffee-dark);">✏️ CẬP NHẬT CHI NHÁNH</h3>
            <form action="editBranchAction" method="post">
                <input type="hidden" name="id" value="${detail.maCN}">
                
                <div class="mb-3">
                    <label class="form-label fw-bold">Mã chi nhánh</label>
                    <input type="text" value="${detail.maCN}" class="form-control bg-light" disabled>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-bold">Tên chi nhánh</label>
                    <input type="text" name="tenCN" value="${detail.tenCN}" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-bold">Địa chỉ</label>
                    <input type="text" name="diaChi" value="${detail.diaChi}" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-bold">Số điện thoại</label>
                    <input type="text" name="sdt" value="${detail.soDienThoai}" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-bold">Người quản lý</label>
                    <input type="text" name="quanLy" value="${detail.quanLy}" class="form-control" required>
                </div>
                
                <div class="d-flex gap-3 mt-4">
                    <button type="submit" class="btn btn-success w-50 fw-bold py-2"><i class="fas fa-save me-2"></i> Lưu thay đổi</button>
                    <a href="branch" class="btn btn-secondary w-50 fw-bold py-2 text-center"><i class="fas fa-times me-2"></i> Hủy bỏ</a>
                </div>
            </form>
        </div>
    </main>
</body>
</html>