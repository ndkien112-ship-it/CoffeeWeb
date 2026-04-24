package dao;

import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Drink;

public class ProductDAO {

    // Lấy danh sách toàn bộ thực đơn
    public List<Drink> getAllProducts() {
        List<Drink> list = new ArrayList<>();
        String query = "SELECT * FROM SanPham";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
             
            while (rs.next()) {
                list.add(new Drink(
                    rs.getString("MaSP"),
                    rs.getString("TenSP"),
                    rs.getInt("MaLoai"),      // SQL gọi là MaLoai, Java lấy kiểu int
                    rs.getDouble("GiaNiemYet") // SQL gọi là GiaNiemYet
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Thêm món mới vào thực đơn
    public void addProduct(String maSP, String tenSP, int maLoai, double giaNiemYet) {
        String query = "INSERT INTO SanPham (MaSP, TenSP, MaLoai, GiaNiemYet) VALUES (?, ?, ?, ?)";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
             
            ps.setString(1, maSP);
            ps.setString(2, tenSP);
            ps.setInt(3, maLoai);
            ps.setDouble(4, giaNiemYet);
            
            ps.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}