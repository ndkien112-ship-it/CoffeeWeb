package dao;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class EditProductDAO {

    // Hàm cập nhật thông tin đồ uống
    public void updateProduct(String maSP, String tenSP, double giaNiemYet, String moTa) {
        String query = "UPDATE SanPham SET TenSP=?, GiaNiemYet=?, MoTa=? WHERE MaSP=?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, tenSP); 
            ps.setDouble(2, giaNiemYet);
            ps.setString(3, moTa); 
            ps.setString(4, maSP);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    // Hàm xóa công thức cũ (chú ý tên bảng đã được sửa chuẩn là PhaChe)
    public void deleteRecipeDetails(String maSP) {
        String query = "DELETE FROM PhaChe WHERE MaSP=?"; 
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maSP);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
}