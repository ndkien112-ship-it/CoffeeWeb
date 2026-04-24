package model;

public class NhanVien {
    private String maNV;
    private String ho;
    private String dem;
    private String ten;
    private String gioiTinh;
    private String ngaySinh;
    private String chucVu;
    private double luong;
    private String maCN; // Khóa ngoại liên kết với ChiNhanh

    public NhanVien() {}

    public NhanVien(String maNV, String ho, String dem, String ten, String gioiTinh, String ngaySinh, String chucVu, double luong, String maCN) {
        this.maNV = maNV;
        this.ho = ho;
        this.dem = dem;
        this.ten = ten;
        this.gioiTinh = gioiTinh;
        this.ngaySinh = ngaySinh;
        this.chucVu = chucVu;
        this.luong = luong;
        this.maCN = maCN;
    }

    // Getter và Setter cho tất cả các trường
    public String getMaNV() { return maNV; }
    public void setMaNV(String maNV) { this.maNV = maNV; }
    public String getHo() { return ho; }
    public void setHo(String ho) { this.ho = ho; }
    public String getDem() { return dem; }
    public void setDem(String dem) { this.dem = dem; }
    public String getTen() { return ten; }
    public void setTen(String ten) { this.ten = ten; }
    public String getFullTen() { return ho + " " + dem + " " + ten; }
    public String getGioiTinh() { return gioiTinh; }
    public void setGioiTinh(String gioiTinh) { this.gioiTinh = gioiTinh; }
    public String getNgaySinh() { return ngaySinh; }
    public void setNgaySinh(String ngaySinh) { this.ngaySinh = ngaySinh; }
    public String getChucVu() { return chucVu; }
    public void setChucVu(String chucVu) { this.chucVu = chucVu; }
    public double getLuong() { return luong; }
    public void setLuong(double luong) { this.luong = luong; }
    public String getMaCN() { return maCN; }
    public void setMaCN(String maCN) { this.maCN = maCN; }
}