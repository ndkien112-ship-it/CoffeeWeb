package model;
public class HoaDon {
    private String maHD, ngayLap, thoiGianLap, ptThanhToan, maKH, maNV, maCN;
    private double thanhTien;
    public HoaDon() {}
    public HoaDon(String maHD, String ngayLap, String thoiGianLap, String ptThanhToan, double thanhTien, String maKH, String maNV, String maCN) {
        this.maHD = maHD; this.ngayLap = ngayLap; this.thoiGianLap = thoiGianLap;
        this.ptThanhToan = ptThanhToan; this.thanhTien = thanhTien;
        this.maKH = maKH; this.maNV = maNV; this.maCN = maCN;
    }
    public String getMaHD() { return maHD; }
    public String getNgayLap() { return ngayLap; }
    public double getThanhTien() { return thanhTien; }
}