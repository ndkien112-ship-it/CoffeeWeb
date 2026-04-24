package servlet;

import dao.ShiftDAO;
import dao.EmployeeDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "AssignmentControl", urlPatterns = {"/assignment"})
public class AssignmentControl extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ShiftDAO shiftDAO = new ShiftDAO();
        EmployeeDAO empDAO = new EmployeeDAO();
        
        String action = request.getParameter("action");
        // Nếu người dùng bấm nút Xóa
        if ("delete".equals(action)) {
            String maNV = request.getParameter("maNV");
            String maCa = request.getParameter("maCa");
            String ngayLam = request.getParameter("ngayLam");
            shiftDAO.deleteAssignment(maNV, maCa, ngayLam);
            response.sendRedirect("assignment");
            return;
        }
        // Đẩy dữ liệu sang JSP
        request.setAttribute("listA", shiftDAO.getAllAssignments()); // Danh sách đã phân công
        request.setAttribute("listS", shiftDAO.getAllShifts());      // Danh sách Ca làm để chọn
        request.setAttribute("listE", empDAO.getAllEmployees());     // Danh sách Nhân viên để chọn
        
        request.getRequestDispatcher("phancong.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        String maNV = request.getParameter("maNV");
        String maCa = request.getParameter("maCa");
        String ngayLam = request.getParameter("ngayLam");
        String trangThai = request.getParameter("trangThai");
        
        new ShiftDAO().addAssignment(maNV, maCa, ngayLam, trangThai);
        
        response.sendRedirect("assignment");
    }
}