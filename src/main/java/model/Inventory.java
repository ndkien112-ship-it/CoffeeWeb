package model;

public class Inventory {
    private String maCN;
    private String maNL;
    private double soLuong;
    
    // Các biến phụ để hiển thị giao diện đẹp hơn
    private String tenCN;
    private String tenNL;
    private String donVi;

    public Inventory() {}

    public Inventory(String maCN, String maNL, double soLuong) {
        this.maCN = maCN;
        this.maNL = maNL;
        this.soLuong = soLuong;
    }

    public String getMaCN() { return maCN; }
    public void setMaCN(String maCN) { this.maCN = maCN; }

    public String getMaNL() { return maNL; }
    public void setMaNL(String maNL) { this.maNL = maNL; }

    public double getSoLuong() { return soLuong; }
    public void setSoLuong(double soLuong) { this.soLuong = soLuong; }

    public String getTenCN() { return tenCN; }
    public void setTenCN(String tenCN) { this.tenCN = tenCN; }

    public String getTenNL() { return tenNL; }
    public void setTenNL(String tenNL) { this.tenNL = tenNL; }

    public String getDonVi() { return donVi; }
    public void setDonVi(String donVi) { this.donVi = donVi; }
}
