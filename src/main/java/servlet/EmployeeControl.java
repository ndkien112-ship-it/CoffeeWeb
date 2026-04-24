package servlet;

import dao.EmployeeDAO;
import dao.BranchDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.util.List;
import model.NhanVien;
import model.ChiNhanh;

@WebServlet(name = "EmployeeControl", urlPatterns = {"/employee"})
public class EmployeeControl extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<NhanVien> listE = new EmployeeDAO().getAllEmployees();
        List<ChiNhanh> listB = new BranchDAO().getAllBranches();
        request.setAttribute("listE", listE);
        request.setAttribute("listB", listB);
        request.getRequestDispatcher("nhanvien.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        NhanVien nv = new NhanVien(
            request.getParameter("maNV"), request.getParameter("ho"),
            request.getParameter("dem"), request.getParameter("ten"),
            request.getParameter("gioiTinh"), request.getParameter("ngaySinh"),
            request.getParameter("chucVu"), Double.parseDouble(request.getParameter("luong")),
            request.getParameter("maCN")
        );
        new EmployeeDAO().addEmployee(nv);
        response.sendRedirect("employee");
    }
}