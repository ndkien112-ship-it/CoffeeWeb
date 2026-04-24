package servlet;

import dao.ProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Drink;
import java.util.List;

@WebServlet(name = "MenuControl", urlPatterns = {"/menu"})
public class ManagerControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Gọi DAO lấy danh sách đồ uống
        ProductDAO dao = new ProductDAO();
        List<Drink> list = dao.getAllProducts();
        
        // Đẩy danh sách lên trang JSP
        request.setAttribute("listP", list);
        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Hỗ trợ gõ tiếng Việt
        request.setCharacterEncoding("UTF-8");
        
        // Lấy dữ liệu từ các ô input trong Modal (phải khớp name trong jsp)
        String maSP = request.getParameter("maSP");
        String tenSP = request.getParameter("tenSP");
        
        // Lưu ý: maLoai và giaNiemYet phải chuyển từ String sang số
        int maLoai = 0;
        double giaNiemYet = 0;
        
        try {
            maLoai = Integer.parseInt(request.getParameter("maLoai"));
            giaNiemYet = Double.parseDouble(request.getParameter("giaNiemYet"));
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Gọi DAO để thêm vào Database
        ProductDAO dao = new ProductDAO();
        dao.addProduct(maSP, tenSP, maLoai, giaNiemYet);
        
        // Thêm xong thì quay về trang danh sách
        response.sendRedirect("menu");
    }
}