package model;

public class Product {
    private String maSP;
    private String tenSP;
    private double giaNiemYet;
    private String moTa;

    public Product() {}
    public Product(String maSP, String tenSP, double giaNiemYet, String moTa) {
        this.maSP = maSP; this.tenSP = tenSP; this.giaNiemYet = giaNiemYet; this.moTa = moTa;
    }

    public String getMaSP() { return maSP; }
    public void setMaSP(String maSP) { this.maSP = maSP; }
    public String getTenSP() { return tenSP; }
    public void setTenSP(String tenSP) { this.tenSP = tenSP; }
    public double getGiaNiemYet() { return giaNiemYet; }
    public void setGiaNiemYet(double giaNiemYet) { this.giaNiemYet = giaNiemYet; }
    public String getMoTa() { return moTa; }
    public void setMoTa(String moTa) { this.moTa = moTa; }
}