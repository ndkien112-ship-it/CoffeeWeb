package model;

import java.sql.Date;
import java.sql.Time;

public class Invoice {
    
    // Các thuộc tính gốc
    private String maHD;
    private String ngayLap;
    private String thoiGianLap;
    private String maNV;
    private String maKH;
    private String maCN;
    private String phuongThucTT;
    private double tongTien;

    // Các thuộc tính hiển thị (Tên)
    private String tenNhanVien;
    private String tenKhachHang;
    private String tenCN;

    public Invoice() {}

    // Constructor chuẩn hóa nhận dữ liệu từ SQL (Date, Time)
    public Invoice(String maHD, Date ngayLap, Time thoiGianLap, double tongTien, String phuongThucTT, String maCN, String maKH, String maNV) {
        this.maHD = maHD;
        this.ngayLap = (ngayLap != null) ? ngayLap.toString() : "";
        this.thoiGianLap = (thoiGianLap != null) ? thoiGianLap.toString() : "";
        this.tongTien = tongTien;
        this.phuongThucTT = phuongThucTT;
        this.maCN = maCN;
        this.maKH = maKH;
        this.maNV = maNV;
    }

    // Getters & Setters gốc
    public String getMaHD() { return maHD; }
    public void setMaHD(String maHD) { this.maHD = maHD; }
    public String getNgayLap() { return ngayLap; }
    public void setNgayLap(String ngayLap) { this.ngayLap = ngayLap; }
    public String getThoiGianLap() { return thoiGianLap; }
    public void setThoiGianLap(String thoiGianLap) { this.thoiGianLap = thoiGianLap; }
    public String getMaNV() { return maNV; }
    public void setMaNV(String maNV) { this.maNV = maNV; }
    public String getMaKH() { return maKH; }
    public void setMaKH(String maKH) { this.maKH = maKH; }
    public String getMaCN() { return maCN; }
    public void setMaCN(String maCN) { this.maCN = maCN; }
    public String getPhuongThucTT() { return phuongThucTT; }
    public void setPhuongThucTT(String phuongThucTT) { this.phuongThucTT = phuongThucTT; }
    public double getTongTien() { return tongTien; }
    public void setTongTien(double tongTien) { this.tongTien = tongTien; }

    // Getters & Setters hiển thị Tên
    public String getTenNhanVien() { return tenNhanVien; }
    public void setTenNhanVien(String tenNhanVien) { this.tenNhanVien = tenNhanVien; }
    public String getTenKhachHang() { return tenKhachHang; }
    public void setTenKhachHang(String tenKhachHang) { this.tenKhachHang = tenKhachHang; }
    public String getTenCN() { return tenCN; }
    public void setTenCN(String tenCN) { this.tenCN = tenCN; }
}