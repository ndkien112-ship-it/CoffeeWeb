package model;

public class Recipe {
    private String maSP, maNL;
    private double dinhLuong;
    
    // Biến phụ để hiển thị Tên thay vì Mã
    private String tenSP, tenNL, donVi;

    public Recipe() {}
    public Recipe(String maSP, String maNL, double dinhLuong) {
        this.maSP = maSP; this.maNL = maNL; this.dinhLuong = dinhLuong;
    }

    public String getMaSP() { return maSP; }
    public void setMaSP(String maSP) { this.maSP = maSP; }
    public String getMaNL() { return maNL; }
    public void setMaNL(String maNL) { this.maNL = maNL; }
    public double getDinhLuong() { return dinhLuong; }
    public void setDinhLuong(double dinhLuong) { this.dinhLuong = dinhLuong; }

    public String getTenSP() { return tenSP; }
    public void setTenSP(String tenSP) { this.tenSP = tenSP; }
    public String getTenNL() { return tenNL; }
    public void setTenNL(String tenNL) { this.tenNL = tenNL; }
    public String getDonVi() { return donVi; }
    public void setDonVi(String donVi) { this.donVi = donVi; }
}