package dao;

import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.*;

public class ProductDAO {

    // ================= PHẦN SẢN PHẨM =================
    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM SanPham";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) list.add(new Product(rs.getString("MaSP"), rs.getString("TenSP"), rs.getDouble("GiaNiemYet"), rs.getString("MoTa")));
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public void addProduct(String maSP, String tenSP, double giaNiemYet, String moTa) {
        String query = "INSERT INTO SanPham VALUES (?, ?, ?, ?)";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maSP); ps.setString(2, tenSP); ps.setDouble(3, giaNiemYet); ps.setString(4, moTa); ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void deleteProduct(String maSP) {
        String queryPhaChe = "DELETE FROM PhaChe WHERE MaSP = ?";
        String querySanPham = "DELETE FROM SanPham WHERE MaSP = ?";
        try (Connection conn = new DBContext().getConnection()) {
            try(PreparedStatement ps1 = conn.prepareStatement(queryPhaChe)) { ps1.setString(1, maSP); ps1.executeUpdate(); }
            try(PreparedStatement ps2 = conn.prepareStatement(querySanPham)) { ps2.setString(1, maSP); ps2.executeUpdate(); }
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void updateProduct(String maSP, String tenSP, double giaNiemYet, String moTa) {
        String query = "UPDATE SanPham SET TenSP=?, GiaNiemYet=?, MoTa=? WHERE MaSP=?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, tenSP); ps.setDouble(2, giaNiemYet); ps.setString(3, moTa); ps.setString(4, maSP);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    // ================= PHẦN NGUYÊN LIỆU =================
    public List<Ingredient> getAllIngredients() {
        List<Ingredient> list = new ArrayList<>();
        String query = "SELECT * FROM NguyenLieu";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) list.add(new Ingredient(rs.getString("MaNL"), rs.getString("TenNL"), rs.getString("DonVi")));
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public void addIngredient(String maNL, String tenNL, String donVi) {
        String query = "INSERT INTO NguyenLieu (MaNL, TenNL, DonVi) VALUES (?, ?, ?)";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maNL); ps.setString(2, tenNL); ps.setString(3, donVi); ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void deleteIngredient(String maNL) {
        String q1 = "DELETE FROM PhaChe WHERE MaNL = ?";
        String q2 = "DELETE FROM TonKho WHERE MaNL = ?";
        String q3 = "DELETE FROM CungCap WHERE MaNL = ?";
        String q4 = "DELETE FROM ChiTietPhieuNhap WHERE MaNL = ?";
        String q5 = "DELETE FROM NguyenLieu WHERE MaNL = ?";
        try (Connection conn = new DBContext().getConnection()) {
            try(PreparedStatement p1 = conn.prepareStatement(q1)){ p1.setString(1, maNL); p1.executeUpdate(); }
            try(PreparedStatement p2 = conn.prepareStatement(q2)){ p2.setString(1, maNL); p2.executeUpdate(); }
            try(PreparedStatement p3 = conn.prepareStatement(q3)){ p3.setString(1, maNL); p3.executeUpdate(); }
            try(PreparedStatement p4 = conn.prepareStatement(q4)){ p4.setString(1, maNL); p4.executeUpdate(); }
            try(PreparedStatement p5 = conn.prepareStatement(q5)){ p5.setString(1, maNL); p5.executeUpdate(); }
        } catch (Exception e) { e.printStackTrace(); }
    }

    public Ingredient getIngredientById(String maNL) {
        String query = "SELECT * FROM NguyenLieu WHERE MaNL = ?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maNL);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return new Ingredient(rs.getString("MaNL"), rs.getString("TenNL"), rs.getString("DonVi"));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    public void updateIngredient(String maNL, String tenNL, String donVi) {
        String query = "UPDATE NguyenLieu SET TenNL = ?, DonVi = ? WHERE MaNL = ?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, tenNL); ps.setString(2, donVi); ps.setString(3, maNL);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    // ================= PHẦN CÔNG THỨC & TỒN KHO =================
    public void deleteRecipeDetails(String maSP) {
        String query = "DELETE FROM PhaChe WHERE MaSP=?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maSP); ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public List<Recipe> getAllRecipes() {
        List<Recipe> list = new ArrayList<>();
        String query = "SELECT p.MaSP, s.TenSP, p.MaNL, n.TenNL, n.DonVi, p.DinhLuong FROM PhaChe p JOIN SanPham s ON p.MaSP = s.MaSP JOIN NguyenLieu n ON p.MaNL = n.MaNL";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Recipe r = new Recipe(rs.getString("MaSP"), rs.getString("MaNL"), rs.getDouble("DinhLuong"));
                r.setTenSP(rs.getString("TenSP")); r.setTenNL(rs.getString("TenNL")); r.setDonVi(rs.getString("DonVi"));
                list.add(r);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public void addRecipeDetail(String maSP, String maNL, double dinhLuong) {
        String query = "INSERT INTO PhaChe VALUES (?, ?, ?)";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maSP); ps.setString(2, maNL); ps.setDouble(3, dinhLuong); ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public List<Inventory> getAllInventory() {
        List<Inventory> list = new ArrayList<>();
        String query = "SELECT t.MaCN, c.TenCN, t.MaNL, n.TenNL, n.DonVi, t.SoLuong FROM TonKho t JOIN ChiNhanh c ON t.MaCN = c.MaCN JOIN NguyenLieu n ON t.MaNL = n.MaNL";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Inventory inv = new Inventory(rs.getString("MaCN"), rs.getString("MaNL"), rs.getDouble("SoLuong"));
                inv.setTenCN(rs.getString("TenCN")); inv.setTenNL(rs.getString("TenNL")); inv.setDonVi(rs.getString("DonVi"));
                list.add(inv);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public void updateInventory(String maCN, String maNL, double soLuong) {
        String query = "IF EXISTS (SELECT 1 FROM TonKho WHERE MaCN = ? AND MaNL = ?) " +
                       "BEGIN UPDATE TonKho SET SoLuong = ? WHERE MaCN = ? AND MaNL = ? END " +
                       "ELSE BEGIN INSERT INTO TonKho VALUES (?, ?, ?) END";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maCN); ps.setString(2, maNL); ps.setDouble(3, soLuong); ps.setString(4, maCN); ps.setString(5, maNL);
            ps.setString(6, maCN); ps.setString(7, maNL); ps.setDouble(8, soLuong); ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    // ================= PHẦN ĐỐI TÁC & BÁO GIÁ =================
    public List<Supplier> getAllSuppliers() {
        List<Supplier> list = new ArrayList<>();
        String query = "SELECT * FROM NhaCungCap";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) list.add(new Supplier(rs.getString("MaNCC"), rs.getString("TenNCC"), rs.getString("SDT"), rs.getString("Email")));
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public void addSupplier(String maNCC, String tenNCC, String sdt, String email) {
        String query = "INSERT INTO NhaCungCap VALUES (?, ?, ?, ?)";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maNCC); ps.setString(2, tenNCC); ps.setString(3, sdt); ps.setString(4, email); ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public Supplier getSupplierById(String maNCC) {
        String query = "SELECT * FROM NhaCungCap WHERE MaNCC = ?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maNCC);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return new Supplier(rs.getString("MaNCC"), rs.getString("TenNCC"), rs.getString("SDT"), rs.getString("Email"));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    public void updateSupplier(String maNCC, String tenNCC, String sdt, String email) {
        String query = "UPDATE NhaCungCap SET TenNCC=?, SDT=?, Email=? WHERE MaNCC=?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, tenNCC); ps.setString(2, sdt); ps.setString(3, email); ps.setString(4, maNCC);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void deleteSupplier(String maNCC) {
        String q1 = "DELETE FROM CungCap WHERE MaNCC = ?";
        String q2 = "UPDATE PhieuNhapHang SET MaNCC = NULL WHERE MaNCC = ?";
        String q3 = "DELETE FROM NhaCungCap WHERE MaNCC = ?";
        try (Connection conn = new DBContext().getConnection()) {
            try(PreparedStatement p1 = conn.prepareStatement(q1)){ p1.setString(1, maNCC); p1.executeUpdate(); }
            try(PreparedStatement p2 = conn.prepareStatement(q2)){ p2.setString(1, maNCC); p2.executeUpdate(); }
            try(PreparedStatement p3 = conn.prepareStatement(q3)){ p3.setString(1, maNCC); p3.executeUpdate(); }
        } catch (Exception e) { e.printStackTrace(); }
    }

    public List<Supply> getAllSupplies() {
        List<Supply> list = new ArrayList<>();
        String query = "SELECT c.MaNCC, ncc.TenNCC, c.MaNL, n.TenNL, n.DonVi, c.DonGiaNiemYet FROM CungCap c " +
                       "JOIN NhaCungCap ncc ON c.MaNCC = ncc.MaNCC JOIN NguyenLieu n ON c.MaNL = n.MaNL";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Supply s = new Supply(rs.getString("MaNCC"), rs.getString("MaNL"), rs.getDouble("DonGiaNiemYet"));
                s.setTenNCC(rs.getString("TenNCC")); s.setTenNL(rs.getString("TenNL")); s.setDonVi(rs.getString("DonVi"));
                list.add(s);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public void addSupply(String maNCC, String maNL, double donGiaNiemYet) {
        String query = "INSERT INTO CungCap VALUES (?, ?, ?)";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maNCC); ps.setString(2, maNL); ps.setDouble(3, donGiaNiemYet); ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public Supply getSupply(String maNCC, String maNL) {
        String query = "SELECT c.MaNCC, ncc.TenNCC, c.MaNL, n.TenNL, n.DonVi, c.DonGiaNiemYet FROM CungCap c JOIN NhaCungCap ncc ON c.MaNCC = ncc.MaNCC JOIN NguyenLieu n ON c.MaNL = n.MaNL WHERE c.MaNCC = ? AND c.MaNL = ?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maNCC); ps.setString(2, maNL);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Supply s = new Supply(rs.getString("MaNCC"), rs.getString("MaNL"), rs.getDouble("DonGiaNiemYet"));
                    s.setTenNCC(rs.getString("TenNCC")); s.setTenNL(rs.getString("TenNL")); s.setDonVi(rs.getString("DonVi"));
                    return s;
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    public void updateSupply(String maNCC, String maNL, double donGia) {
        String query = "UPDATE CungCap SET DonGiaNiemYet = ? WHERE MaNCC = ? AND MaNL = ?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setDouble(1, donGia); ps.setString(2, maNCC); ps.setString(3, maNL);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void deleteSupply(String maNCC, String maNL) {
        String query = "DELETE FROM CungCap WHERE MaNCC = ? AND MaNL = ?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maNCC); ps.setString(2, maNL);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
}