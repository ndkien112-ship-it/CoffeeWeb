package servlet;

import dao.ProductDAO;
import dao.BranchDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(name = "ProductControl", urlPatterns = {"/sanpham"})
public class ProductControl extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductDAO dao = new ProductDAO();
        String action = request.getParameter("action");

        // --- CÁC LỆNH XÓA ---
        if ("delete".equals(action)) {
            dao.deleteProduct(request.getParameter("id"));
            response.sendRedirect("sanpham");
            return;
        }
        if ("deleteNL".equals(action)) {
            dao.deleteIngredient(request.getParameter("id"));
            response.sendRedirect("sanpham");
            return;
        }
        if ("deleteNCC".equals(action)) {
            dao.deleteSupplier(request.getParameter("id"));
            response.sendRedirect("sanpham");
            return;
        }
        if ("deleteCC".equals(action)) {
            dao.deleteSupply(request.getParameter("maNCC"), request.getParameter("maNL"));
            response.sendRedirect("sanpham");
            return;
        }

        // --- CÁC LỆNH MỞ FORM SỬA ---
        if ("edit".equals(action)) {
            request.setAttribute("editId", request.getParameter("id"));
            request.setAttribute("listSP", dao.getAllProducts());
            request.setAttribute("listNL", dao.getAllIngredients());
            request.setAttribute("listPC", dao.getAllRecipes());
            request.getRequestDispatcher("editSanPham.jsp").forward(request, response);
            return;
        }
        if ("editNL".equals(action)) {
            request.setAttribute("nlEdit", dao.getIngredientById(request.getParameter("id")));
            request.getRequestDispatcher("editNguyenLieu.jsp").forward(request, response);
            return;
        }
        if ("editNCC".equals(action)) {
            request.setAttribute("nccEdit", dao.getSupplierById(request.getParameter("id")));
            request.getRequestDispatcher("editNCC.jsp").forward(request, response);
            return;
        }
        if ("editCC".equals(action)) {
            request.setAttribute("ccEdit", dao.getSupply(request.getParameter("maNCC"), request.getParameter("maNL")));
            request.getRequestDispatcher("editCungCap.jsp").forward(request, response);
            return;
        }

        // --- MẶC ĐỊNH: ĐỔ TOÀN BỘ DANH SÁCH ---
        request.setAttribute("listSP", dao.getAllProducts());
        request.setAttribute("listNL", dao.getAllIngredients());
        request.setAttribute("listPC", dao.getAllRecipes());
        request.setAttribute("listTK", dao.getAllInventory());
        request.setAttribute("listCN", new BranchDAO().getAllBranches());
        request.setAttribute("listNCC", dao.getAllSuppliers());
        request.setAttribute("listCC", dao.getAllSupplies());
        
        request.getRequestDispatcher("sanpham.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        ProductDAO dao = new ProductDAO();
        String action = request.getParameter("action");

        // --- CÁC LỆNH LƯU CẬP NHẬT ---
        if ("update".equals(action)) {
            String maSP = request.getParameter("maSP");
            dao.updateProduct(maSP, request.getParameter("tenSP"), Double.parseDouble(request.getParameter("giaNiemYet")), request.getParameter("moTa"));
            dao.deleteRecipeDetails(maSP);
            
            String[] danhSachMaNL = request.getParameterValues("maNL");
            String[] danhSachSoLuong = request.getParameterValues("soLuongNL");
            if (danhSachMaNL != null && danhSachSoLuong != null) {
                for (int i = 0; i < danhSachMaNL.length; i++) {
                    if (danhSachMaNL[i] != null && !danhSachMaNL[i].trim().isEmpty()) {
                        dao.addRecipeDetail(maSP, danhSachMaNL[i], Double.parseDouble(danhSachSoLuong[i]));
                    }
                }
            }
            response.sendRedirect("sanpham");
            return;
        }
        if ("updateNL".equals(action)) {
            dao.updateIngredient(request.getParameter("maNL"), request.getParameter("tenNL"), request.getParameter("donVi"));
            response.sendRedirect("sanpham");
            return;
        }
        if ("updateNCC".equals(action)) {
            dao.updateSupplier(request.getParameter("maNCC"), request.getParameter("tenNCC"), request.getParameter("sdt"), request.getParameter("email"));
            response.sendRedirect("sanpham");
            return;
        }
        if ("updateCC".equals(action)) {
            dao.updateSupply(request.getParameter("maNCC"), request.getParameter("maNL"), Double.parseDouble(request.getParameter("donGiaNiemYet")));
            response.sendRedirect("sanpham");
            return;
        }

        // --- CÁC LỆNH THÊM MỚI ---
        if ("addSP".equals(action) || "add".equals(action)) {
            String maSP = request.getParameter("maSP");
            dao.addProduct(maSP, request.getParameter("tenSP"), Double.parseDouble(request.getParameter("giaNiemYet")), request.getParameter("moTa"));
            
            String[] danhSachMaNL = request.getParameterValues("maNL");
            String[] danhSachSoLuong = request.getParameterValues("soLuongNL");
            if (danhSachMaNL != null && danhSachSoLuong != null) {
                for (int i = 0; i < danhSachMaNL.length; i++) {
                    if (danhSachMaNL[i] != null && !danhSachMaNL[i].trim().isEmpty()) {
                        dao.addRecipeDetail(maSP, danhSachMaNL[i], Double.parseDouble(danhSachSoLuong[i]));
                    }
                }
            }
        } else if ("addNL".equals(action)) {
            dao.addIngredient(request.getParameter("maNL"), request.getParameter("tenNL"), request.getParameter("donVi"));
        } else if ("addPhaChe".equals(action)) {
            dao.addRecipeDetail(request.getParameter("maSP"), request.getParameter("maNL"), Double.parseDouble(request.getParameter("dinhLuong")));
        } else if ("addTonKho".equals(action)) {
            dao.updateInventory(request.getParameter("maCN"), request.getParameter("maNL"), Double.parseDouble(request.getParameter("soLuong")));
        } else if ("addNCC".equals(action)) {
            dao.addSupplier(request.getParameter("maNCC"), request.getParameter("tenNCC"), request.getParameter("sdt"), request.getParameter("email"));
        } else if ("addCungCap".equals(action)) {
            dao.addSupply(request.getParameter("maNCC"), request.getParameter("maNL"), Double.parseDouble(request.getParameter("donGiaNiemYet")));
        }

        response.sendRedirect("sanpham");
    }
}