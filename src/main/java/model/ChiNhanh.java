package model;

public class ChiNhanh {
    private String maCN;
    private String tenCN;
    private String diaChi;
    private String soDienThoai;
    private String quanLy;

    public ChiNhanh() {}

    public ChiNhanh(String maCN, String tenCN, String diaChi, String soDienThoai, String quanLy) {
        this.maCN = maCN;
        this.tenCN = tenCN;
        this.diaChi = diaChi;
        this.soDienThoai = soDienThoai;
        this.quanLy = quanLy;
    }

    // Getter và Setter
    public String getMaCN() { return maCN; }
    public void setMaCN(String maCN) { this.maCN = maCN; }
    public String getTenCN() { return tenCN; }
    public void setTenCN(String tenCN) { this.tenCN = tenCN; }
    public String getDiaChi() { return diaChi; }
    public void setDiaChi(String diaChi) { this.diaChi = diaChi; }
    public String getSoDienThoai() { return soDienThoai; }
    public void setSoDienThoai(String soDienThoai) { this.soDienThoai = soDienThoai; }
    public String getQuanLy() { return quanLy; }
    public void setQuanLy(String quanLy) { this.quanLy = quanLy; }
}