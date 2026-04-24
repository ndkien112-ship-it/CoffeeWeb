// 4. File dao/TransactionDAO.java (Gộp xử lý Hóa đơn & Phiếu nhập)
package dao;
import dal.DBContext;
import java.sql.*;
import java.util.*;
import model.HoaDon;
import model.PhieuNhap;

public class TransactionDAO {
    // Lấy danh sách Hóa đơn
    public List<HoaDon> getAllInvoices() {
        List<HoaDon> list = new ArrayList<>();
        String query = "SELECT * FROM HoaDon ORDER BY NgayLap DESC";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new HoaDon(rs.getString("MaHD"), rs.getString("NgayLap"), rs.getString("ThoiGianLap"),
                        rs.getString("PTThanhToan"), rs.getDouble("ThanhTien"), rs.getString("MaKH"),
                        rs.getString("MaNV"), rs.getString("MaCN")));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // Lấy danh sách Phiếu nhập
    public List<PhieuNhap> getAllImports() {
        List<PhieuNhap> list = new ArrayList<>();
        String query = "SELECT * FROM PhieuNhapHang ORDER BY NgayNhap DESC";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new PhieuNhap(rs.getString("MaPhieu"), rs.getString("NgayNhap"), rs.getDouble("ThanhTien"),
                        rs.getString("TTThanhToan"), rs.getString("MaNCC"), rs.getString("MaNV"), rs.getString("MaCN")));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
}