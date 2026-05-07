package model;

public class Branch {
    private String maCN;
    private String tenCN;
    private String tinh;
    private String diaChiCuThe;
    private String sdt;
    private String email;

    public Branch() {
    }

    public Branch(String maCN, String tenCN, String tinh, String diaChiCuThe, String sdt, String email) {
        this.maCN = maCN;
        this.tenCN = tenCN;
        this.tinh = tinh;
        this.diaChiCuThe = diaChiCuThe;
        this.sdt = sdt;
        this.email = email;
    }

    public String getMaCN() { return maCN; }
    public void setMaCN(String maCN) { this.maCN = maCN; }

    public String getTenCN() { return tenCN; }
    public void setTenCN(String tenCN) { this.tenCN = tenCN; }

    public String getTinh() { return tinh; }
    public void setTinh(String tinh) { this.tinh = tinh; }

    public String getDiaChiCuThe() { return diaChiCuThe; }
    public void setDiaChiCuThe(String diaChiCuThe) { this.diaChiCuThe = diaChiCuThe; }

    public String getSdt() { return sdt; }
    public void setSdt(String sdt) { this.sdt = sdt; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
}