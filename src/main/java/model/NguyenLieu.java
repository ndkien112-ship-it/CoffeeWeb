package model;

public class NguyenLieu {
    private int maNL;
    private String tenNL;
    private String donVi;

    public NguyenLieu() {}
    public NguyenLieu(int maNL, String tenNL, String donVi) {
        this.maNL = maNL; this.tenNL = tenNL; this.donVi = donVi;
    }
    // Getter và Setter...
    public int getMaNL() { return maNL; }
    public void setMaNL(int maNL) { this.maNL = maNL; }
    public String getTenNL() { return tenNL; }
    public void setTenNL(String tenNL) { this.tenNL = tenNL; }
    public String getDonVi() { return donVi; }
    public void setDonVi(String donVi) { this.donVi = donVi; }
}
