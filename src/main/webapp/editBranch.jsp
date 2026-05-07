<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Sửa Chi Nhánh</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="bg-light d-flex justify-content-center align-items-center min-vh-100 py-4">
    <div class="card shadow p-4" style="width: 700px; border-radius: 15px;">
        <h4 class="fw-bold text-center text-warning mb-4"><i class="fas fa-edit me-2"></i>CẬP NHẬT CHI NHÁNH</h4>
        
        <form action="editBranch" method="post">
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label fw-bold">Mã chi nhánh</label>
                    <input type="text" class="form-control bg-light" name="maCN" value="${b.maCN}" readonly>
                </div>
                <div class="col-md-6 mb-3">
                    <label class="form-label fw-bold">Tên chi nhánh</label>
                    <input type="text" class="form-control" name="tenCN" value="${b.tenCN}" required>
                </div>
            </div>

            <div class="p-3 bg-white rounded-3 mb-3 border shadow-sm">
                <h6 class="fw-bold text-secondary mb-3"><i class="fas fa-map-marker-alt me-2"></i>Địa chỉ</h6>
                <div class="row">
                    <div class="col-md-4 mb-3">
                        <label class="form-label fw-bold">Tỉnh / TP</label>
                        <input type="text" class="form-control" name="tinh" value="${b.tinh}" required>
                    </div>
                    <div class="col-md-8 mb-3">
                        <label class="form-label fw-bold">Địa chỉ cụ thể</label>
                        <input type="text" class="form-control" name="diaChiCuThe" value="${b.diaChiCuThe}" required>
                    </div>
                </div>
            </div>

            <div class="p-3 bg-white rounded-3 mb-4 border shadow-sm">
                <h6 class="fw-bold text-secondary mb-3"><i class="fas fa-address-book me-2"></i>Thông tin liên hệ</h6>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">Số điện thoại</label>
                        <input type="text" class="form-control" name="sdt" value="${b.sdt}" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label fw-bold">Email</label>
                        <input type="text" class="form-control" name="email" value="${b.email}">
                    </div>
                </div>
            </div>

            <div class="d-flex gap-2">
                <a href="branch" class="btn btn-secondary w-50 fw-bold py-2">HỦY BỎ</a>
                <button type="submit" class="btn btn-warning w-50 fw-bold text-dark py-2">LƯU CẬP NHẬT</button>
            </div>
        </form>
    </div>
</body>
</html>