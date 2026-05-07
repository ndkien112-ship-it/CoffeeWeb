package dao;

import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.*; // Đã đổi để nhận diện được cả ImportReceipt và ImportReceiptDetail

public class ImportDAO {

    // ================== CÁC HÀM TẢI DANH SÁCH & THÊM MỚI ==================
    public List<ImportReceipt> getAllReceipts() {
        List<ImportReceipt> list = new ArrayList<>();
        String query = "SELECT p.*, n.TenNCC, c.TenCN, (v.Ho + ' ' + ISNULL(v.Dem + ' ', '') + v.Ten) AS TenNV " +
                       "FROM PhieuNhapHang p " +
                       "LEFT JOIN NhaCungCap n ON p.MaNCC = n.MaNCC " +
                       "LEFT JOIN ChiNhanh c ON p.MaCN = c.MaCN " +
                       "LEFT JOIN NhanVien v ON p.MaNV = v.MaNV " +
                       "ORDER BY p.NgayNhap DESC";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                ImportReceipt receipt = new ImportReceipt(
                    rs.getString("MaPhieu"), rs.getDate("NgayNhap"), rs.getDouble("ThanhTien"), 
                    rs.getString("TTThanhToan"), rs.getString("MaNCC"), rs.getString("MaCN"), rs.getString("MaNV")
                );
                receipt.setTenNCC(rs.getString("TenNCC"));
                receipt.setTenCN(rs.getString("TenCN")); 
                receipt.setTenNhanVien(rs.getString("TenNV")); 
                list.add(receipt);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public void addReceipt(String maPhieu, String ngayNhap, double thanhTien, String ttThanhToan, String maNCC, String maCN, String maNV) {
        String query = "INSERT INTO PhieuNhapHang (MaPhieu, NgayNhap, ThanhTien, TTThanhToan, MaNCC, MaCN, MaNV) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maPhieu); ps.setString(2, ngayNhap); ps.setDouble(3, thanhTien);
            ps.setString(4, ttThanhToan); ps.setString(5, maNCC); ps.setString(6, maCN);
            if(maNV == null || maNV.trim().isEmpty()) { ps.setNull(7, java.sql.Types.VARCHAR); } 
            else { ps.setString(7, maNV); }
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void addReceiptDetail(String maPhieu, String maNL, double soLuong, double donGiaNhap) {
        String query = "INSERT INTO ChiTietPhieuNhap (MaPhieu, MaNL, SoLuong, DonGiaNhap) VALUES (?, ?, ?, ?)";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maPhieu); ps.setString(2, maNL); ps.setDouble(3, soLuong); ps.setDouble(4, donGiaNhap);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    // ================== CÁC HÀM SỬA / XÓA ==================
    public void deleteReceipt(String maPhieu) {
        String queryDetail = "DELETE FROM ChiTietPhieuNhap WHERE MaPhieu = ?";
        String queryMain = "DELETE FROM PhieuNhapHang WHERE MaPhieu = ?";
        try (Connection conn = new DBContext().getConnection()) {
            try (PreparedStatement ps1 = conn.prepareStatement(queryDetail)) {
                ps1.setString(1, maPhieu); ps1.executeUpdate();
            }
            try (PreparedStatement ps2 = conn.prepareStatement(queryMain)) {
                ps2.setString(1, maPhieu); ps2.executeUpdate();
            }
        } catch (Exception e) { e.printStackTrace(); }
    }

    public ImportReceipt getReceiptById(String maPhieu) {
        String query = "SELECT * FROM PhieuNhapHang WHERE MaPhieu = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maPhieu);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new ImportReceipt(
                        rs.getString("MaPhieu"), rs.getDate("NgayNhap"), rs.getDouble("ThanhTien"), 
                        rs.getString("TTThanhToan"), rs.getString("MaNCC"), rs.getString("MaCN"), rs.getString("MaNV")
                    );
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    public void updateReceipt(String maPhieu, String ngayNhap, double thanhTien, String ttThanhToan, String maNCC, String maCN, String maNV) {
        String query = "UPDATE PhieuNhapHang SET NgayNhap=?, ThanhTien=?, TTThanhToan=?, MaNCC=?, MaCN=?, MaNV=? WHERE MaPhieu=?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, ngayNhap); ps.setDouble(2, thanhTien); ps.setString(3, ttThanhToan);
            ps.setString(4, maNCC); ps.setString(5, maCN);
            if(maNV == null || maNV.trim().isEmpty()) { ps.setNull(6, java.sql.Types.VARCHAR); } 
            else { ps.setString(6, maNV); }
            ps.setString(7, maPhieu);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void deleteReceiptDetails(String maPhieu) {
        String query = "DELETE FROM ChiTietPhieuNhap WHERE MaPhieu = ?";
        try (Connection conn = new dal.DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maPhieu);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    // ĐÂY LÀ HÀM ĐÃ ĐƯỢC FIX (THAY THẾ CHO HÀM BỊ LỖI UNSUPPORTED TRƯỚC ĐÓ)
    public List<ImportReceiptDetail> getReceiptDetailsByMaPhieu(String maPhieu) {
        List<ImportReceiptDetail> list = new ArrayList<>();
        String query = "SELECT * FROM ChiTietPhieuNhap WHERE MaPhieu = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maPhieu);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new ImportReceiptDetail(
                        rs.getString("MaPhieu"), 
                        rs.getString("MaNL"), 
                        rs.getDouble("SoLuong"), 
                        rs.getDouble("DonGiaNhap")
                    ));
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
}