package servlet;

import dao.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Drink;
import java.util.List;

@WebServlet(name = "MenuControl", urlPatterns = {"/menu"})
public class RecipeControl extends HttpServlet { // Tên class phải là MenuControl cho khớp tên file

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Lấy danh sách từ DAO
        ProductDAO dao = new ProductDAO();
        List<Drink> list = dao.getAllProducts();
        
        // Gửi dữ liệu sang JSP
        request.setAttribute("listP", list);
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        // Lấy dữ liệu từ form
        String maSP = request.getParameter("maSP");
        String tenSP = request.getParameter("tenSP");
        
        // Chuyển đổi dữ liệu sang kiểu số cho khớp với Database
        int maLoai = 0;
        double giaNiemYet = 0;
        
        try {
            String sMaLoai = request.getParameter("maLoai");
            String sGia = request.getParameter("giaNiemYet");
            
            if(sMaLoai != null) maLoai = Integer.parseInt(sMaLoai);
            if(sGia != null) giaNiemYet = Double.parseDouble(sGia);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Gọi DAO để thêm món
        ProductDAO dao = new ProductDAO();
        dao.addProduct(maSP, tenSP, maLoai, giaNiemYet);
        
        // Quay lại trang menu
        response.sendRedirect("menu");
    }
}