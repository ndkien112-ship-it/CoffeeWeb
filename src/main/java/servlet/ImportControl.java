package servlet;

import dao.ImportDAO;
import dao.ProductDAO;
import dao.BranchDAO; 
import dao.SalesDAO; // Dùng SalesDAO để lấy hàm getAllEmployeesFull()
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "ImportControl", urlPatterns = {"/phieunhap"})
public class ImportControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        ImportDAO importDao = new ImportDAO();
        ProductDAO productDao = new ProductDAO(); 
        HttpSession session = request.getSession();

        // BẢO MẬT PHIÊN LÀM VIỆC
        String activeBranchId = (String) session.getAttribute("activeBranchId");
        if (activeBranchId == null) {
            response.sendRedirect("branch");
            return;
        }

        // ================= CÁC LUỒNG XÓA VÀ SỬA =================
        if ("delete".equals(action)) {
            importDao.deleteReceipt(request.getParameter("id"));
            response.sendRedirect("phieunhap");
            return;
        }
        
        if ("edit".equals(action)) {
            request.setAttribute("pn", importDao.getReceiptById(request.getParameter("id")));
            request.setAttribute("listDetail", importDao.getReceiptDetailsByMaPhieu(request.getParameter("id"))); // Thêm để load chi tiết cũ
            
            request.setAttribute("listNCC", productDao.getAllSuppliers()); 
            request.setAttribute("listNL", productDao.getAllIngredients()); 
            request.setAttribute("listCN", new BranchDAO().getAllBranches()); 
            
            // Lấy toàn bộ nhân viên để JS ở file JSP có thể lọc theo Cơ Sở
            request.setAttribute("listNV", new SalesDAO().getAllEmployeesFull()); 
            
            request.getRequestDispatcher("editPhieuNhap.jsp").forward(request, response);
            return;
        }

        // ================= LUỒNG MẶC ĐỊNH (TẢI DANH SÁCH) =================
        request.setAttribute("listPN", importDao.getAllReceipts());
        request.setAttribute("listNCC", productDao.getAllSuppliers()); 
        request.setAttribute("listNL", productDao.getAllIngredients()); 
        request.setAttribute("listCN", new BranchDAO().getAllBranches()); 
        
        // Lấy toàn bộ nhân viên để JS ở file JSP có thể lọc theo Cơ Sở
        request.setAttribute("listNV", new SalesDAO().getAllEmployeesFull()); 
        
        request.getRequestDispatcher("phieunhap.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        ImportDAO importDao = new ImportDAO();
        HttpSession session = request.getSession();

        // 1. Lấy thông tin chung
        String maPhieu = request.getParameter("maPhieu");
        String ngayNhap = request.getParameter("ngayNhap");
        
        // Chống lỗi 500 nếu người dùng vô tình để trống ô tổng tiền
        double thanhTien = 0;
        try {
            thanhTien = Double.parseDouble(request.getParameter("thanhTien"));
        } catch (Exception e) {
            thanhTien = 0;
        }
        
        String ttThanhToan = request.getParameter("ttThanhToan");
        String maNCC = request.getParameter("maNCC");
        
        // Ưu tiên lấy mã chi nhánh từ form khi người dùng thao tác chọn Cơ sở
        String maCN = request.getParameter("maCN");
        if (maCN == null || maCN.trim().isEmpty()) {
            maCN = (String) session.getAttribute("activeBranchId");
        }
        String maNV = request.getParameter("maNV"); 

        // 2. Lấy các mảng dữ liệu từ phần Chi tiết Nguyên Liệu
        String[] arrMaNL = request.getParameterValues("maNL");
        String[] arrSoLuong = request.getParameterValues("soLuongNhap");
        String[] arrDonGia = request.getParameterValues("donGiaNhap");

        // ================= XỬ LÝ LƯU DATABASE =================
        if ("update".equals(action)) {
            // A. Cập nhật thông tin phiếu nhập tổng
            importDao.updateReceipt(maPhieu, ngayNhap, thanhTien, ttThanhToan, maNCC, maCN, maNV);
            
            // B. Xóa toàn bộ chi tiết cũ của phiếu này để tránh bị nhân đôi dữ liệu
            try {
                importDao.deleteReceiptDetails(maPhieu); 
            } catch (Exception e) {
                e.printStackTrace();
            }

            // C. Vòng lặp thêm lại các chi tiết mới
            if (arrMaNL != null && arrSoLuong != null && arrDonGia != null) {
                for (int i = 0; i < arrMaNL.length; i++) {
                    if (arrMaNL[i] != null && !arrMaNL[i].trim().isEmpty()) {
                        try {
                            double sl = Double.parseDouble(arrSoLuong[i]);
                            double gia = Double.parseDouble(arrDonGia[i]);
                            importDao.addReceiptDetail(maPhieu, arrMaNL[i], sl, gia);
                        } catch (Exception e) {
                            e.printStackTrace(); // Bỏ qua dòng bị lỗi định dạng số, lưu các dòng còn lại
                        }
                    }
                }
            }
            
        } else {
            // A. Thêm mới phiếu nhập tổng
            importDao.addReceipt(maPhieu, ngayNhap, thanhTien, ttThanhToan, maNCC, maCN, maNV);
            
            // B. Vòng lặp thêm chi tiết phiếu nhập
            if (arrMaNL != null && arrSoLuong != null && arrDonGia != null) {
                for (int i = 0; i < arrMaNL.length; i++) {
                    if (arrMaNL[i] != null && !arrMaNL[i].trim().isEmpty()) {
                        try {
                            double sl = Double.parseDouble(arrSoLuong[i]);
                            double gia = Double.parseDouble(arrDonGia[i]);
                            importDao.addReceiptDetail(maPhieu, arrMaNL[i], sl, gia);
                        } catch (Exception e) {
                            e.printStackTrace(); // Bỏ qua dòng bị lỗi định dạng số, lưu các dòng còn lại
                        }
                    }
                }
            }
        }

        response.sendRedirect("phieunhap");
    }
}