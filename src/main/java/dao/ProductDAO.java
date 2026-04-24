package dao;

import dal.DBContext;
import java.sql.*;
import java.util.*;
import model.Drink;

public class ProductDAO {
    public List<Drink> getAllProducts() {
        List<Drink> list = new ArrayList<>();
        String query = "SELECT * FROM SanPham";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new Drink(rs.getString("MaSP"), rs.getString("TenSP"), 
                        rs.getDouble("GiaNiemYet"), rs.getString("MoTa"), 
                        rs.getString("HinhAnh"), rs.getInt("MaLoai")));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public void addProduct(String id, String name, double price, String desc, int type) {
        String query = "INSERT INTO SanPham (MaSP, TenSP, GiaNiemYet, MoTa, MaLoai) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, id); ps.setString(2, name);
            ps.setDouble(3, price); ps.setString(4, desc); ps.setInt(5, type);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void deleteProduct(String pid) {
        try (Connection conn = new DBContext().getConnection()) {
            // Xóa bảng con trước để tránh lỗi ràng buộc [cite: 178]
            PreparedStatement ps1 = conn.prepareStatement("DELETE FROM ChiTiet WHERE MaSP = ?");
            ps1.setString(1, pid); ps1.executeUpdate();
            PreparedStatement ps2 = conn.prepareStatement("DELETE FROM PhaChe WHERE MaSP = ?");
            ps2.setString(1, pid); ps2.executeUpdate();
            // Xóa bảng cha
            PreparedStatement ps3 = conn.prepareStatement("DELETE FROM SanPham WHERE MaSP = ?");
            ps3.setString(1, pid); ps3.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public Object getProductByID(String maSP) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}