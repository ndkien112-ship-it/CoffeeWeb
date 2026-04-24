package dao;

import dal.DBContext;
import java.sql.*;
import java.util.*;
import model.NguyenLieu;

public class IngredientDAO {
    public List<NguyenLieu> getAllIngredients() {
        List<NguyenLieu> list = new ArrayList<>();
        String query = "SELECT * FROM NguyenLieu";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new NguyenLieu(rs.getInt("MaNL"), rs.getString("TenNL"), rs.getString("DonVi")));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
}