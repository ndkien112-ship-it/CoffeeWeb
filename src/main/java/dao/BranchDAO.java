package dao;

import dal.DBContext;
import java.sql.*;
import java.util.*;
import model.ChiNhanh;

public class BranchDAO {
    public List<ChiNhanh> getAllBranches() {
        List<ChiNhanh> list = new ArrayList<>();
        String query = "SELECT * FROM ChiNhanh";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new ChiNhanh(rs.getString("MaCN"), rs.getString("TenCN"), 
                        rs.getString("DiaChi"), rs.getString("SoDienThoai"), 
                        rs.getString("QuanLy")));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // Hàm thêm chi nhánh mới
    public void addBranch(String id, String tenCN, String diaChi, String soDienThoai, String quanLy) {
        String query = "INSERT INTO ChiNhanh (MaCN, TenCN, DiaChi, SoDienThoai, QuanLy) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            // Truyền 5 tham số vào dấu ?
            ps.setString(1, id);
            ps.setString(2, tenCN);
            ps.setString(3, diaChi);
            ps.setString(4, soDienThoai);
            ps.setString(5, quanLy);
            
            ps.executeUpdate(); // Thực thi lệnh lưu vào SQL
            
        } catch (Exception e) { 
            e.printStackTrace(); 
        }
    }

    // Hàm lấy 1 chi nhánh theo ID (Dùng cho chức năng Sửa)
    public ChiNhanh getBranchByID(String id) {
        String query = "SELECT * FROM ChiNhanh WHERE MaCN = ?"; 
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, id); // Truyền mã chi nhánh vào dấu ?
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new ChiNhanh(
                        rs.getString("MaCN"), 
                        rs.getString("TenCN"), 
                        rs.getString("DiaChi"), 
                        rs.getString("SoDienThoai"), 
                        rs.getString("QuanLy")
                    );
                }
            }
        } catch (Exception e) { 
            e.printStackTrace(); 
        }
        return null; // Trả về null nếu không tìm thấy
    }

    // Hàm cập nhật thông tin Chi nhánh
    public void updateBranch(String id, String tenCN, String diaChi, String soDienThoai, String quanLy) {
        // Lệnh SQL để UPDATE dữ liệu dựa trên Khóa chính MaCN
        String query = "UPDATE ChiNhanh SET TenCN = ?, DiaChi = ?, SoDienThoai = ?, QuanLy = ? WHERE MaCN = ?";
        
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            // Truyền 5 tham số vào 5 dấu hỏi chấm (?)
            ps.setString(1, tenCN);
            ps.setString(2, diaChi);
            ps.setString(3, soDienThoai);
            ps.setString(4, quanLy);
            ps.setString(5, id); // id chính là MaCN nằm ở cuối cùng
            
            // Thực thi lệnh cập nhật
            ps.executeUpdate();
            
        } catch (Exception e) { 
            e.printStackTrace(); 
        }
    }
}