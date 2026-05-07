package model;

public class Supply {
    private String maNCC;
    private String maNL;
    private double donGiaNiemYet;
    
    // Biến phụ để hiển thị Tên
    private String tenNCC;
    private String tenNL;
    private String donVi;

    public Supply() {}
    public Supply(String maNCC, String maNL, double donGiaNiemYet) {
        this.maNCC = maNCC; this.maNL = maNL; this.donGiaNiemYet = donGiaNiemYet;
    }

    public String getMaNCC() { return maNCC; }
    public void setMaNCC(String maNCC) { this.maNCC = maNCC; }
    public String getMaNL() { return maNL; }
    public void setMaNL(String maNL) { this.maNL = maNL; }
    public double getDonGiaNiemYet() { return donGiaNiemYet; }
    public void setDonGiaNiemYet(double donGiaNiemYet) { this.donGiaNiemYet = donGiaNiemYet; }

    public String getTenNCC() { return tenNCC; }
    public void setTenNCC(String tenNCC) { this.tenNCC = tenNCC; }
    public String getTenNL() { return tenNL; }
    public void setTenNL(String tenNL) { this.tenNL = tenNL; }
    public String getDonVi() { return donVi; }
    public void setDonVi(String donVi) { this.donVi = donVi; }
}
