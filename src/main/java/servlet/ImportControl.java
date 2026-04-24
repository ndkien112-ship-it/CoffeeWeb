package servlet;
import dao.TransactionDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
@WebServlet(name = "ImportControl", urlPatterns = {"/imports"})
public class ImportControl extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listP", new TransactionDAO().getAllImports());
        request.getRequestDispatcher("phieunhap.jsp").forward(request, response);
    }
}
