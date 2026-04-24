package dao;

import dal.DBContext;
import java.sql.*;
import java.util.*;

public class RecipeDAO {
    // Lấy danh sách nguyên liệu của một món
    public List<Map<String, String>> getRecipeByProduct(String maSP) {
        List<Map<String, String>> list = new ArrayList<>();
        String query = "SELECT pc.MaNL, nl.TenNL, pc.DinhLuong FROM PhaChe pc " +
                       "JOIN NguyenLieu nl ON pc.MaNL = nl.MaNL WHERE pc.MaSP = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maSP);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, String> map = new HashMap<>();
                map.put("maNL", rs.getString("MaNL"));
                map.put("tenNL", rs.getString("TenNL"));
                map.put("dinhLuong", rs.getString("DinhLuong"));
                list.add(map);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // Thêm công thức mới
    public void addRecipe(String maSP, int maNL, String dinhLuong) {
        String query = "INSERT INTO PhaChe (MaSP, MaNL, DinhLuong) VALUES (?, ?, ?)";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maSP);
            ps.setInt(2, maNL);
            ps.setString(3, dinhLuong);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
}