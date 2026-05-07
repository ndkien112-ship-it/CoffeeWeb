package servlet;

import dao.ProductDAO;
import dao.EditProductDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "EditProductControl", urlPatterns = {"/editProduct"})
public class EditProductControl extends HttpServlet {

    // Xử lý khi người dùng bấm nút Sửa -> Mở form
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO pDao = new ProductDAO(); // Dùng DAO cũ để lấy danh sách hiển thị
        
        request.setAttribute("editId", request.getParameter("id"));
        request.setAttribute("listSP", pDao.getAllProducts());
        request.setAttribute("listNL", pDao.getAllIngredients());
        request.setAttribute("listPC", pDao.getAllRecipes());
        
        request.getRequestDispatcher("editSanPham.jsp").forward(request, response);
    }

    // Xử lý khi người dùng bấm Lưu Cập Nhật -> Ghi vào Database
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        EditProductDAO editDao = new EditProductDAO(); // DAO mới chuyên cập nhật
        ProductDAO pDao = new ProductDAO(); // DAO cũ để dùng lại hàm thêm công thức

        String maSP = request.getParameter("maSP");
        String tenSP = request.getParameter("tenSP");
        double giaNiemYet = Double.parseDouble(request.getParameter("giaNiemYet"));
        String moTa = request.getParameter("moTa");

        // 1. Cập nhật thông tin đồ uống
        editDao.updateProduct(maSP, tenSP, giaNiemYet, moTa);
        
        // 2. Xóa các nguyên liệu cũ
        editDao.deleteRecipeDetails(maSP);
        
        // 3. Lưu lại công thức mới
        String[] danhSachMaNL = request.getParameterValues("maNL");
        String[] danhSachSoLuong = request.getParameterValues("soLuongNL");

        if (danhSachMaNL != null && danhSachSoLuong != null) {
            for (int i = 0; i < danhSachMaNL.length; i++) {
                String maNL = danhSachMaNL[i];
                String soLuongStr = danhSachSoLuong[i];
                if (maNL != null && !maNL.trim().isEmpty() && soLuongStr != null && !soLuongStr.trim().isEmpty()) {
                    // Dùng lại hàm addRecipeDetail đã viết sẵn rất tốt của bạn
                    pDao.addRecipeDetail(maSP, maNL, Double.parseDouble(soLuongStr));
                }
            }
        }
        
        // Sửa xong thì điều hướng trở về trang danh sách
        response.sendRedirect("sanpham");
    }
}
