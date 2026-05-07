package model;

public class InvoiceDetail {
    private String maHD;
    private String maSP;
    private int soLuong;
    private double giaLucMua;
    
    // Biến phụ
    private String tenSanPham;

    public InvoiceDetail() {}
    public InvoiceDetail(String maHD, String maSP, int soLuong, double giaLucMua) {
        this.maHD = maHD; this.maSP = maSP; this.soLuong = soLuong; this.giaLucMua = giaLucMua;
    }

    public String getMaHD() { return maHD; }
    public void setMaHD(String maHD) { this.maHD = maHD; }
    public String getMaSP() { return maSP; }
    public void setMaSP(String maSP) { this.maSP = maSP; }
    public int getSoLuong() { return soLuong; }
    public void setSoLuong(int soLuong) { this.soLuong = soLuong; }
    public double getGiaLucMua() { return giaLucMua; }
    public void setGiaLucMua(double giaLucMua) { this.giaLucMua = giaLucMua; }
    
    public String getTenSanPham() { return tenSanPham; }
    public void setTenSanPham(String tenSanPham) { this.tenSanPham = tenSanPham; }
}