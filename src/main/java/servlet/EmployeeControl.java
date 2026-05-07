package servlet;

import dao.HrDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "EmployeeControl", urlPatterns = {"/nhanvien", "/phanca"})
public class EmployeeControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        HrDAO dao = new HrDAO();
        HttpSession session = request.getSession();
        
        String activeBranchId = (String) session.getAttribute("activeBranchId");
        if (activeBranchId == null) {
            response.sendRedirect("branch"); return;
        }

        if (path.equals("/phanca")) {
            String action = request.getParameter("action");
            if ("delete".equals(action)) {
                dao.deleteShift(request.getParameter("maNV"), request.getParameter("ngayLam"), request.getParameter("caLam"));
                response.sendRedirect("phanca");
                return;
            }
            
            // Luồng bổ sung: Mở form Edit Phân Ca
            if ("edit".equals(action)) {
                request.setAttribute("pcEdit", dao.getShift(request.getParameter("maNV"), request.getParameter("ngayLam"), request.getParameter("caLam")));
                request.setAttribute("listNV", dao.getAllEmployees(activeBranchId));
                request.getRequestDispatcher("editPhanCa.jsp").forward(request, response);
                return;
            }
            
            request.setAttribute("listNV", dao.getAllEmployees(activeBranchId));
            request.setAttribute("listPC", dao.getShiftsByBranch(activeBranchId));
            request.getRequestDispatcher("phanca.jsp").forward(request, response);
            return;
        }

        if (path.equals("/nhanvien")) {
            String action = request.getParameter("action");
            if ("delete".equals(action)) {
                dao.deleteEmployee(request.getParameter("id"));
                response.sendRedirect("nhanvien");
                return;
            }
            if ("edit".equals(action)) {
                request.setAttribute("nv", dao.getEmployeeById(request.getParameter("id")));
                request.getRequestDispatcher("editNhanVien.jsp").forward(request, response);
                return;
            }
            request.setAttribute("listNV", dao.getAllEmployees(activeBranchId));
            request.getRequestDispatcher("nhanvien.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String path = request.getServletPath();
        HrDAO dao = new HrDAO();
        HttpSession session = request.getSession();
        String maCN = (String) session.getAttribute("activeBranchId");

        if (path.equals("/phanca")) {
            String action = request.getParameter("action");
            
            // Luồng bổ sung: Cập nhật lịch vào CSDL
            if ("update".equals(action)) {
                dao.updateShift(
                    request.getParameter("oldMaNV"), request.getParameter("oldNgayLam"), request.getParameter("oldCaLam"),
                    request.getParameter("maNV"), request.getParameter("ngayLam"), request.getParameter("caLam")
                );
            } else {
                dao.addShift(request.getParameter("maNV"), maCN, request.getParameter("ngayLam"), request.getParameter("caLam"));
            }
            response.sendRedirect("phanca");
            
        } else if (path.equals("/nhanvien")) {
            String action = request.getParameter("action");
            String maNV = request.getParameter("maNV");
            String ho = request.getParameter("ho");
            String dem = request.getParameter("dem");
            String ten = request.getParameter("ten");
            String gioiTinh = request.getParameter("gioiTinh");
            String chucVu = request.getParameter("chucVu");
            String sdt = request.getParameter("sdt");
            double luong = Double.parseDouble(request.getParameter("luong"));

            if ("update".equals(action)) dao.updateEmployee(maNV, ho, dem, ten, gioiTinh, maCN, chucVu, sdt, luong);
            else dao.addEmployee(maNV, ho, dem, ten, gioiTinh, maCN, chucVu, sdt, luong);
            response.sendRedirect("nhanvien");
        }
    }
}