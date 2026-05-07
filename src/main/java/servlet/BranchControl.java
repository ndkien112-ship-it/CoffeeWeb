package servlet;

import dao.BranchDAO;
import model.Branch;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "BranchControl", urlPatterns = {"/branch"})
public class BranchControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        BranchDAO dao = new BranchDAO();
        String action = request.getParameter("action");
        
        // LUỒNG MỚI: Người dùng bấm "Quản lý cơ sở này"
        if ("select".equals(action)) {
            String id = request.getParameter("id");
            Branch b = dao.getBranchByID(id);
            if (b != null) {
                // Lưu vào Session
                HttpSession session = request.getSession();
                session.setAttribute("activeBranchId", b.getMaCN());
                session.setAttribute("activeBranchName", b.getTenCN());
                
                // Chuyển thẳng sang trang Hóa đơn
                response.sendRedirect("hoadon");
                return;
            }
        }
        
        // Xóa chi nhánh
        if ("delete".equals(action)) {
            String id = request.getParameter("id");
            dao.deleteBranch(id);
            response.sendRedirect("branch");
            return;
        }

        request.setAttribute("listB", dao.getAllBranches());
        request.getRequestDispatcher("chinhanh.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        BranchDAO dao = new BranchDAO();
        dao.addBranch(request.getParameter("maCN"), request.getParameter("tenCN"), 
                      request.getParameter("tinh"), request.getParameter("diaChiCuThe"), 
                      request.getParameter("sdt"), request.getParameter("email"));
        response.sendRedirect("branch");
    }
}