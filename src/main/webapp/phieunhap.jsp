<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản Lý Phiếu Nhập Kho - KMN COFFEE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .text-coffee { color: #4B3621; }
        .table-custom { border-radius: 10px; overflow: hidden; box-shadow: 0 0 15px rgba(0,0,0,0.05); }
        .section-title { color: #0d6efd; font-weight: bold; font-size: 1.1rem; border-bottom: 2px solid #f0f0f0; padding-bottom: 10px; margin-bottom: 15px; }
        .import-row { background: #fdfdfd; }
    </style>
</head>
<body class="d-flex bg-light">

    <jsp:include page="sidebar.jsp">
        <jsp:param name="active" value="phieunhap"/>
    </jsp:include>

    <div class="container-fluid p-4 w-100 overflow-auto" style="height: 100vh;">
        
        <div class="d-flex justify-content-between align-items-center mb-4 bg-white p-3 rounded-4 shadow-sm border-start border-5" style="border-color: #4B3621 !important;">
            <div>
                <h3 class="m-0 fw-bold text-coffee"><i class="fas fa-file-invoice me-2"></i>QUẢN LÝ PHIẾU NHẬP KHO</h3>
                <small class="text-muted">Lịch sử nhập nguyên liệu từ nhà cung cấp</small>
            </div>
            <div>
                <button class="btn btn-primary fw-bold" data-bs-toggle="modal" data-bs-target="#modalAddPhieu">
                    <i class="fas fa-plus-circle me-1"></i> Tạo Phiếu Nhập
                </button>
            </div>
        </div>

        <div class="card shadow-sm border-0 rounded-4 p-4">
            <div class="table-custom">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-dark">
                        <tr>
                            <th class="py-3 px-4">Mã Phiếu</th>
                            <th>Ngày Nhập</th>
                            <th>Cơ Sở</th>
                            <th>Nhà Cung Cấp</th>
                            <th>Tổng Tiền</th>
                            <th>Trạng Thái</th>
                            <th class="text-center">Thao Tác</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white">
                        <c:forEach items="${listPN}" var="pn">
                            <tr>
                                <td class="fw-bold px-4 text-primary">${pn.maPhieu}</td>
                                <td class="fw-bold">${pn.ngayNhap}</td>
                                <td>${pn.tenCN}</td>
                                <td>${pn.tenNCC}</td>
                                <td class="fw-bold text-danger">${pn.thanhTien} đ</td>
                                <td>
                                    <c:if test="${pn.ttThanhToan == 'Đã thanh toán'}">
                                        <span class="badge bg-success">Đã thanh toán</span>
                                    </c:if>
                                    <c:if test="${pn.ttThanhToan == 'Chưa thanh toán'}">
                                        <span class="badge bg-warning text-dark">Chưa thanh toán</span>
                                    </c:if>
                                </td>
                                <td class="text-center">
                                    <a href="phieunhap?action=edit&id=${pn.maPhieu}" class="btn btn-sm btn-outline-warning fw-bold px-2">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <a href="phieunhap?action=delete&id=${pn.maPhieu}" class="btn btn-sm btn-outline-danger fw-bold ms-1 px-2" 
                                       onclick="return confirm('Bạn có chắc chắn muốn xóa phiếu nhập ${pn.maPhieu} không?');">
                                        <i class="fas fa-trash-alt"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty listPN}">
                            <tr><td colspan="7" class="text-center py-5 text-muted">Chưa có lịch sử phiếu nhập kho nào.</td></tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalAddPhieu" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-xl">
            <form action="phieunhap" method="post" class="modal-content border-0 shadow">
                <input type="hidden" name="action" value="addPhieu">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title fw-bold"><i class="fas fa-file-signature me-2"></i>TẠO PHIẾU NHẬP KHO</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                
                <div class="modal-body p-4 bg-light">
                    <div class="bg-white p-4 rounded border shadow-sm mb-4">
                        <div class="section-title">Thông Tin Chung</div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="fw-bold mb-1">Mã Phiếu Nhập <span class="text-danger">*</span></label>
                                <input type="text" name="maPhieu" class="form-control" placeholder="VD: PN001" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="fw-bold mb-1">Ngày Nhập <span class="text-danger">*</span></label>
                                <input type="date" name="ngayNhap" class="form-control" required>
                            </div>
                            
                            <div class="col-md-12 mb-3">
                                <label class="fw-bold mb-1">Nhà Cung Cấp <span class="text-danger">*</span></label>
                                <select name="maNCC" class="form-select" required>
                                    <option value="">-- Chọn Nhà Cung Cấp --</option>
                                    <c:forEach items="${listNCC}" var="ncc">
                                        <option value="${ncc.maNCC}">${ncc.tenNCC}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="fw-bold mb-1">Cơ Sở Nhận Hàng <span class="text-danger">*</span></label>
                                <select name="maCN" id="maCN_PhieuNhap" class="form-select border-primary" onchange="filterNV_PhieuNhap()" required>
                                    <option value="">-- Chọn Cơ Sở --</option>
                                    <c:forEach items="${listCN}" var="cn">
                                        <option value="${cn.maCN}">${cn.tenCN}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="fw-bold mb-1">Người Nhận (Nhân Viên) <span class="text-danger">*</span></label>
                                <select name="maNV" id="maNV_PhieuNhap" class="form-select border-primary" required disabled>
                                    <option value="">-- Chọn Nhân Viên --</option>
                                    <c:forEach items="${listNV}" var="nv">
                                        <option value="${nv.maNV}" data-macn="${nv.maCN}">
                                            ${nv.ho} ${nv.dem} ${nv.ten}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="fw-bold mb-1">Tổng Tiền (VNĐ) <span class="text-danger">*</span></label>
                                <input type="number" name="thanhTien" class="form-control" placeholder="VD: 1500000" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="fw-bold mb-1">Trạng Thái Thanh Toán <span class="text-danger">*</span></label>
                                <select name="ttThanhToan" class="form-select" required>
                                    <option value="Đã thanh toán">Đã thanh toán</option>
                                    <option value="Chưa thanh toán">Chưa thanh toán</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="bg-white p-4 rounded border shadow-sm">
                        <div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-3">
                            <div class="section-title border-0 mb-0 pb-0">Chi Tiết Nguyên Liệu Nhập</div>
                            <button type="button" class="btn btn-sm btn-outline-primary fw-bold" onclick="addImportRow()">
                                <i class="fas fa-plus"></i> Thêm Nguyên Liệu
                            </button>
                        </div>
                        
                        <div class="table-responsive">
                            <table class="table align-middle" id="importTable">
                                <thead>
                                    <tr class="text-muted">
                                        <th>Nguyên Liệu <span class="text-danger">*</span></th>
                                        <th width="200">Số Lượng <span class="text-danger">*</span></th>
                                        <th width="250">Đơn Giá Nhập (VNĐ) <span class="text-danger">*</span></th>
                                        <th width="50" class="text-center">Xóa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="import-row">
                                        <td>
                                            <select name="maNL" class="form-select border-primary-subtle" required>
                                                <option value="">-- Chọn Nguyên Liệu --</option>
                                                <c:forEach items="${listNL}" var="nl">
                                                    <option value="${nl.maNL}">${nl.tenNL} (${nl.donVi})</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td><input type="number" step="0.1" name="soLuongNhap" class="form-control border-primary-subtle" required></td>
                                        <td><input type="number" name="donGiaNhap" class="form-control border-primary-subtle" required></td>
                                        <td class="text-center"></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                
                <div class="modal-footer border-0 p-3 bg-white">
                    <button type="button" class="btn btn-secondary fw-bold px-4" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-primary fw-bold px-5"><i class="fas fa-save me-1"></i> LƯU PHIẾU NHẬP</button>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function filterNV_PhieuNhap() {
            var branchId = document.getElementById("maCN_PhieuNhap").value;
            var nvSelect = document.getElementById("maNV_PhieuNhap");
            if (!nvSelect) return;
            var opts = nvSelect.options;
            nvSelect.value = "";
            if (branchId === "") { nvSelect.disabled = true; return; }
            nvSelect.disabled = false;
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
            var firstSelect = document.querySelector('select[name="maNL"]');
            var optionsHtml = firstSelect.innerHTML;

            newRow.innerHTML = 
                '<td><select name="maNL" class="form-select border-primary-subtle" required>' + optionsHtml + '</select></td>' +
                '<td><input type="number" step="0.1" name="soLuongNhap" class="form-control border-primary-subtle" required></td>' +
                '<td><input type="number" name="donGiaNhap" class="form-control border-primary-subtle" required></td>' +
                '<td class="text-center"><button type="button" class="btn btn-link text-danger p-0 mt-1" onclick="removeRow(this)"><i class="fas fa-trash-alt fs-5"></i></button></td>';
        }

        function removeRow(btn) {
            var row = btn.parentNode.parentNode;
            row.parentNode.removeChild(row);
        }
    </script>
</body>
</html>