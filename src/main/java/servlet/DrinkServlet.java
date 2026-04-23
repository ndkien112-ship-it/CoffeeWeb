package servlet;

import dao.DrinkDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CongThuc;
import model.SanPham;

@WebServlet(name = "DrinkServlet", urlPatterns = {"/menu"})
public class DrinkServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String pid = request.getParameter("pid");

        // TRƯỜNG HỢP 1: Load trang menu lần đầu (không có pid)
        if (pid == null) {
            DrinkDAO dao = new DrinkDAO();
List<SanPham> list = dao.getAllDrinks();
            request.setAttribute("data", list);
            request.getRequestDispatcher("menu.jsp").forward(request, response);
            return; 
        }

        // TRƯỜNG HỢP 2: Trả về JSON định lượng (có pid từ AJAX)
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        DrinkDAO dao = new DrinkDAO();
        List<CongThuc> list = dao.getRecipeByPID(Integer.parseInt(pid));
        
        PrintWriter out = response.getWriter();
        StringBuilder json = new StringBuilder("[");
        for (int i = 0; i < list.size(); i++) {
            String t = list.get(i).getTenNguyenLieu();
            String l = list.get(i).getHamLuong();

            json.append("{");
            json.append("\"ten\":\"").append(t).append("\",");
            json.append("\"luong\":\"").append(l).append("\"");
            json.append("}");

            if (i < list.size() - 1) json.append(",");
        }
        json.append("]");
        
        out.print(json.toString());
        out.flush();
    }
}