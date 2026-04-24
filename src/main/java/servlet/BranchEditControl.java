package servlet;

import dao.BranchDAO;
import model.ChiNhanh;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// Servlet này xử lý cả 2 đường dẫn: load dữ liệu (/loadBranch) và lưu dữ liệu (/editBranchAction)
@WebServlet(name = "BranchEditControl", urlPatterns = {"/loadBranch", "/editBranchAction"})
public class BranchEditControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy mã chi nhánh từ nút "Sửa" truyền lên URL (VD: id=CN01)
        String id = request.getParameter("id");
        
        // Gọi DAO để lấy thông tin chi nhánh đó
        BranchDAO dao = new BranchDAO();
        ChiNhanh cn = dao.getBranchByID(id);
        
        // Đẩy dữ liệu sang trang editBranch.jsp
        request.setAttribute("detail", cn);
        request.getRequestDispatcher("editBranch.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); // Chống lỗi font tiếng Việt
        
        // Lấy dữ liệu mới từ Form sửa
        String id = request.getParameter("id");
        String tenCN = request.getParameter("tenCN");
        String diaChi = request.getParameter("diaChi");
        String sdt = request.getParameter("sdt");
        String quanLy = request.getParameter("quanLy");

        // Gọi DAO cập nhật vào CSDL
        new BranchDAO().updateBranch(id, tenCN, diaChi, sdt, quanLy);
        
        // Cập nhật xong thì tự động quay về trang danh sách chi nhánh
        response.sendRedirect("branch");
    }
}