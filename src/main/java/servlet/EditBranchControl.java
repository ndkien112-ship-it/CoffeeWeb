package servlet;

import dao.BranchDAO;
import model.Branch;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

// Điểm chốt để sửa lỗi 404: Đăng ký tên /editBranch cho máy chủ nhận diện
@WebServlet(name = "EditBranchControl", urlPatterns = {"/editBranch"})
public class EditBranchControl extends HttpServlet {

    // Chạy khi bấm nút "Sửa" ở danh sách chi nhánh
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id"); 
        
        BranchDAO dao = new BranchDAO();
        // Gọi đúng hàm getBranchByID trong file DAO của bạn
        Branch b = dao.getBranchByID(id); 
        
        request.setAttribute("b", b); 
        request.getRequestDispatcher("editBranch.jsp").forward(request, response);
    }

    // Chạy khi bấm "LƯU CẬP NHẬT" trên form
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        String maCN = request.getParameter("maCN");
        String tenCN = request.getParameter("tenCN");
        String tinh = request.getParameter("tinh");
        String diaChiCuThe = request.getParameter("diaChiCuThe");
        String sdt = request.getParameter("sdt");
        String email = request.getParameter("email");
        
        BranchDAO dao = new BranchDAO();
        // Truyền đúng thứ tự tham số như hàm editBranch trong DAO của bạn
        dao.editBranch(maCN, tenCN, tinh, diaChiCuThe, sdt, email); 
        
        // Quay về trang danh sách chi nhánh
        response.sendRedirect("branch"); 
    }
}