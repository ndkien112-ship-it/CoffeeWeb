package dao;

import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Employee;
import model.PhanCa;

public class HrDAO {

    // ================= PHẦN NHÂN VIÊN =================
    public List<Employee> getAllEmployees(String maCN) {
        List<Employee> list = new ArrayList<>();
        String query = "SELECT * FROM NhanVien WHERE MaCN = ?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maCN);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new Employee(
                        rs.getString("MaNV"), rs.getString("Ho"), rs.getString("Dem"), rs.getString("Ten"),
                        rs.getString("GioiTinh"), rs.getString("MaCN"), rs.getString("ChucVu"), rs.getString("SDT"), rs.getDouble("Luong")
                    ));
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public void addEmployee(String maNV, String ho, String dem, String ten, String gioiTinh, String maCN, String chucVu, String sdt, double luong) {
        String query = "INSERT INTO NhanVien (MaNV, Ho, Dem, Ten, GioiTinh, MaCN, ChucVu, SDT, Luong) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maNV); ps.setString(2, ho); ps.setString(3, dem);
            ps.setString(4, ten); ps.setString(5, gioiTinh); ps.setString(6, maCN);
            ps.setString(7, chucVu); ps.setString(8, sdt); ps.setDouble(9, luong);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void deleteEmployee(String maNV) {
        String updateHoaDon = "UPDATE HoaDon SET MaNV = NULL WHERE MaNV = ?";
        String updatePhieuNhap = "UPDATE PhieuNhapHang SET MaNV = NULL WHERE MaNV = ?";
        String deletePhanCa = "DELETE FROM PhanCa WHERE MaNV = ?"; 
        String deleteNhanVien = "DELETE FROM NhanVien WHERE MaNV = ?";
        try (Connection conn = new DBContext().getConnection()) {
            try (PreparedStatement ps1 = conn.prepareStatement(updateHoaDon)) { ps1.setString(1, maNV); ps1.executeUpdate(); }
            try (PreparedStatement ps2 = conn.prepareStatement(updatePhieuNhap)) { ps2.setString(1, maNV); ps2.executeUpdate(); }
            try (PreparedStatement ps3 = conn.prepareStatement(deletePhanCa)) { ps3.setString(1, maNV); ps3.executeUpdate(); }
            try (PreparedStatement ps4 = conn.prepareStatement(deleteNhanVien)) { ps4.setString(1, maNV); ps4.executeUpdate(); }
        } catch (Exception e) { e.printStackTrace(); }
    }

    public Employee getEmployeeById(String maNV) {
        String query = "SELECT * FROM NhanVien WHERE MaNV = ?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maNV);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return new Employee(rs.getString("MaNV"), rs.getString("Ho"), rs.getString("Dem"), rs.getString("Ten"), rs.getString("GioiTinh"), rs.getString("MaCN"), rs.getString("ChucVu"), rs.getString("SDT"), rs.getDouble("Luong"));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    public void updateEmployee(String maNV, String ho, String dem, String ten, String gioiTinh, String maCN, String chucVu, String sdt, double luong) {
        String query = "UPDATE NhanVien SET Ho=?, Dem=?, Ten=?, GioiTinh=?, MaCN=?, ChucVu=?, SDT=?, Luong=? WHERE MaNV=?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, ho); ps.setString(2, dem); ps.setString(3, ten); ps.setString(4, gioiTinh); 
            ps.setString(5, maCN); ps.setString(6, chucVu); ps.setString(7, sdt); ps.setDouble(8, luong); ps.setString(9, maNV);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    // ================= PHẦN PHÂN CA LÀM VIỆC =================
    public List<PhanCa> getShiftsByBranch(String maCN) {
        List<PhanCa> list = new ArrayList<>();
        String query = "SELECT p.*, n.Ho, n.Dem, n.Ten FROM PhanCa p JOIN NhanVien n ON p.MaNV = n.MaNV WHERE p.MaCN = ? ORDER BY p.NgayLam DESC, p.GioBatDau ASC";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maCN);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    String tenNV = rs.getString("Ho") + " " + (rs.getString("Dem") == null ? "" : rs.getString("Dem") + " ") + rs.getString("Ten");
                    String gbd = rs.getString("GioBatDau"); if(gbd != null && gbd.length() >= 5) gbd = gbd.substring(0,5);
                    String gkt = rs.getString("GioKetThuc"); if(gkt != null && gkt.length() >= 5) gkt = gkt.substring(0,5);
                    list.add(new PhanCa(rs.getString("MaNV"), tenNV, rs.getDate("NgayLam"), rs.getString("CaLam"), gbd, gkt, rs.getString("MaCN")));
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public void addShift(String maNV, String maCN, String ngayLam, String caLam) {
        String query = "INSERT INTO PhanCa (MaNV, MaCN, NgayLam, CaLam, GioBatDau, GioKetThuc) VALUES (?, ?, ?, ?, ?, ?)";
        String gioBatDau = "00:00:00"; String gioKetThuc = "00:00:00";
        if ("Ca Sáng".equals(caLam)) { gioBatDau = "07:00:00"; gioKetThuc = "12:00:00"; }
        else if ("Ca Chiều".equals(caLam)) { gioBatDau = "12:00:00"; gioKetThuc = "17:00:00"; }
        else if ("Ca Tối".equals(caLam)) { gioBatDau = "17:00:00"; gioKetThuc = "22:30:00"; }

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maNV); ps.setString(2, maCN); ps.setDate(3, java.sql.Date.valueOf(ngayLam)); 
            ps.setString(4, caLam); ps.setTime(5, java.sql.Time.valueOf(gioBatDau)); ps.setTime(6, java.sql.Time.valueOf(gioKetThuc));
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void deleteShift(String maNV, String ngayLam, String caLam) {
        String query = "DELETE FROM PhanCa WHERE MaNV = ? AND NgayLam = ? AND CaLam = ?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maNV); ps.setDate(2, java.sql.Date.valueOf(ngayLam)); ps.setString(3, caLam);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    // --- 2 HÀM MỚI BỔ SUNG CHO CHỨC NĂNG SỬA CA LÀM ---
    public PhanCa getShift(String maNV, String ngayLam, String caLam) {
        String query = "SELECT p.*, n.Ho, n.Dem, n.Ten FROM PhanCa p JOIN NhanVien n ON p.MaNV = n.MaNV WHERE p.MaNV = ? AND p.NgayLam = ? AND p.CaLam = ?";
        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maNV); ps.setDate(2, java.sql.Date.valueOf(ngayLam)); ps.setString(3, caLam);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String tenNV = rs.getString("Ho") + " " + (rs.getString("Dem") == null ? "" : rs.getString("Dem") + " ") + rs.getString("Ten");
                    String gbd = rs.getString("GioBatDau"); if(gbd != null && gbd.length() >= 5) gbd = gbd.substring(0,5);
                    String gkt = rs.getString("GioKetThuc"); if(gkt != null && gkt.length() >= 5) gkt = gkt.substring(0,5);
                    return new PhanCa(rs.getString("MaNV"), tenNV, rs.getDate("NgayLam"), rs.getString("CaLam"), gbd, gkt, rs.getString("MaCN"));
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    public void updateShift(String oldMaNV, String oldNgayLam, String oldCaLam, String newMaNV, String newNgayLam, String newCaLam) {
        String query = "UPDATE PhanCa SET MaNV = ?, NgayLam = ?, CaLam = ?, GioBatDau = ?, GioKetThuc = ? WHERE MaNV = ? AND NgayLam = ? AND CaLam = ?";
        String gioBatDau = "00:00:00"; String gioKetThuc = "00:00:00";
        if ("Ca Sáng".equals(newCaLam)) { gioBatDau = "07:00:00"; gioKetThuc = "12:00:00"; }
        else if ("Ca Chiều".equals(newCaLam)) { gioBatDau = "12:00:00"; gioKetThuc = "17:00:00"; }
        else if ("Ca Tối".equals(newCaLam)) { gioBatDau = "17:00:00"; gioKetThuc = "22:30:00"; }

        try (Connection conn = new DBContext().getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, newMaNV); ps.setDate(2, java.sql.Date.valueOf(newNgayLam)); ps.setString(3, newCaLam);
            ps.setTime(4, java.sql.Time.valueOf(gioBatDau)); ps.setTime(5, java.sql.Time.valueOf(gioKetThuc));
            
            ps.setString(6, oldMaNV); ps.setDate(7, java.sql.Date.valueOf(oldNgayLam)); ps.setString(8, oldCaLam);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
}