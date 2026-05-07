package servlet;

import dao.SalesDAO;
import dao.BranchDAO;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.Product;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "SalesControl", urlPatterns = {"/khachhang", "/hoadon"})
public class SalesControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        SalesDAO dao = new SalesDAO();
        HttpSession session = request.getSession();
        
        String activeBranchId = (String) session.getAttribute("activeBranchId");
        if (activeBranchId == null && !path.equals("/khachhang")) {
            response.sendRedirect("branch");
            return;
        }
        
        // LUỒNG 1: QUẢN LÝ KHÁCH HÀNG
        if (path.equals("/khachhang")) {
            String action = request.getParameter("action");
            
            if ("delete".equals(action)) {
                dao.deleteCustomer(request.getParameter("id"));
                response.sendRedirect("khachhang");
                return;
            }
            
            if ("edit".equals(action)) {
                request.setAttribute("kh", dao.getCustomerById(request.getParameter("id")));
                request.getRequestDispatcher("editKhachHang.jsp").forward(request, response);
                return;
            }
            
            request.setAttribute("listKH", dao.getAllCustomers());
            request.getRequestDispatcher("khachhang.jsp").forward(request, response);
            
        // LUỒNG 2: QUẢN LÝ HÓA ĐƠN
        } else if (path.equals("/hoadon")) {
            String action = request.getParameter("action");
            
            if ("delete".equals(action)) {
                dao.deleteInvoice(request.getParameter("id"));
                response.sendRedirect("hoadon");
                return;
            }
            
            if ("edit".equals(action)) {
                String id = request.getParameter("id"); 
                request.setAttribute("hd", dao.getInvoiceById(id));
                request.setAttribute("listDetail", dao.getInvoiceDetailsByMaHD(id));
                request.setAttribute("listKH", dao.getAllCustomers());
                request.setAttribute("listSP", dao.getAllProducts()); 
                request.setAttribute("listCN", new BranchDAO().getAllBranches()); 
                request.setAttribute("listNV", dao.getAllEmployeesFull()); 
                request.getRequestDispatcher("editHoaDon.jsp").forward(request, response);
                return;
            }
            
            request.setAttribute("listHD", dao.getAllInvoices(activeBranchId));
            request.setAttribute("listKH", dao.getAllCustomers());
            request.setAttribute("listSP", dao.getAllProducts()); 
            request.setAttribute("listCN", new BranchDAO().getAllBranches()); 
            request.setAttribute("listNV", dao.getAllEmployeesFull()); 
            
            request.getRequestDispatcher("hoadon.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String path = request.getServletPath();
        SalesDAO dao = new SalesDAO();
        HttpSession session = request.getSession();

        if (path.equals("/khachhang")) {
            String action = request.getParameter("action");
            String maKH = request.getParameter("maKH");
            String ho = request.getParameter("ho");
            String dem = request.getParameter("dem");
            String ten = request.getParameter("ten");
            String sdt = request.getParameter("sdt");

            if ("update".equals(action)) {
                dao.updateCustomer(maKH, ho, dem, ten, sdt);
            } else {
                dao.addCustomer(maKH, ho, dem, ten, sdt);
            }
            response.sendRedirect("khachhang");
            
        } else if (path.equals("/hoadon")) {
            String action = request.getParameter("action"); 
            String maHD = request.getParameter("maHD");
            
            // Ưu tiên lấy maCN từ Form khi người dùng chọn
            String maCN = request.getParameter("maCN");
            if (maCN == null || maCN.trim().isEmpty()) {
                maCN = (String) session.getAttribute("activeBranchId");
            }
            
            String maKH = request.getParameter("maKH");
            String maNV = request.getParameter("maNV");
            String ptThanhToan = request.getParameter("phuongThucTT"); 
            
            String[] arrMaSP = request.getParameterValues("maSP");
            String[] arrSoLuong = request.getParameterValues("soLuong");

            double tongTien = 0;
            Map<String, Double> priceMap = new HashMap<>();
            List<Product> listSP = dao.getAllProducts();
            for (Product p : listSP) priceMap.put(p.getMaSP(), p.getGiaNiemYet());

            if (arrMaSP != null && arrSoLuong != null) {
                for (int i = 0; i < arrMaSP.length; i++) {
                    double donGia = priceMap.getOrDefault(arrMaSP[i], 0.0);
                    int sl = Integer.parseInt(arrSoLuong[i]);
                    tongTien += (donGia * sl);
                }
            }

            if ("update".equals(action)) {
                dao.updateInvoice(maHD, tongTien, ptThanhToan, maCN, maKH, maNV);
                dao.deleteInvoiceDetails(maHD); 
            } else {
                String ngayLap = LocalDate.now().toString();
                String thoiGianLap = LocalTime.now().toString().substring(0, 8); 
                dao.addInvoice(maHD, ngayLap, thoiGianLap, tongTien, ptThanhToan, maCN, maKH, maNV);
            }

            if (arrMaSP != null && arrSoLuong != null) {
                for (int i = 0; i < arrMaSP.length; i++) {
                    String maSP = arrMaSP[i];
                    int soLuong = Integer.parseInt(arrSoLuong[i]);
                    double giaLucMua = priceMap.getOrDefault(maSP, 0.0);
                    if (maSP != null && !maSP.trim().isEmpty()) {
                        dao.addInvoiceDetail(maHD, maSP, soLuong, giaLucMua);
                    }
                }
            }
            response.sendRedirect("hoadon");
        }
    }
}