package model;

public class ChiNhanh {
    private int id;
    private String tenCN;
    private String diaChi;
    private String soDienThoai;
    private String quanLy;

    public ChiNhanh() {
    }

    public ChiNhanh(int id, String tenCN, String diaChi, String soDienThoai, String quanLy) {
        this.id = id;
        this.tenCN = tenCN;
        this.diaChi = diaChi;
        this.soDienThoai = soDienThoai;
        this.quanLy = quanLy;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenCN() {
        return tenCN;
    }

    public void setTenCN(String tenCN) {
        this.tenCN = tenCN;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public String getQuanLy() {
        return quanLy;
    }

    public void setQuanLy(String quanLy) {
        this.quanLy = quanLy;
    }
}