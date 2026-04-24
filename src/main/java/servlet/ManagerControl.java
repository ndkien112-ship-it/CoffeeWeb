package servlet;

import dao.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "ManagerControl", urlPatterns = {"/manager"})
public class ManagerControl extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("delete".equals(action)) {
            new ProductDAO().deleteProduct(request.getParameter("pid"));
        }
        response.sendRedirect("menu");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        new ProductDAO().addProduct(
            request.getParameter("maSP"),
            request.getParameter("tenSP"),
            Double.parseDouble(request.getParameter("gia")),
            request.getParameter("moTa"),
            1 // Mặc định MaLoai là 1
        );
        response.sendRedirect("menu");
    }
}