package dao;

import dal.DBContext;
import java.sql.*;
import java.util.*;
import model.NhanVien;

public class EmployeeDAO {
    public List<NhanVien> getAllEmployees() {
        List<NhanVien> list = new ArrayList<>();
        String query = "SELECT * FROM NhanVien";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new NhanVien(
                    rs.getString("MaNV"), rs.getString("Ho"), rs.getString("Dem"),
                    rs.getString("Ten"), rs.getString("GioiTinh"), rs.getString("NgaySinh"),
                    rs.getString("ChucVu"), rs.getDouble("Luong"), rs.getString("MaCN")
                ));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public void addEmployee(NhanVien nv) {
        String query = "INSERT INTO NhanVien (MaNV, Ho, Dem, Ten, GioiTinh, NgaySinh, ChucVu, Luong, MaCN) VALUES (?,?,?,?,?,?,?,?,?)";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, nv.getMaNV()); ps.setString(2, nv.getHo());
            ps.setString(3, nv.getDem()); ps.setString(4, nv.getTen());
            ps.setString(5, nv.getGioiTinh()); ps.setString(6, nv.getNgaySinh());
            ps.setString(7, nv.getChucVu()); ps.setDouble(8, nv.getLuong());
            ps.setString(9, nv.getMaCN());
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
}