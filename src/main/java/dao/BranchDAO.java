package dao;

import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Branch;

public class BranchDAO {

    public List<Branch> getAllBranches() {
        List<Branch> list = new ArrayList<>();
        String query = "SELECT * FROM ChiNhanh";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new Branch(
                    rs.getString("MaCN"), rs.getString("TenCN"), 
                    rs.getString("Tinh"), rs.getString("DiaChiCuThe"), 
                    rs.getString("SDT"), rs.getString("Email")
                ));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public void addBranch(String maCN, String tenCN, String tinh, String diaChiCuThe, String sdt, String email) {
        String query = "INSERT INTO ChiNhanh (MaCN, TenCN, Tinh, DiaChiCuThe, SDT, Email) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maCN);
            ps.setString(2, tenCN);
            ps.setString(3, tinh);
            ps.setString(4, diaChiCuThe);
            ps.setString(5, sdt);
            ps.setString(6, email);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void deleteBranch(String id) {
        String query = "DELETE FROM ChiNhanh WHERE MaCN = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public Branch getBranchByID(String id) {
        String query = "SELECT * FROM ChiNhanh WHERE MaCN = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Branch(
                        rs.getString("MaCN"), rs.getString("TenCN"), 
                        rs.getString("Tinh"), rs.getString("DiaChiCuThe"), 
                        rs.getString("SDT"), rs.getString("Email")
                    );
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    public void editBranch(String maCN, String tenCN, String tinh, String diaChiCuThe, String sdt, String email) {
        String query = "UPDATE ChiNhanh SET TenCN=?, Tinh=?, DiaChiCuThe=?, SDT=?, Email=? WHERE MaCN=?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, tenCN);
            ps.setString(2, tinh);
            ps.setString(3, diaChiCuThe);
            ps.setString(4, sdt);
            ps.setString(5, email);
            ps.setString(6, maCN);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
}