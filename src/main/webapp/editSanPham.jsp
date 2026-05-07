<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Cập Nhật Đồ Uống - KMN COFFEE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>.recipe-row { background-color: #f8f9fa; padding: 10px; border-radius: 8px; border: 1px dashed #ced4da; }</style>
</head>
<body class="bg-light d-flex justify-content-center align-items-center min-vh-100 py-4">

    <c:set var="spEdit" value="${null}" />
    <c:forEach items="${listSP}" var="sp"><c:if test="${sp.maSP == editId}"><c:set var="spEdit" value="${sp}" /></c:if></c:forEach>

    <div class="card shadow p-4" style="width: 850px; border-radius: 15px;">
        <h4 class="fw-bold text-center text-warning mb-4"><i class="fas fa-edit me-2"></i>CẬP NHẬT ĐỒ UỐNG</h4>
        
        <!-- ĐÃ ĐỔI ACTION THÀNH editProduct -->
        <form action="editProduct" method="post">
            
            <div class="bg-white p-3 rounded border shadow-sm mb-4">
                <h6 class="fw-bold text-warning border-bottom pb-2 mb-3">Thông Tin Chung</h6>
                <div class="row">
                    <div class="col-md-6 mb-3"><label class="fw-bold mb-1">Mã Sản Phẩm</label><input type="text" name="maSP" class="form-control bg-light" value="${spEdit.maSP}" readonly></div>
                    <div class="col-md-6 mb-3"><label class="fw-bold mb-1">Tên Đồ Uống</label><input type="text" name="tenSP" class="form-control" value="${spEdit.tenSP}" required></div>
                    <div class="col-md-12 mb-3"><label class="fw-bold mb-1">Mô Tả</label><textarea name="moTa" class="form-control" rows="2">${spEdit.moTa}</textarea></div>
                    <div class="col-md-6 mb-2"><label class="fw-bold mb-1">Giá (VNĐ)</label><input type="number" name="giaNiemYet" class="form-control" value="${spEdit.giaNiemYet}" required></div>
                </div>
            </div>

            <div class="bg-white p-3 rounded border shadow-sm mb-4">
                <h6 class="fw-bold text-warning border-bottom pb-2 mb-3 d-flex justify-content-between align-items-center">
                    <span>Định Lượng Công Thức</span>
                    <button type="button" class="btn btn-sm btn-outline-warning text-dark fw-bold" id="btn-add-ingredient"><i class="fas fa-plus"></i> Thêm nguyên liệu</button>
                </h6>
                <div id="recipe-container">
                    <c:set var="hasRecipe" value="false" />
                    <c:forEach items="${listPC}" var="pc">
                        <c:if test="${pc.maSP == editId}">
                            <c:set var="hasRecipe" value="true" />
                            <div class="row align-items-center mb-3 recipe-row">
                                <div class="col-md-6">
                                    <select name="maNL" class="form-select border-warning-subtle" required>
                                        <option value="">-- Chọn Nguyên Liệu --</option>
                                        <c:forEach items="${listNL}" var="nl"><option value="${nl.maNL}" ${nl.maNL == pc.maNL ? 'selected' : ''}>${nl.tenNL} (${nl.donVi})</option></c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-5">
                                    <input type="number" name="soLuongNL" class="form-control border-warning-subtle" step="0.01" value="${pc.dinhLuong}" required>
                                </div>
                                <div class="col-md-1 text-center"><button type="button" class="btn btn-outline-danger btn-sm btn-remove-row"><i class="fas fa-trash-alt"></i></button></div>
                            </div>
                        </c:if>
                    </c:forEach>
                    <c:if test="${not hasRecipe}">
                        <div class="row align-items-center mb-3 recipe-row">
                            <div class="col-md-6"><select name="maNL" class="form-select border-warning-subtle" required><option value="">-- Chọn Nguyên Liệu --</option><c:forEach items="${listNL}" var="nl"><option value="${nl.maNL}">${nl.tenNL} (${nl.donVi})</option></c:forEach></select></div>
                            <div class="col-md-5"><input type="number" name="soLuongNL" class="form-control border-warning-subtle" step="0.01" required></div>
                            <div class="col-md-1 text-center"><button type="button" class="btn btn-outline-danger btn-sm btn-remove-row"><i class="fas fa-trash-alt"></i></button></div>
                        </div>
                    </c:if>
                </div>
            </div>
            <div class="d-flex gap-2"><a href="sanpham" class="btn btn-secondary w-50 fw-bold py-2">HỦY BỎ</a><button type="submit" class="btn btn-warning text-dark w-50 fw-bold py-2">LƯU CẬP NHẬT</button></div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const container = document.getElementById('recipe-container');
            const btnAdd = document.getElementById('btn-add-ingredient');
            btnAdd.addEventListener('click', function() {
                const firstRow = container.querySelector('.recipe-row');
                if (firstRow) {
                    const newRow = firstRow.cloneNode(true);
                    newRow.querySelector('select').selectedIndex = 0;
                    newRow.querySelector('input').value = '';
                    container.appendChild(newRow);
                }
            });
            container.addEventListener('click', function(e) {
                const removeBtn = e.target.closest('.btn-remove-row');
                if (removeBtn) {
                    if (container.querySelectorAll('.recipe-row').length > 1) { removeBtn.closest('.recipe-row').remove(); } 
                    else { alert("Bắt buộc phải có ít nhất 1 nguyên liệu!"); }
                }
            });
        });
    </script>
</body>
</html>