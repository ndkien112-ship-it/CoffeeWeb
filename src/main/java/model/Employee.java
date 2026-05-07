package model;

public class Employee {
    private String maNV;
    private String ho;
    private String dem;
    private String ten;
    private String gioiTinh;
    private String maCN;
    private String chucVu;
    private String sdt;
    private double luong;
    private String tenCN;

    public Employee() {}

    public Employee(String maNV, String ho, String dem, String ten, String gioiTinh, String maCN, String chucVu, String sdt, double luong) {
        this.maNV = maNV; this.ho = ho; this.dem = dem; this.ten = ten;
        this.gioiTinh = gioiTinh; this.maCN = maCN; this.chucVu = chucVu;
        this.sdt = sdt; this.luong = luong;
    }

    public String getMaNV() { return maNV; }
    public void setMaNV(String maNV) { this.maNV = maNV; }
    public String getHo() { return ho; }
    public void setHo(String ho) { this.ho = ho; }
    public String getDem() { return dem; }
    public void setDem(String dem) { this.dem = dem; }
    public String getTen() { return ten; }
    public void setTen(String ten) { this.ten = ten; }
    public String getGioiTinh() { return gioiTinh; }
    public void setGioiTinh(String gioiTinh) { this.gioiTinh = gioiTinh; }
    public String getMaCN() { return maCN; }
    public void setMaCN(String maCN) { this.maCN = maCN; }
    public String getChucVu() { return chucVu; }
    public void setChucVu(String chucVu) { this.chucVu = chucVu; }
    public String getSdt() { return sdt; }
    public void setSdt(String sdt) { this.sdt = sdt; }
    public double getLuong() { return luong; }
    public void setLuong(double luong) { this.luong = luong; }
    public String getTenCN() { return tenCN; }
    public void setTenCN(String tenCN) { this.tenCN = tenCN; }
}