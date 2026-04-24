package servlet;

import dao.ShiftDAO;
import model.PhanCong;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "AssignmentEditControl", urlPatterns = {"/loadAssignment", "/editAssignmentAction"})
public class AssignmentEditControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String maNV = request.getParameter("maNV");
        String maCa = request.getParameter("maCa");
        String ngayLam = request.getParameter("ngayLam");
        
        PhanCong pc = new ShiftDAO().getAssignment(maNV, maCa, ngayLam);
        request.setAttribute("detail", pc);
        request.getRequestDispatcher("editAssignment.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String maNV = request.getParameter("maNV");
        String maCa = request.getParameter("maCa");
        String ngayLam = request.getParameter("ngayLam");
        String trangThai = request.getParameter("trangThai");
        
        new ShiftDAO().updateAssignment(maNV, maCa, ngayLam, trangThai);
        response.sendRedirect("assignment");
    }
}