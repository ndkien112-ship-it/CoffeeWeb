package model;

public class ImportDetail {
    private String maPhieu;
    private String maNL;
    private double soLuong;
    private double donGiaNhap;
    
    // Biến phụ để hiển thị Tên và Đơn vị
    private String tenNL;
    private String donVi;

    public ImportDetail() {
    }

    public ImportDetail(String maPhieu, String maNL, double soLuong, double donGiaNhap) {
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

    public String getTenNL() { return tenNL; }
    public void setTenNL(String tenNL) { this.tenNL = tenNL; }

    public String getDonVi() { return donVi; }
    public void setDonVi(String donVi) { this.donVi = donVi; }
}