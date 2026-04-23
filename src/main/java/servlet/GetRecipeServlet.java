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

@WebServlet(name = "GetRecipeServlet", urlPatterns = {"/GetRecipeServlet"})
public class GetRecipeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        // 1. Lấy mã sản phẩm gửi từ web sang
        String pid = request.getParameter("pid");
        
        // 2. Gọi DAO để lấy danh sách nguyên liệu
        DrinkDAO dao = new DrinkDAO();
        List<CongThuc> list = dao.getRecipeByPID(Integer.parseInt(pid));
        
        // 3. Biến danh sách thành chuỗi JSON đơn giản
        PrintWriter out = response.getWriter();
        StringBuilder json = new StringBuilder("[");
        for (int i = 0; i < list.size(); i++) {
            json.append(String.format("{\"ten\":\"%s\", \"luong\":\"%s\"}", 
                    list.get(i).getTenNguyenLieu(), 
                    list.get(i).getHamLuong()));
            if (i < list.size() - 1) json.append(",");
        }
        json.append("]");
        
        out.print(json.toString());
        out.flush();
    }
} 