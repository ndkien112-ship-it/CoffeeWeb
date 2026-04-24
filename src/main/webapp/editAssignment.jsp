<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Cập nhật trạng thái ca - KMN COFFEE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root { --coffee-dark: #4B3621; --coffee-light: #FDF5E6; --coffee-accent: #D2B48C; }
        body { background-color: var(--coffee-light); }
        .form-container { background: white; padding: 30px; border-radius: 15px; box-shadow: 0 10px 20px rgba(0,0,0,0.1); max-width: 500px; margin: 50px auto; border-top: 5px solid var(--coffee-dark); }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <h3 class="text-center mb-4 fw-bold" style="color: var(--coffee-dark);">✏️ CHẤM CÔNG CA LÀM</h3>
            <form action="editAssignmentAction" method="post">
                <input type="hidden" name="maNV" value="${detail.maNV}">
                <input type="hidden" name="maCa" value="${detail.maCa}">
                <input type="hidden" name="ngayLam" value="${detail.ngayLam}">
                
                <div class="mb-3">
                    <label class="form-label fw-bold">Nhân viên</label>
                    <input type="text" value="${detail.tenNV} (${detail.maNV})" class="form-control bg-light" disabled>
                </div>
                <div class="mb-3">
                    <label class="form-label fw-bold">Ca làm việc</label>
                    <input type="text" value="${detail.tenCa} - Ngày: ${detail.ngayLam}" class="form-control bg-light" disabled>
                </div>
                
                <div class="mb-4">
                    <label class="form-label fw-bold text-danger">Cập nhật trạng thái</label>
                    <select name="trangThai" class="form-select border-danger">
                        <option value="Chưa làm" ${detail.trangThai == 'Chưa làm' ? 'selected' : ''}>⏳ Chưa làm</option>
                        <option value="Đã làm" ${detail.trangThai == 'Đã làm' ? 'selected' : ''}>✅ Đã làm (Chấm công)</option>
                        <option value="Nghỉ phép" ${detail.trangThai == 'Nghỉ phép' ? 'selected' : ''}>❌ Nghỉ phép</option>
                    </select>
                </div>
                
                <div class="d-flex gap-2">
                    <button type="submit" class="btn btn-success w-50 fw-bold"><i class="fas fa-save me-2"></i> Lưu cập nhật</button>
                    <a href="assignment" class="btn btn-secondary w-50 fw-bold text-center"><i class="fas fa-times me-2"></i> Hủy</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>