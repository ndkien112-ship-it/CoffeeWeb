package dao;

import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.*;

public class SalesDAO {

    // ================= PHẦN KHÁCH HÀNG =================
    public List<Customer> getAllCustomers() {
        List<Customer> list = new ArrayList<>();
        String query = "SELECT * FROM KhachHang";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new Customer(rs.getString("MaKH"), rs.getString("Ho"), 
                         rs.getString("Dem"), rs.getString("Ten"), rs.getString("SDT")));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public void addCustomer(String maKH, String ho, String dem, String ten, String sdt) {
        String query = "INSERT INTO KhachHang (MaKH, Ho, Dem, Ten, SDT) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maKH); ps.setString(2, ho); ps.setString(3, dem);
            ps.setString(4, ten); ps.setString(5, sdt);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public Customer getCustomerById(String maKH) {
        String query = "SELECT * FROM KhachHang WHERE MaKH = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maKH);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Customer(rs.getString("MaKH"), rs.getString("Ho"), 
                             rs.getString("Dem"), rs.getString("Ten"), rs.getString("SDT"));
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    public void updateCustomer(String maKH, String ho, String dem, String ten, String sdt) {
        String query = "UPDATE KhachHang SET Ho=?, Dem=?, Ten=?, SDT=? WHERE MaKH=?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, ho); ps.setString(2, dem); ps.setString(3, ten);
            ps.setString(4, sdt); ps.setString(5, maKH);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void deleteCustomer(String maKH) {
        String updateHoaDon = "UPDATE HoaDon SET MaKH = NULL WHERE MaKH = ?";
        String deleteKhachHang = "DELETE FROM KhachHang WHERE MaKH = ?";
        try (Connection conn = new DBContext().getConnection()) {
            try (PreparedStatement ps1 = conn.prepareStatement(updateHoaDon)) {
                ps1.setString(1, maKH);
                ps1.executeUpdate();
            }
            try (PreparedStatement ps2 = conn.prepareStatement(deleteKhachHang)) {
                ps2.setString(1, maKH);
                ps2.executeUpdate();
            }
        } catch (Exception e) { e.printStackTrace(); }
    }

    // ================= PHẦN SẢN PHẨM =================
    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM SanPham";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new Product(rs.getString("MaSP"), rs.getString("TenSP"), 
                         rs.getDouble("GiaNiemYet"), rs.getString("MoTa")));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // ================= PHẦN HÓA ĐƠN & CHI TIẾT =================
    public List<Invoice> getAllInvoices(String maCN) {
        List<Invoice> list = new ArrayList<>();
        String query = "SELECT h.*, " +
                       "(k.Ho + ' ' + ISNULL(k.Dem + ' ', '') + k.Ten) AS TenKH, " +
                       "c.TenCN, " +
                       "(n.Ho + ' ' + ISNULL(n.Dem + ' ', '') + n.Ten) AS TenNV " +
                       "FROM HoaDon h " +
                       "LEFT JOIN KhachHang k ON h.MaKH = k.MaKH " +
                       "LEFT JOIN ChiNhanh c ON h.MaCN = c.MaCN " +
                       "LEFT JOIN NhanVien n ON h.MaNV = n.MaNV " +
                       "WHERE h.MaCN = ? " +
                       "ORDER BY h.NgayLap DESC, h.ThoiGianLap DESC";
                       
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maCN);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Invoice inv = new Invoice(
                        rs.getString("MaHD"), rs.getDate("NgayLap"), rs.getTime("ThoiGianLap"), 
                        rs.getDouble("ThanhTien"), rs.getString("PTThanhToan"), 
                        rs.getString("MaCN"), rs.getString("MaKH"), rs.getString("MaNV")
                    );
                    inv.setTenKhachHang(rs.getString("TenKH"));
                    inv.setTenCN(rs.getString("TenCN")); 
                    inv.setTenNhanVien(rs.getString("TenNV")); 
                    list.add(inv);
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public void addInvoice(String maHD, String ngayLap, String thoiGianLap, double thanhTien, String ptThanhToan, String maCN, String maKH, String maNV) {
        String query = "INSERT INTO HoaDon (MaHD, NgayLap, ThoiGianLap, ThanhTien, PTThanhToan, MaCN, MaKH, MaNV) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maHD); ps.setString(2, ngayLap); ps.setString(3, thoiGianLap);
            ps.setDouble(4, thanhTien); ps.setString(5, ptThanhToan); ps.setString(6, maCN); 
            if(maKH == null || maKH.trim().isEmpty()) { ps.setNull(7, java.sql.Types.VARCHAR); } else { ps.setString(7, maKH); }
            if(maNV == null || maNV.trim().isEmpty()) { ps.setNull(8, java.sql.Types.VARCHAR); } else { ps.setString(8, maNV); }
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void addInvoiceDetail(String maHD, String maSP, int soLuong, double giaLucMua) {
        String query = "INSERT INTO ChiTietHoaDon (MaHD, MaSP, SoLuong, GiaLucMua) VALUES (?, ?, ?, ?)";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maHD); ps.setString(2, maSP);
            ps.setInt(3, soLuong); ps.setDouble(4, giaLucMua);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public List<InvoiceDetail> getInvoiceDetailsByMaHD(String maHD) {
        List<InvoiceDetail> list = new ArrayList<>();
        String query = "SELECT c.*, s.TenSP FROM ChiTietHoaDon c JOIN SanPham s ON c.MaSP = s.MaSP WHERE c.MaHD = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maHD);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    InvoiceDetail detail = new InvoiceDetail(
                        rs.getString("MaHD"), rs.getString("MaSP"), rs.getInt("SoLuong"), rs.getDouble("GiaLucMua")
                    );
                    detail.setTenSanPham(rs.getString("TenSP")); 
                    list.add(detail);
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public void deleteInvoice(String maHD) {
        String queryDetail = "DELETE FROM ChiTietHoaDon WHERE MaHD = ?";
        String queryMain = "DELETE FROM HoaDon WHERE MaHD = ?";
        try (Connection conn = new DBContext().getConnection()) {
            try (PreparedStatement ps1 = conn.prepareStatement(queryDetail)) {
                ps1.setString(1, maHD); ps1.executeUpdate();
            }
            try (PreparedStatement ps2 = conn.prepareStatement(queryMain)) {
                ps2.setString(1, maHD); ps2.executeUpdate();
            }
        } catch (Exception e) { e.printStackTrace(); }
    }

    public Invoice getInvoiceById(String maHD) {
        String query = "SELECT * FROM HoaDon WHERE MaHD = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maHD);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Invoice(
                        rs.getString("MaHD"), rs.getDate("NgayLap"), rs.getTime("ThoiGianLap"), 
                        rs.getDouble("ThanhTien"), rs.getString("PTThanhToan"), 
                        rs.getString("MaCN"), rs.getString("MaKH"), rs.getString("MaNV")
                    );
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    public void deleteInvoiceDetails(String maHD) {
        String query = "DELETE FROM ChiTietHoaDon WHERE MaHD = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, maHD); ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public void updateInvoice(String maHD, double thanhTien, String ptThanhToan, String maCN, String maKH, String maNV) {
        String query = "UPDATE HoaDon SET ThanhTien=?, PTThanhToan=?, MaCN=?, MaKH=?, MaNV=? WHERE MaHD=?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setDouble(1, thanhTien); ps.setString(2, ptThanhToan); ps.setString(3, maCN); 
            if(maKH == null || maKH.trim().isEmpty()) { ps.setNull(4, java.sql.Types.VARCHAR); } else { ps.setString(4, maKH); }
            if(maNV == null || maNV.trim().isEmpty()) { ps.setNull(5, java.sql.Types.VARCHAR); } else { ps.setString(5, maNV); }
            ps.setString(6, maHD); ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    // ================= BỔ SUNG: LẤY TẤT CẢ NHÂN VIÊN ĐỂ JS TỰ LỌC =================
    public List<Employee> getAllEmployeesFull() {
        List<Employee> list = new ArrayList<>();
        String query = "SELECT * FROM NhanVien";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                list.add(new Employee(
                    rs.getString("MaNV"), rs.getString("Ho"), rs.getString("Dem"), rs.getString("Ten"),
                    rs.getString("GioiTinh"), rs.getString("MaCN"), rs.getString("ChucVu"), rs.getString("SDT"), rs.getDouble("Luong")
                ));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
}