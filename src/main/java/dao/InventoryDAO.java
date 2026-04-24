package dao;

import dal.DBContext;
import java.sql.*;
import java.util.*;

public class InventoryDAO {
    public List<Map<String, String>> getStockByBranch(String maCN) {
        List<Map<String, String>> list = new ArrayList<>();
        String query = "SELECT nl.TenNL, tk.SoLuong, nl.DonVi FROM TonKho tk " +
                       "JOIN NguyenLieu nl ON tk.MaNL = nl.MaNL WHERE tk.MaCN = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maCN);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, String> map = new HashMap<>();
                map.put("tenNL", rs.getString("TenNL"));
                map.put("soLuong", rs.getString("SoLuong"));
                map.put("donVi", rs.getString("DonVi"));
                list.add(map);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
}