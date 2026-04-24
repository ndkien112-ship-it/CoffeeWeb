package servlet;
import dao.TransactionDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "InvoiceControl", urlPatterns = {"/invoices"})
public class InvoiceControl extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("listH", new TransactionDAO().getAllInvoices());
        request.getRequestDispatcher("hoadon.jsp").forward(request, response);
    }
}