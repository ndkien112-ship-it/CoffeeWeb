package servlet;

import dao.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Drink;
import java.util.List;

@WebServlet(name = "MenuControl", urlPatterns = {"/menu"})
public class MenuControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        ProductDAO dao = new ProductDAO();
        List<Drink> list = dao.getAllProducts();
        request.setAttribute("listP", list);
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        String maSP = request.getParameter("maSP");
        String tenSP = request.getParameter("tenSP");
        
        int maLoai = 0;
        double giaNiemYet = 0;
        try {
            maLoai = Integer.parseInt(request.getParameter("maLoai"));
            giaNiemYet = Double.parseDouble(request.getParameter("giaNiemYet"));
        } catch (Exception e) {
            e.printStackTrace();
        }

        ProductDAO dao = new ProductDAO();
        dao.addProduct(maSP, tenSP, maLoai, giaNiemYet);
        
        response.sendRedirect("menu");
    }
} // <-- PHẢI CÓ DẤU NÀY ĐỂ ĐÓNG CLASS
