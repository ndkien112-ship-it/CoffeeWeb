package model;

import java.sql.Date;

public class ImportReceipt {
    private String maPhieu;
    private Date ngayNhap;
    private double thanhTien;
    private String ttThanhToan;
    private String maNCC;
    private String maCN; 
    private String maNV; // Bổ sung mã nhân viên nhận hàng
    
    // Các biến phụ để hiển thị ra UI
    private String tenNCC;
    private String tenCN; 
    private String tenNhanVien; // Bổ sung tên nhân viên

    public ImportReceipt() {
    }

    public ImportReceipt(String maPhieu, Date ngayNhap, double thanhTien, String ttThanhToan, String maNCC, String maCN, String maNV) {
        this.maPhieu = maPhieu;
        this.ngayNhap = ngayNhap;
        this.thanhTien = thanhTien;
        this.ttThanhToan = ttThanhToan;
        this.maNCC = maNCC;
        this.maCN = maCN;
        this.maNV = maNV;
    }

    public String getMaPhieu() { return maPhieu; }
    public void setMaPhieu(String maPhieu) { this.maPhieu = maPhieu; }

    public Date getNgayNhap() { return ngayNhap; }
    public void setNgayNhap(Date ngayNhap) { this.ngayNhap = ngayNhap; }

    public double getThanhTien() { return thanhTien; }
    public void setThanhTien(double thanhTien) { this.thanhTien = thanhTien; }

    public String getTtThanhToan() { return ttThanhToan; }
    public void setTtThanhToan(String ttThanhToan) { this.ttThanhToan = ttThanhToan; }

    public String getMaNCC() { return maNCC; }
    public void setMaNCC(String maNCC) { this.maNCC = maNCC; }

    public String getMaCN() { return maCN; }
    public void setMaCN(String maCN) { this.maCN = maCN; }

    public String getMaNV() { return maNV; }
    public void setMaNV(String maNV) { this.maNV = maNV; }

    public String getTenNCC() { return tenNCC; }
    public void setTenNCC(String tenNCC) { this.tenNCC = tenNCC; }

    public String getTenCN() { return tenCN; }
    public void setTenCN(String tenCN) { this.tenCN = tenCN; }

    public String getTenNhanVien() { return tenNhanVien; }
    public void setTenNhanVien(String tenNhanVien) { this.tenNhanVien = tenNhanVien; }
}