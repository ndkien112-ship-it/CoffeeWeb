package model;

public class Supplier {
    private String maNCC;
    private String tenNCC;
    private String sdt;
    private String email;

    public Supplier() {}
    public Supplier(String maNCC, String tenNCC, String sdt, String email) {
        this.maNCC = maNCC; this.tenNCC = tenNCC; this.sdt = sdt; this.email = email;
    }

    public String getMaNCC() { return maNCC; }
    public void setMaNCC(String maNCC) { this.maNCC = maNCC; }
    public String getTenNCC() { return tenNCC; }
    public void setTenNCC(String tenNCC) { this.tenNCC = tenNCC; }
    public String getSdt() { return sdt; }
    public void setSdt(String sdt) { this.sdt = sdt; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
}
