package dao;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.SanPham;
import model.CongThuc;

public class DrinkDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // Hàm lấy tất cả sản phẩm để hiện ra Menu
    public List<SanPham> getAllDrinks() {
        List<SanPham> list = new ArrayList<>();
String query = "SELECT * FROM SanPham ORDER BY MaLoai ASC, TenSP ASC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new SanPham(
                    rs.getInt("MaSP"),
                    rs.getString("TenSP"),
                    rs.getDouble("Gia"),
                    rs.getString("MoTa"),
                    rs.getString("HinhAnh"),
                    rs.getInt("MaLoai")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Hàm lấy công thức dựa theo ID sản phẩm (Dùng cho cái Modal chi tiết)
    public List<CongThuc> getRecipeByPID(int pid) {
        List<CongThuc> list = new ArrayList<>();
        String query = "SELECT * FROM CongThuc WHERE MaSP = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, pid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new CongThuc(
                    rs.getInt("MaCT"),
                    rs.getInt("MaSP"),
                    rs.getString("TenNguyenLieu"),
                    rs.getString("HamLuong")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}