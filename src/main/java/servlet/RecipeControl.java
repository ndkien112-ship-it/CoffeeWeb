package servlet;

import dao.RecipeDAO;
import dao.ProductDAO;
import dao.IngredientDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "RecipeControl", urlPatterns = {"/recipe"})
public class RecipeControl extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String maSP = request.getParameter("maSP");
        request.setAttribute("product", new ProductDAO().getProductByID(maSP));
        request.setAttribute("recipeList", new RecipeDAO().getRecipeByProduct(maSP));
        request.setAttribute("ingredients", new IngredientDAO().getAllIngredients());
        request.getRequestDispatcher("phache.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String maSP = request.getParameter("maSP");
        int maNL = Integer.parseInt(request.getParameter("maNL"));
        String dinhLuong = request.getParameter("dinhLuong");
        new RecipeDAO().addRecipe(maSP, maNL, dinhLuong);
        response.sendRedirect("recipe?maSP=" + maSP);
    }
}
