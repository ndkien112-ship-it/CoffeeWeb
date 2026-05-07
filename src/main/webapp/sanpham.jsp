<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Menu & Quản Lý Kho - KMN COFFEE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .text-coffee { color: #4B3621; }
        .table-custom { border-radius: 10px; overflow: hidden; box-shadow: 0 0 15px rgba(0,0,0,0.05); }
        .nav-tabs .nav-link { color: #6c757d; font-weight: bold; border: none; padding: 12px 20px; border-bottom: 3px solid transparent; }
        .nav-tabs .nav-link:hover { border-color: transparent; color: #4B3621; }
        .nav-tabs .nav-link.active { color: #4B3621; background: none; border-bottom: 3px solid #4B3621; }
        .recipe-row { background: #fdfdfd; }
    </style>
</head>
<body class="d-flex bg-light">

    <jsp:include page="sidebar.jsp">
        <jsp:param name="active" value="sanpham"/>
    </jsp:include>

    <div class="container-fluid p-4 w-100 overflow-auto" style="height: 100vh;">
        
        <div class="d-flex justify-content-between align-items-center mb-4 bg-white p-3 rounded-4 shadow-sm border-start border-5" style="border-color: #4B3621 !important;">
            <h3 class="m-0 fw-bold text-coffee"><i class="fas fa-boxes me-2"></i>MENU & QUẢN LÝ KHO TỔNG</h3>
            <div>
                <a href="hoadon" class="btn btn-outline-dark fw-bold">
                    <i class="fas fa-file-invoice-dollar me-1"></i> Đến trang Bán Hàng
                </a>
            </div>
        </div>

        <div class="card shadow-sm border-0 rounded-4 p-4">
            
            <ul class="nav nav-tabs mb-4 border-bottom" id="myTab" role="tablist">
                <li class="nav-item" role="presentation"><button class="nav-link active" id="sp-tab" data-bs-toggle="tab" data-bs-target="#sp" type="button" role="tab"><i class="fas fa-coffee me-2"></i>Sản Phẩm & Công Thức</button></li>
                <li class="nav-item" role="presentation"><button class="nav-link" id="kho-tab" data-bs-toggle="tab" data-bs-target="#kho" type="button" role="tab"><i class="fas fa-cubes me-2"></i>Kho & Nguyên Liệu</button></li>
                <li class="nav-item" role="presentation"><button class="nav-link" id="doitac-tab" data-bs-toggle="tab" data-bs-target="#doitac" type="button" role="tab"><i class="fas fa-handshake me-2"></i>Đối Tác & Báo Giá</button></li>
            </ul>

            <div class="tab-content" id="myTabContent">
                
                <div class="tab-pane fade show active" id="sp" role="tabpanel">
                    <div class="mb-3"><button class="btn btn-success fw-bold" data-bs-toggle="modal" data-bs-target="#modalAddSP"><i class="fas fa-plus"></i> Thêm Đồ Uống Mới</button></div>
                    <div class="table-custom">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="table-dark">
                                <tr><th class="py-3 px-4">Mã SP</th><th>Tên Đồ Uống</th><th>Mô Tả</th><th>Giá Niêm Yết</th><th class="text-center">Thao tác</th></tr>
                            </thead>
                            <tbody class="bg-white">
                                <c:forEach items="${listSP}" var="sp">
                                    <tr>
                                        <td class="fw-bold px-4 text-primary">${sp.maSP}</td>
                                        <td class="fw-bold text-dark">${sp.tenSP}</td>
                                        <td class="text-muted">${sp.moTa}</td>
                                        <td class="fw-bold text-danger">${sp.giaNiemYet} đ</td>
                                        <td class="text-center">
                                            <a href="sanpham?action=edit&id=${sp.maSP}" class="btn btn-sm btn-outline-warning fw-bold px-3"><i class="fas fa-edit"></i></a>
                                            <a href="sanpham?action=delete&id=${sp.maSP}" class="btn btn-sm btn-outline-danger fw-bold ms-1 px-3" onclick="return confirm('Bạn có chắc chắn muốn xóa đồ uống này không?');"><i class="fas fa-trash-alt"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty listSP}"><tr><td colspan="5" class="text-center py-5 text-muted">Chưa có dữ liệu.</td></tr></c:if>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="tab-pane fade" id="kho" role="tabpanel">
                    <div class="mb-3"><button class="btn btn-primary fw-bold" data-bs-toggle="modal" data-bs-target="#modalAddNL"><i class="fas fa-plus"></i> Thêm Nguyên Liệu Mới</button></div>
                    <div class="table-custom">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="bg-primary text-white">
                                <tr><th class="py-3 px-4">Mã NL</th><th>Tên Nguyên Liệu</th><th>Đơn Vị Tính</th><th class="text-center">Thao tác</th></tr>
                            </thead>
                            <tbody class="bg-white">
                                <c:forEach items="${listNL}" var="nl">
                                    <tr>
                                        <td class="fw-bold px-4 text-primary">${nl.maNL}</td>
                                        <td class="fw-bold text-dark"><i class="fas fa-leaf text-success me-2"></i>${nl.tenNL}</td>
                                        <td><span class="badge bg-secondary">${nl.donVi}</span></td>
                                        <td class="text-center">
                                            <a href="sanpham?action=editNL&id=${nl.maNL}" class="btn btn-sm btn-outline-warning fw-bold px-3"><i class="fas fa-edit"></i></a>
                                            <a href="sanpham?action=deleteNL&id=${nl.maNL}" class="btn btn-sm btn-outline-danger fw-bold ms-1 px-3" onclick="return confirm('Xóa nguyên liệu này?');"><i class="fas fa-trash-alt"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty listNL}"><tr><td colspan="4" class="text-center py-5 text-muted">Chưa có dữ liệu.</td></tr></c:if>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="tab-pane fade" id="doitac" role="tabpanel">
                    <div class="d-flex gap-2 mb-3">
                        <button class="btn btn-secondary fw-bold" data-bs-toggle="modal" data-bs-target="#modalAddNCC"><i class="fas fa-truck me-1"></i> Thêm Nhà Cung Cấp</button>
                        <button class="btn btn-info fw-bold text-dark" data-bs-toggle="modal" data-bs-target="#modalAddCC"><i class="fas fa-hand-holding-usd me-1"></i> Thêm Báo Giá Nhập</button>
                    </div>

                    <div class="row">
                        <div class="col-md-5 mb-3">
                            <div class="card shadow-sm border-0 h-100">
                                <div class="card-header bg-secondary text-white fw-bold py-3"><i class="fas fa-building me-2"></i> DANH SÁCH NHÀ CUNG CẤP</div>
                                <div class="card-body p-0 table-responsive" style="max-height: 400px;">
                                    <table class="table table-hover align-middle mb-0">
                                        <thead class="table-light">
                                            <tr><th class="px-3">Mã NCC</th><th>Tên NCC</th><th>Liên hệ</th><th class="text-center">Thao tác</th></tr>
                                        </thead>
                                        <tbody class="bg-white">
                                            <c:forEach items="${listNCC}" var="ncc">
                                                <tr>
                                                    <td class="fw-bold text-primary px-3">${ncc.maNCC}</td>
                                                    <td class="fw-bold">${ncc.tenNCC}</td>
                                                    <td>
                                                        <small class="d-block text-muted"><i class="fas fa-phone-alt me-1"></i> ${ncc.sdt}</small>
                                                        <small class="d-block text-muted"><i class="fas fa-envelope me-1"></i> ${ncc.email}</small>
                                                    </td>
                                                    <td class="text-center">
                                                        <a href="sanpham?action=editNCC&id=${ncc.maNCC}" class="btn btn-sm btn-outline-warning"><i class="fas fa-edit"></i></a>
                                                        <a href="sanpham?action=deleteNCC&id=${ncc.maNCC}" class="btn btn-sm btn-outline-danger ms-1" onclick="return confirm('Xóa nhà cung cấp này?');"><i class="fas fa-trash-alt"></i></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <c:if test="${empty listNCC}"><tr><td colspan="4" class="text-center py-4 text-muted">Chưa có dữ liệu.</td></tr></c:if>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-7 mb-3">
                            <div class="card shadow-sm border-0 h-100">
                                <div class="card-header bg-info text-dark fw-bold py-3"><i class="fas fa-tags me-2"></i> BẢNG GIÁ NGUYÊN LIỆU NHẬP</div>
                                <div class="card-body p-0 table-responsive" style="max-height: 400px;">
                                    <table class="table table-hover align-middle mb-0">
                                        <thead class="table-light">
                                            <tr><th class="px-3">Nhà Cung Cấp</th><th>Nguyên Liệu</th><th>Đơn Giá</th><th class="text-center">Thao tác</th></tr>
                                        </thead>
                                        <tbody class="bg-white">
                                            <c:forEach items="${listCC}" var="cc">
                                                <tr>
                                                    <td class="fw-bold text-dark px-3">${cc.tenNCC}</td>
                                                    <td>${cc.tenNL} <span class="badge bg-secondary ms-1">${cc.donVi}</span></td>
                                                    <td class="fw-bold text-danger">${cc.donGiaNiemYet} đ</td>
                                                    <td class="text-center">
                                                        <a href="sanpham?action=editCC&maNCC=${cc.maNCC}&maNL=${cc.maNL}" class="btn btn-sm btn-outline-warning"><i class="fas fa-edit"></i></a>
                                                        <a href="sanpham?action=deleteCC&maNCC=${cc.maNCC}&maNL=${cc.maNL}" class="btn btn-sm btn-outline-danger ms-1" onclick="return confirm('Xóa báo giá này?');"><i class="fas fa-trash-alt"></i></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <c:if test="${empty listCC}"><tr><td colspan="4" class="text-center py-4 text-muted">Chưa có báo giá nào.</td></tr></c:if>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalAddSP" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <form action="sanpham" method="post" class="modal-content border-0 shadow">
                <input type="hidden" name="action" value="addSP">
                <div class="modal-header bg-success text-white">
                    <h5 class="modal-title fw-bold"><i class="fas fa-plus-circle me-2"></i>THÊM ĐỒ UỐNG MỚI</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body p-4 bg-light">
                    <div class="row">
                        <div class="col-md-5">
                            <div class="bg-white p-3 rounded border shadow-sm h-100">
                                <h6 class="fw-bold text-coffee border-bottom pb-2 mb-3">Thông tin cơ bản</h6>
                                <div class="mb-3"><label class="fw-bold small mb-1">Mã Sản Phẩm *</label><input type="text" name="maSP" class="form-control" required></div>
                                <div class="mb-3"><label class="fw-bold small mb-1">Tên Đồ Uống *</label><input type="text" name="tenSP" class="form-control" required></div>
                                <div class="mb-3"><label class="fw-bold small mb-1">Giá Niêm Yết *</label><input type="number" name="giaNiemYet" class="form-control" required></div>
                                <div class="mb-2"><label class="fw-bold small mb-1">Mô Tả</label><textarea name="moTa" class="form-control" rows="3"></textarea></div>
                            </div>
                        </div>
                        <div class="col-md-7">
                            <div class="bg-white p-3 rounded border shadow-sm h-100">
                                <div class="d-flex justify-content-between align-items-center border-bottom pb-2 mb-3">
                                    <h6 class="fw-bold text-coffee m-0">Công thức pha chế</h6>
                                    <button type="button" class="btn btn-sm btn-primary" onclick="addRecipeRow()"><i class="fas fa-plus"></i> Thêm dòng</button>
                                </div>
                                <div class="table-responsive" style="max-height: 300px;">
                                    <table class="table table-sm align-middle" id="recipeTable">
                                        <thead><tr class="text-muted small"><th>Nguyên liệu</th><th width="100">Định lượng</th><th width="40"></th></tr></thead>
                                        <tbody>
                                            <tr class="recipe-row">
                                                <td><select name="maNL" class="form-select form-select-sm"><option value="">-- Chọn NL --</option><c:forEach items="${listNL}" var="nl"><option value="${nl.maNL}">${nl.tenNL} (${nl.donVi})</option></c:forEach></select></td>
                                                <td><input type="number" step="0.1" name="soLuongNL" class="form-control form-select-sm"></td><td></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer border-0 p-3 bg-white"><button type="button" class="btn btn-secondary fw-bold px-4" data-bs-dismiss="modal">Hủy</button><button type="submit" class="btn btn-success fw-bold px-5">LƯU MỚI</button></div>
            </form>
        </div>
    </div>

    <div class="modal fade" id="modalAddNL" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <form action="sanpham" method="post" class="modal-content border-0 shadow">
                <input type="hidden" name="action" value="addNL">
                <div class="modal-header bg-primary text-white"><h5 class="modal-title fw-bold"><i class="fas fa-plus-circle me-2"></i>THÊM NGUYÊN LIỆU</h5><button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button></div>
                <div class="modal-body p-4 bg-light">
                    <div class="bg-white p-3 rounded border shadow-sm">
                        <div class="mb-3"><label class="fw-bold mb-1 small">Mã NL *</label><input type="text" name="maNL" class="form-control" required></div>
                        <div class="mb-3"><label class="fw-bold mb-1 small">Tên Nguyên Liệu *</label><input type="text" name="tenNL" class="form-control" required></div>
                        <div class="mb-0"><label class="fw-bold mb-1 small">Đơn Vị Tính *</label><input type="text" name="donVi" class="form-control" required></div>
                    </div>
                </div>
                <div class="modal-footer border-0 p-3 bg-white"><button type="button" class="btn btn-secondary fw-bold px-4" data-bs-dismiss="modal">Hủy</button><button type="submit" class="btn btn-primary fw-bold px-5">LƯU MỚI</button></div>
            </form>
        </div>
    </div>

    <div class="modal fade" id="modalAddNCC" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <form action="sanpham" method="post" class="modal-content border-0 shadow">
                <input type="hidden" name="action" value="addNCC">
                <div class="modal-header bg-secondary text-white"><h5 class="modal-title fw-bold"><i class="fas fa-truck me-2"></i>THÊM NHÀ CUNG CẤP</h5><button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button></div>
                <div class="modal-body p-4 bg-light">
                    <div class="bg-white p-3 rounded border shadow-sm">
                        <div class="mb-3"><label class="fw-bold mb-1 small">Mã Nhà Cung Cấp *</label><input type="text" name="maNCC" class="form-control" required></div>
                        <div class="mb-3"><label class="fw-bold mb-1 small">Tên Nhà Cung Cấp *</label><input type="text" name="tenNCC" class="form-control" required></div>
                        <div class="mb-3"><label class="fw-bold mb-1 small">Số Điện Thoại</label><input type="text" name="sdt" class="form-control"></div>
                        <div class="mb-0"><label class="fw-bold mb-1 small">Email</label><input type="email" name="email" class="form-control"></div>
                    </div>
                </div>
                <div class="modal-footer border-0 p-3 bg-white"><button type="button" class="btn btn-light fw-bold px-4" data-bs-dismiss="modal">Hủy</button><button type="submit" class="btn btn-secondary fw-bold px-5">LƯU MỚI</button></div>
            </form>
        </div>
    </div>

    <div class="modal fade" id="modalAddCC" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <form action="sanpham" method="post" class="modal-content border-0 shadow">
                <input type="hidden" name="action" value="addCungCap">
                <div class="modal-header bg-info text-dark"><h5 class="modal-title fw-bold"><i class="fas fa-hand-holding-usd me-2"></i>THÊM BÁO GIÁ NGUYÊN LIỆU</h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
                <div class="modal-body p-4 bg-light">
                    <div class="bg-white p-3 rounded border shadow-sm">
                        <div class="mb-3">
                            <label class="fw-bold mb-1 small">Nhà Cung Cấp *</label>
                            <select name="maNCC" class="form-select border-info-subtle" required><option value="">-- Chọn NCC --</option><c:forEach items="${listNCC}" var="ncc"><option value="${ncc.maNCC}">${ncc.tenNCC}</option></c:forEach></select>
                        </div>
                        <div class="mb-3">
                            <label class="fw-bold mb-1 small">Nguyên Liệu *</label>
                            <select name="maNL" class="form-select border-info-subtle" required><option value="">-- Chọn NL --</option><c:forEach items="${listNL}" var="nl"><option value="${nl.maNL}">${nl.tenNL} (${nl.donVi})</option></c:forEach></select>
                        </div>
                        <div class="mb-0"><label class="fw-bold mb-1 small">Đơn Giá Niêm Yết *</label><input type="number" name="donGiaNiemYet" class="form-control border-info-subtle" required></div>
                    </div>
                </div>
                <div class="modal-footer border-0 p-3 bg-white"><button type="button" class="btn btn-light fw-bold px-4" data-bs-dismiss="modal">Hủy</button><button type="submit" class="btn btn-info fw-bold px-5">LƯU BÁO GIÁ</button></div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function addRecipeRow() {
            var table = document.getElementById("recipeTable").getElementsByTagName('tbody')[0];
            var newRow = table.insertRow();
            newRow.className = "recipe-row";
            var optionsHtml = document.querySelector('select[name="maNL"]').innerHTML;
            newRow.innerHTML = '<td><select name="maNL" class="form-select form-select-sm">' + optionsHtml + '</select></td>' +
                               '<td><input type="number" step="0.1" name="soLuongNL" class="form-control form-select-sm"></td>' +
                               '<td><button type="button" class="btn btn-link text-danger p-0" onclick="removeRow(this)"><i class="fas fa-times"></i></button></td>';
        }
        function removeRow(btn) { var row = btn.parentNode.parentNode; row.parentNode.removeChild(row); }
        
        document.addEventListener("DOMContentLoaded", function() {
            var activeTab = localStorage.getItem('activeTab_SanPham');
            if (activeTab) {
                var tabBtn = document.querySelector('#myTab button[data-bs-target="' + activeTab + '"]');
                if(tabBtn) { var tab = new bootstrap.Tab(tabBtn); tab.show(); }
            }
            document.querySelectorAll('#myTab button').forEach(function(btn) {
                btn.addEventListener('shown.bs.tab', function(e) { localStorage.setItem('activeTab_SanPham', e.target.getAttribute('data-bs-target')); });
            });
        });
    </script>
</body>
</html>