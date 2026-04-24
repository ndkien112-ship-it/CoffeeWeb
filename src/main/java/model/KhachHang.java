package model;
public class KhachHang {
    private String maKH, ho, dem, ten, sdt;
    public KhachHang() {}
    public KhachHang(String maKH, String ho, String dem, String ten, String sdt) {
        this.maKH = maKH; this.ho = ho; this.dem = dem; this.ten = ten; this.sdt = sdt;
    }
    public String getMaKH() { return maKH; }
    public void setMaKH(String maKH) { this.maKH = maKH; }
    public String getFullTen() { return ho + " " + dem + " " + ten; }
    public String getTen() { return ten; }
    public String getSdt() { return sdt; }
    public void setSdt(String sdt) { this.sdt = sdt; 
    }
}
