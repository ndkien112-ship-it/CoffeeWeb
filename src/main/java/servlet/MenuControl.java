package servlet;

import dao.ProductDAO;
import model.Drink;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// Khai báo đường dẫn "/menu" để khớp với href="menu" trên giao diện
@WebServlet(name = "MenuControl", urlPatterns = {"/menu"})
public class MenuControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Gọi ProductDAO để lấy toàn bộ danh sách sản phẩm từ SQL
        ProductDAO dao = new ProductDAO();
        List<Drink> list = dao.getAllProducts();
        
        // 2. Đóng gói danh sách vào một biến tên là "listS" 
        // (Biến này phải khớp với <c:forEach items="${listS}"> trong file menu.jsp)
        request.setAttribute("listS", list);
        
        // 3. Chuyển hướng sang trang menu.jsp để hiển thị giao diện
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Nếu có ai gọi POST thì cũng xử lý y như GET
        doGet(request, response);
    }
}