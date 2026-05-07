package model;

public class ImportReceiptDetail {
    private String maPhieu;
    private String maNL;
    private double soLuong;
    private double donGiaNhap;

    public ImportReceiptDetail() {
    }

    public ImportReceiptDetail(String maPhieu, String maNL, double soLuong, double donGiaNhap) {
        this.maPhieu = maPhieu;
        this.maNL = maNL;
        this.soLuong = soLuong;
        this.donGiaNhap = donGiaNhap;
    }

    public String getMaPhieu() { return maPhieu; }
    public void setMaPhieu(String maPhieu) { this.maPhieu = maPhieu; }

    public String getMaNL() { return maNL; }
    public void setMaNL(String maNL) { this.maNL = maNL; }

    public double getSoLuong() { return soLuong; }
    public void setSoLuong(double soLuong) { this.soLuong = soLuong; }

    public double getDonGiaNhap() { return donGiaNhap; }
    public void setDonGiaNhap(double donGiaNhap) { this.donGiaNhap = donGiaNhap; }
}