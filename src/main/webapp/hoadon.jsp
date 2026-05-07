<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Quản Lý Hóa Đơn - KMN COFFEE</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .text-coffee { color: #4B3621; }
        .table-custom { border-radius: 10px; overflow: hidden; box-shadow: 0 0 15px rgba(0,0,0,0.05); }
        .invoice-row { background-color: #f8f9fa; padding: 10px; border-radius: 8px; border: 1px dashed #ced4da; }
    </style>
</head>
<body class="d-flex bg-light">

    <jsp:include page="sidebar.jsp">
        <jsp:param name="active" value="hoadon"/>
    </jsp:include>

    <div class="container-fluid p-4 w-100 overflow-auto" style="height: 100vh;">
        <div class="d-flex justify-content-between align-items-center mb-4 bg-white p-3 rounded-4 shadow-sm border-start border-5" style="border-color: #4B3621 !important;">
            <h3 class="m-0 fw-bold text-coffee"><i class="fas fa-file-invoice-dollar me-2"></i>LỊCH SỬ HÓA ĐƠN</h3>
            <div>
                <a href="khachhang" class="btn btn-outline-dark fw-bold me-2"><i class="fas fa-users me-1"></i> Khách Hàng</a>
                <button type="button" class="btn btn-success fw-bold" data-bs-toggle="modal" data-bs-target="#modalAddInvoice">
                    <i class="fas fa-plus-circle me-1"></i> Lập Hóa Đơn Mới
                </button>
            </div>
        </div>

        <div class="card shadow-sm border-0 rounded-4">
            <div class="card-body p-0 table-custom">
                <table class="table table-hover align-middle mb-0">
                    <thead class="bg-light">
                        <tr>
                            <th class="py-3 px-3">Mã HĐ</th>
                            <th>Ngày Lập</th>
                            <th>Thu Ngân (Lập)</th>
                            <th>Khách Hàng</th>
                            <th>Cơ Sở</th>
                            <th>Thanh Toán</th>
                            <th>Tổng Tiền</th>
                            <th class="text-center">Thao Tác</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white">
                        <c:forEach items="${listHD}" var="hd">
                            <tr>
                                <td class="fw-bold px-3 text-primary">#${hd.maHD}</td>
                                <td>${hd.ngayLap}</td>
                                <td class="fw-bold text-success"><i class="fas fa-user-edit me-1"></i>${not empty hd.tenNhanVien ? hd.tenNhanVien : hd.maNV}</td>
                                <td class="fw-bold text-dark">${not empty hd.tenKhachHang ? hd.tenKhachHang : 'Khách lẻ'}</td>
                                <td><span class="badge bg-secondary">${not empty hd.tenCN ? hd.tenCN : hd.maCN}</span></td>
                                <td><span class="badge bg-success">${hd.phuongThucTT}</span></td>
                                <td class="fw-bold text-danger">${hd.tongTien} đ</td>
                                <td class="text-center">
                                    <a href="hoadon?action=edit&id=${hd.maHD}" class="btn btn-sm btn-outline-warning fw-bold px-2">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <a href="hoadon?action=delete&id=${hd.maHD}" class="btn btn-sm btn-outline-danger fw-bold ms-1 px-2" 
                                       onclick="return confirm('Bạn có chắc chắn muốn xóa hóa đơn #${hd.maHD} không?\nMọi chi tiết đồ uống trong hóa đơn này cũng sẽ bị xóa!');">
                                        <i class="fas fa-trash-alt"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty listHD}">
                            <tr><td colspan="8" class="text-center py-5 text-muted"><i class="fas fa-box-open fa-3x mb-3 text-light"></i><p class="mb-0">Chưa có hóa đơn nào được lập trong cơ sở này.</p></td></tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalAddInvoice" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <form action="hoadon" method="post" class="modal-content border-0 shadow">
                <input type="hidden" name="action" value="add">
                
                <div class="modal-header text-white" style="background-color: #198754;">
                    <h5 class="modal-title fw-bold"><i class="fas fa-file-invoice-dollar me-2"></i>LẬP HÓA ĐƠN MỚI</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                
                <div class="modal-body p-4 bg-light">
                    <div class="bg-white p-4 rounded border shadow-sm mb-4">
                        <h6 class="fw-bold text-success border-bottom pb-2 mb-3">Thông Tin Chung</h6>
                        <div class="row">
                            <div class="col-md-12 mb-3">
                                <label class="fw-bold mb-1">Mã Hóa Đơn <span class="text-danger">*</span></label>
                                <input type="text" name="maHD" class="form-control" placeholder="VD: HD001" required>
                            </div>
                            
                            <div class="col-md-6 mb-3">
                                <label class="fw-bold mb-1">Cơ Sở <span class="text-danger">*</span></label>
                                <select name="maCN" id="maCN_HoaDon" class="form-select border-success-subtle" onchange="filterThuNgan()" required>
                                    <option value="">-- Chọn Cơ Sở --</option>
                                    <c:forEach items="${listCN}" var="cn">
                                        <option value="${cn.maCN}">${cn.tenCN}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="fw-bold mb-1">Thu Ngân <span class="text-danger">*</span></label>
                                <select name="maNV" id="maNV_HoaDon" class="form-select border-success-subtle" required disabled>
                                    <option value="">-- Chọn Nhân Viên --</option>
                                    <c:forEach items="${listNV}" var="nv">
                                        <option value="${nv.maNV}" data-macn="${nv.maCN}">
                                            ${nv.ho} ${nv.dem} ${nv.ten}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            
                            <div class="col-md-6 mb-3">
                                <label class="fw-bold mb-1">Khách Hàng</label>
                                <select name="maKH" class="form-select">
                                    <option value="">Khách lẻ (Không lưu thông tin)</option>
                                    <c:forEach items="${listKH}" var="kh"><option value="${kh.maKH}">${kh.ho} ${kh.dem} ${kh.ten}</option></c:forEach>
                                </select>
                            </div>
                            
                            <div class="col-md-6 mb-2">
                                <label class="fw-bold mb-1">Phương Thức Thanh Toán</label>
                                <select name="phuongThucTT" class="form-select border-success-subtle">
                                    <option value="Tiền mặt">Tiền mặt</option>
                                    <option value="Chuyển khoản">Chuyển khoản ngân hàng</option>
                                    <option value="Thẻ tín dụng">Thẻ tín dụng / Ghi nợ</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="bg-white p-4 rounded border shadow-sm">
                        <h6 class="fw-bold text-success border-bottom pb-2 mb-3 d-flex justify-content-between align-items-center">
                            <span>Chi Tiết Đồ Uống</span>
                            <button type="button" class="btn btn-sm btn-outline-success" id="btn-add-drink"><i class="fas fa-plus"></i> Thêm món</button>
                        </h6>
                        <div id="invoice-container">
                            <div class="row align-items-center mb-3 invoice-row">
                                <div class="col-md-6">
                                    <label class="form-label text-muted small mb-1">Sản Phẩm <span class="text-danger">*</span></label>
                                    <select name="maSP" class="form-select border-success-subtle" required>
                                        <option value="">-- Chọn Đồ Uống --</option>
                                        <c:forEach items="${listSP}" var="sp"><option value="${sp.maSP}">${sp.tenSP} - ${sp.giaNiemYet}đ</option></c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-5">
                                    <label class="form-label text-muted small mb-1">Số Lượng <span class="text-danger">*</span></label>
                                    <input type="number" name="soLuong" class="form-control border-success-subtle" min="1" value="1" required>
                                </div>
                                <div class="col-md-1 text-center mt-4">
                                    <button type="button" class="btn btn-outline-danger btn-sm btn-remove-row"><i class="fas fa-trash-alt"></i></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="modal-footer border-0 p-3 bg-white">
                    <button type="button" class="btn btn-secondary fw-bold px-4" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-success fw-bold px-5">THANH TOÁN & LƯU HÓA ĐƠN</button>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // ================= JS LỌC THU NGÂN THEO CƠ SỞ =================
        function filterThuNgan() {
            var branchId = document.getElementById("maCN_HoaDon").value;
            var nvSelect = document.getElementById("maNV_HoaDon");
            var opts = nvSelect.options;
            
            // Reset ô chọn nhân viên
            nvSelect.value = "";
            
            if (branchId === "") { 
                nvSelect.disabled = true; 
                return; 
            }
            
            nvSelect.disabled = false;
            
            // Lọc danh sách nhân viên
            for (var i = 1; i < opts.length; i++) {
                var isMatch = (opts[i].getAttribute("data-macn") === branchId);
                opts[i].hidden = !isMatch;     
                opts[i].disabled = !isMatch;   
            }
        }

        // ================= JS THÊM DÒNG SẢN PHẨM =================
        document.addEventListener('DOMContentLoaded', function() {
            const container = document.getElementById('invoice-container');
            const btnAdd = document.getElementById('btn-add-drink');

            btnAdd.addEventListener('click', function() {
                const firstRow = container.querySelector('.invoice-row');
                if (firstRow) {
                    const newRow = firstRow.cloneNode(true);
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
                        alert("Hóa đơn phải có ít nhất 1 đồ uống!");
                    }
                }
            });
        });
    </script>
</body>
</html>