package servlet;

import dao.BranchDAO;
import model.ChiNhanh;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// Khai báo đường dẫn "/branch" để khớp với menu bên Sidebar
@WebServlet(name = "BranchControl", urlPatterns = {"/branch"})
public class BranchControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Gọi BranchDAO để lấy danh sách chi nhánh từ CSDL
        BranchDAO dao = new BranchDAO();
        List<ChiNhanh> list = dao.getAllBranches();
        
        // 2. Gói danh sách vào biến "listB" (Phải khớp với ${listB} trong chinhanh.jsp)
        request.setAttribute("listB", list);
        
        // 3. Chuyển hướng sang trang chinhanh.jsp để hiển thị
        request.getRequestDispatcher("chinhanh.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
