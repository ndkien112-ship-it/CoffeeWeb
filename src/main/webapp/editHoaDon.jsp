<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh Sửa Hóa Đơn - KMN COFFEE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .invoice-row { background-color: #fcfcfc; padding: 15px; border-radius: 8px; border: 1px dashed #dee2e6; }
    </style>
</head>
<body class="d-flex bg-light">

    <jsp:include page="sidebar.jsp">
        <jsp:param name="active" value="hoadon"/>
    </jsp:include>

    <div class="container-fluid p-4 w-100 overflow-auto" style="height: 100vh;">
        
        <a href="hoadon" class="btn btn-outline-dark bg-white fw-bold mb-4 shadow-sm">
            <i class="fas fa-arrow-left me-2"></i> Quay lại Danh sách Hóa Đơn
        </a>

        <div class="card shadow-sm border-0 rounded-4" style="max-width: 1000px;">
            <div class="card-header bg-warning text-dark py-3 rounded-top-4 border-0">
                <h4 class="mb-0 fw-bold"><i class="fas fa-edit me-2"></i>CHỈNH SỬA HÓA ĐƠN: #${hd.maHD}</h4>
            </div>
            
            <form action="hoadon" method="post" class="card-body p-4 p-md-5">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="maHD" value="${hd.maHD}">
                <input type="hidden" name="maCN" value="${hd.maCN}">

                <h5 class="fw-bold text-dark border-bottom border-warning pb-2 mb-4">Thông Tin Chung</h5>
                <div class="row mb-5">
                    
                    <div class="col-md-12 mb-4">
                        <label class="fw-bold mb-1">Thu Ngân (Người lập) <span class="text-danger">*</span></label>
                        <select name="maNV" class="form-select border-warning-subtle bg-light" required>
                            <c:forEach items="${listNV}" var="nv">
                                <option value="${nv.maNV}" ${nv.maNV == hd.maNV ? 'selected' : ''}>
                                    ${nv.ho} ${nv.dem} ${nv.ten}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    
                    <div class="col-md-6 mb-3">
                        <label class="fw-bold mb-1">Khách Hàng</label>
                        <select name="maKH" class="form-select border-warning-subtle bg-light">
                            <option value="">Khách lẻ (Không lưu thông tin)</option>
                            <c:forEach items="${listKH}" var="kh">
                                <option value="${kh.maKH}" ${kh.maKH == hd.maKH ? 'selected' : ''}>
                                    ${kh.ho} ${kh.dem} ${kh.ten}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    
                    <div class="col-md-6 mb-3">
                        <label class="fw-bold mb-1">Phương Thức Thanh Toán</label>
                        <select name="phuongThucTT" class="form-select border-warning-subtle bg-light">
                            <option value="Tiền mặt" ${hd.phuongThucTT == 'Tiền mặt' ? 'selected' : ''}>Tiền mặt</option>
                            <option value="Chuyển khoản" ${hd.phuongThucTT == 'Chuyển khoản' ? 'selected' : ''}>Chuyển khoản ngân hàng</option>
                            <option value="Thẻ tín dụng" ${hd.phuongThucTT == 'Thẻ tín dụng' ? 'selected' : ''}>Thẻ tín dụng / Ghi nợ</option>
                        </select>
                    </div>
                </div>

                <div class="d-flex justify-content-between align-items-center border-bottom border-warning pb-2 mb-4">
                    <h5 class="fw-bold text-dark m-0">Chi Tiết Đồ Uống</h5>
                    <button type="button" class="btn btn-sm btn-outline-dark fw-bold px-3" id="btn-add-drink">
                        <i class="fas fa-plus"></i> Thêm món
                    </button>
                </div>

                <div id="invoice-container">
                    <c:forEach items="${listDetail}" var="dt">
                        <div class="row align-items-center mb-3 invoice-row">
                            <div class="col-md-6">
                                <label class="form-label text-muted small mb-1">Sản Phẩm <span class="text-danger">*</span></label>
                                <select name="maSP" class="form-select border-warning-subtle" required>
                                    <option value="">-- Chọn Đồ Uống --</option>
                                    <c:forEach items="${listSP}" var="sp">
                                        <option value="${sp.maSP}" ${sp.maSP == dt.maSP ? 'selected' : ''}>
                                            ${sp.tenSP} - ${sp.giaNiemYet}đ
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-5">
                                <label class="form-label text-muted small mb-1">Số Lượng <span class="text-danger">*</span></label>
                                <input type="number" name="soLuong" class="form-control border-warning-subtle" min="1" value="${dt.soLuong}" required>
                            </div>
                            <div class="col-md-1 text-center mt-4">
                                <button type="button" class="btn btn-outline-danger btn-sm btn-remove-row"><i class="fas fa-trash-alt"></i></button>
                            </div>
                        </div>
                    </c:forEach>
                    
                    <c:if test="${empty listDetail}">
                        <div class="row align-items-center mb-3 invoice-row">
                            <div class="col-md-6">
                                <label class="form-label text-muted small mb-1">Sản Phẩm <span class="text-danger">*</span></label>
                                <select name="maSP" class="form-select border-warning-subtle" required>
                                    <option value="">-- Chọn Đồ Uống --</option>
                                    <c:forEach items="${listSP}" var="sp">
                                        <option value="${sp.maSP}">${sp.tenSP} - ${sp.giaNiemYet}đ</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-md-5">
                                <label class="form-label text-muted small mb-1">Số Lượng <span class="text-danger">*</span></label>
                                <input type="number" name="soLuong" class="form-control border-warning-subtle" min="1" value="1" required>
                            </div>
                            <div class="col-md-1 text-center mt-4">
                                <button type="button" class="btn btn-outline-danger btn-sm btn-remove-row"><i class="fas fa-trash-alt"></i></button>
                            </div>
                        </div>
                    </c:if>
                </div>

                <div class="text-end mt-5 pt-3 border-top">
                    <button type="submit" class="btn btn-warning text-dark fw-bold px-5 py-2 fs-6">
                        <i class="fas fa-save me-2"></i> LƯU CẬP NHẬT
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const container = document.getElementById('invoice-container');
            const btnAdd = document.getElementById('btn-add-drink');

            btnAdd.addEventListener('click', function() {
                const firstRow = container.querySelector('.invoice-row');
                if (firstRow) {
                    const newRow = firstRow.cloneNode(true);
                    // Reset giá trị khi thêm dòng mới
                    newRow.querySelector('select').selectedIndex = 0;
                    newRow.querySelector('input').value = '1';
                    container.appendChild(newRow);
                }
            });

            container.addEventListener('click', function(e) {
                const removeBtn = e.target.closest('.btn-remove-row');
                if (removeBtn) {
                    if (container.querySelectorAll('.invoice-row').length > 1) {
                        removeBtn.closest('.invoice-row').remove();
                    } else {
                        alert("Hóa đơn bắt buộc phải có ít nhất 1 đồ uống!");
                    }
                }
            });
        });
    </script>
</body>
</html>