package dao;

import dal.DBContext;
import java.sql.*;
import java.util.*;
import model.CaLamViec;
import model.PhanCong;

public class ShiftDAO {
    
    // 1. Lấy danh sách các ca làm việc (Sáng, Chiều, Tối...)
    public List<CaLamViec> getAllShifts() {
        List<CaLamViec> list = new ArrayList<>();
        String query = "SELECT * FROM CaLamViec";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new CaLamViec(rs.getString("MaCa"), rs.getString("TenCa"), 
                         rs.getString("GioBatDau"), rs.getString("GioKetThuc")));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // 2. Lấy danh sách phân công (Có JOIN để lấy tên nhân viên và tên ca)
    public List<PhanCong> getAllAssignments() {
        List<PhanCong> list = new ArrayList<>();
        String query = "SELECT pc.MaNV, nv.Ten, pc.MaCa, c.TenCa, pc.NgayLam, pc.TrangThai " +
                       "FROM PhanCong pc " +
                       "JOIN NhanVien nv ON pc.MaNV = nv.MaNV " +
                       "JOIN CaLamViec c ON pc.MaCa = c.MaCa " +
                       "ORDER BY pc.NgayLam DESC, pc.MaCa ASC";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new PhanCong(
                    rs.getString("MaNV"), rs.getString("Ten"), 
                    rs.getString("MaCa"), rs.getString("TenCa"), 
                    rs.getString("NgayLam"), rs.getString("TrangThai")
                ));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // 3. Thêm phân công mới cho nhân viên
    public void addAssignment(String maNV, String maCa, String ngayLam, String trangThai) {
        String query = "INSERT INTO PhanCong (MaNV, MaCa, NgayLam, TrangThai) VALUES (?, ?, ?, ?)";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maNV);
            ps.setString(2, maCa);
            ps.setString(3, ngayLam);
            ps.setString(4, trangThai);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
    // 4. Lấy 1 bản ghi phân công (Dùng cho chức năng Sửa)
    public PhanCong getAssignment(String maNV, String maCa, String ngayLam) {
        String query = "SELECT pc.MaNV, nv.Ten, pc.MaCa, c.TenCa, pc.NgayLam, pc.TrangThai " +
                       "FROM PhanCong pc " +
                       "JOIN NhanVien nv ON pc.MaNV = nv.MaNV " +
                       "JOIN CaLamViec c ON pc.MaCa = c.MaCa " +
                       "WHERE pc.MaNV = ? AND pc.MaCa = ? AND pc.NgayLam = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maNV);
            ps.setString(2, maCa);
            ps.setString(3, ngayLam);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new PhanCong(rs.getString("MaNV"), rs.getString("Ten"),
                                    rs.getString("MaCa"), rs.getString("TenCa"),
                                    rs.getString("NgayLam"), rs.getString("TrangThai"));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    // 5. Cập nhật Trạng thái đi làm
    public void updateAssignment(String maNV, String maCa, String ngayLam, String trangThai) {
        String query = "UPDATE PhanCong SET TrangThai = ? WHERE MaNV = ? AND MaCa = ? AND NgayLam = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, trangThai);
            ps.setString(2, maNV);
            ps.setString(3, maCa);
            ps.setString(4, ngayLam);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    // 6. Xóa lịch phân công
    public void deleteAssignment(String maNV, String maCa, String ngayLam) {
        String query = "DELETE FROM PhanCong WHERE MaNV = ? AND MaCa = ? AND NgayLam = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maNV);
            ps.setString(2, maCa);
            ps.setString(3, ngayLam);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
}
