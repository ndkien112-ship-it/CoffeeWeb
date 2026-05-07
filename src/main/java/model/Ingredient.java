package model;

public class Ingredient {
    private String maNL, tenNL, donVi;

    public Ingredient() {}
    public Ingredient(String maNL, String tenNL, String donVi) {
        this.maNL = maNL; this.tenNL = tenNL; this.donVi = donVi;
    }

    public String getMaNL() { return maNL; }
    public void setMaNL(String maNL) { this.maNL = maNL; }
    public String getTenNL() { return tenNL; }
    public void setTenNL(String tenNL) { this.tenNL = tenNL; }
    public String getDonVi() { return donVi; }
    public void setDonVi(String donVi) { this.donVi = donVi; }
}