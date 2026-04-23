package servlet;

import dao.DrinkDAO;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.SanPham;

@WebServlet(name = "HomeControl", urlPatterns = {"/HomeControl"})
public class HomeControl extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        // 1. Gọi DAO lấy dữ liệu từ SQL Server (image_755c49.png)
        DrinkDAO dao = new DrinkDAO();
        List<SanPham> list = dao.getAllDrinks();
        
        // 2. Đẩy dữ liệu sang menu.jsp
        request.setAttribute("listS", list);
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}