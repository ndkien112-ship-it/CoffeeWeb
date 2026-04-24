package model;
public class PhieuNhap {
    private String maPhieu, ngayNhap, ttThanhToan, maNCC, maNV, maCN;
    private double thanhTien;
    public PhieuNhap() {}
    public PhieuNhap(String maPhieu, String ngayNhap, double thanhTien, String ttThanhToan, String maNCC, String maNV, String maCN) {
        this.maPhieu = maPhieu; this.ngayNhap = ngayNhap; this.thanhTien = thanhTien;
        this.ttThanhToan = ttThanhToan; this.maNCC = maNCC; this.maNV = maNV; this.maCN = maCN;
    }
    public String getMaPhieu() { return maPhieu; }
    public double getThanhTien() { return thanhTien; }
}
