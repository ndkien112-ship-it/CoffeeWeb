package dao;

import dal.DBContext; // Đổi từ context sang dal cho đúng với thư mục của anh
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.ChiNhanh;

public class BranchDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<ChiNhanh> getAllBranches() {
        List<ChiNhanh> list = new ArrayList<>();
        String query = "select * from ChiNhanh";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ChiNhanh(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
            // Anh có thể in lỗi ra đây để kiểm tra nếu cần: e.printStackTrace();
        }
        return list;
    } // Kết thúc hàm getAllBranches
} // Kết thúc class BranchDAO