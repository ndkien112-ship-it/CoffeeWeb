<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Cập Nhật Phiếu Nhập - KMN COFFEE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .section-title { color: #0d6efd; font-weight: bold; font-size: 1.1rem; border-bottom: 2px solid #f0f0f0; padding-bottom: 10px; margin-bottom: 15px; }
        .import-row { background: #fdfdfd; }
    </style>
</head>
<body class="bg-light p-4">
    <div class="container" style="max-width: 1000px;">
        <div class="card shadow border-0 rounded-4">
            <div class="card-header bg-primary text-white py-3">
                <h5 class="mb-0 fw-bold"><i class="fas fa-edit me-2"></i>CẬP NHẬT PHIẾU NHẬP KHO</h5>
            </div>
            
            <form action="phieunhap" method="post" class="card-body p-4">
                <input type="hidden" name="action" value="update">
                
                <div class="bg-white p-4 rounded border shadow-sm mb-4">
                    <div class="section-title">Thông Tin Chung</div>
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="fw-bold mb-1">Mã Phiếu Nhập (Không được sửa)</label>
                            <input type="text" name="maPhieu" class="form-control bg-light" value="${pn.maPhieu}" readonly>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="fw-bold mb-1">Ngày Nhập</label>
                            <input type="date" name="ngayNhap" class="form-control" value="${pn.ngayNhap}" required>
                        </div>
                        <div class="col-md-12 mb-3">
                            <label class="fw-bold mb-1">Nhà Cung Cấp</label>
                            <select name="maNCC" class="form-select" required>
                                <c:forEach items="${listNCC}" var="ncc">
                                    <option value="${ncc.maNCC}" ${ncc.maNCC == pn.maNCC ? 'selected' : ''}>${ncc.tenNCC}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="fw-bold mb-1">Cơ Sở Nhận Hàng</label>
                            <select name="maCN" id="maCN_Edit" class="form-select border-primary" onchange="filterNV_Edit()" required>
                                <c:forEach items="${listCN}" var="cn">
                                    <option value="${cn.maCN}" ${cn.maCN == pn.maCN ? 'selected' : ''}>${cn.tenCN}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="fw-bold mb-1">Người Nhận (Họ Đệm Tên)</label>
                            <select name="maNV" id="maNV_Edit" class="form-select border-primary" required>
                                <c:forEach items="${listNV}" var="nv">
                                    <option value="${nv.maNV}" data-macn="${nv.maCN}" ${nv.maNV == pn.maNV ? 'selected' : ''}>
                                        ${nv.ho} ${nv.dem} ${nv.ten}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="fw-bold mb-1">Tổng Tiền (VNĐ)</label>
                            <input type="number" name="thanhTien" class="form-control" value="${pn.thanhTien}" required>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="fw-bold mb-1">Trạng Thái Thanh Toán</label>
                            <select name="ttThanhToan" class="form-select" required>
                                <option value="Đã thanh toán" ${pn.ttThanhToan == 'Đã thanh toán' ? 'selected' : ''}>Đã thanh toán</option>
                                <option value="Chưa thanh toán" ${pn.ttThanhToan == 'Chưa thanh toán' ? 'selected' : ''}>Chưa thanh toán</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="bg-white p-4 rounded border shadow-sm">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <div class="section-title border-0 mb-0 pb-0">Chi Tiết Nguyên Liệu</div>
                        <button type="button" class="btn btn-sm btn-outline-primary fw-bold" onclick="addImportRow()">
                            <i class="fas fa-plus"></i> Thêm Nguyên Liệu
                        </button>
                    </div>
                    <table class="table align-middle" id="importTable">
                        <thead>
                            <tr class="text-muted">
                                <th>Nguyên Liệu</th>
                                <th width="200">Số Lượng</th>
                                <th width="250">Đơn Giá Nhập</th>
                                <th width="50" class="text-center">Xóa</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listDetail}" var="dt">
                                <tr class="import-row">
                                    <td>
                                        <select name="maNL" class="form-select" required>
                                            <c:forEach items="${listNL}" var="nl">
                                                <option value="${nl.maNL}" ${nl.maNL == dt.maNL ? 'selected' : ''}>${nl.tenNL} (${nl.donVi})</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    <td><input type="number" step="0.1" name="soLuongNhap" class="form-control" value="${dt.soLuong}" required></td>
                                    <td><input type="number" name="donGiaNhap" class="form-control" value="${dt.donGiaNhap}" required></td>
                                    <td class="text-center"><button type="button" class="btn btn-link text-danger p-0" onclick="removeRow(this)"><i class="fas fa-trash-alt"></i></button></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="d-flex justify-content-between mt-4">
                    <a href="phieunhap" class="btn btn-secondary px-5 fw-bold">HỦY BỎ</a>
                    <button type="submit" class="btn btn-primary px-5 fw-bold">LƯU CẬP NHẬT</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        function filterNV_Edit() {
            var branchId = document.getElementById("maCN_Edit").value;
            var nvSelect = document.getElementById("maNV_Edit");
            var opts = nvSelect.options;
            for (var i = 1; i < opts.length; i++) {
                var isMatch = (opts[i].getAttribute("data-macn") === branchId);
                opts[i].hidden = !isMatch;
                opts[i].disabled = !isMatch;
            }
        }

        function addImportRow() {
            var table = document.getElementById("importTable").getElementsByTagName('tbody')[0];
            var newRow = table.insertRow();
            newRow.className = "import-row";
            var optionsHtml = document.querySelector('select[name="maNL"]').innerHTML;
            newRow.innerHTML = '<td><select name="maNL" class="form-select" required>' + optionsHtml + '</select></td>' +
                               '<td><input type="number" step="0.1" name="soLuongNhap" class="form-control" required></td>' +
                               '<td><input type="number" name="donGiaNhap" class="form-control" required></td>' +
                               '<td class="text-center"><button type="button" class="btn btn-link text-danger p-0" onclick="removeRow(this)"><i class="fas fa-trash-alt fs-5"></i></button></td>';
        }

        function removeRow(btn) { btn.parentNode.parentNode.remove(); }
        
        document.addEventListener("DOMContentLoaded", filterNV_Edit);
    </script>
</body>
</html>