package model;

public class Customer {
    private String maKH, ho, dem, ten, sdt;

    public Customer() {}
    public Customer(String maKH, String ho, String dem, String ten, String sdt) {
        this.maKH = maKH; this.ho = ho; this.dem = dem; this.ten = ten; this.sdt = sdt;
    }

    public String getMaKH() { return maKH; }
    public void setMaKH(String maKH) { this.maKH = maKH; }
    public String getHo() { return ho; }
    public void setHo(String ho) { this.ho = ho; }
    public String getDem() { return dem; }
    public void setDem(String dem) { this.dem = dem; }
    public String getTen() { return ten; }
    public void setTen(String ten) { this.ten = ten; }
    public String getSdt() { return sdt; }
    public void setSdt(String sdt) { this.sdt = sdt; }
    
    // Hàm phụ trợ để hiển thị FullName cho nhanh
    public String getFullName() {
        return ho + " " + (dem != null && !dem.isEmpty() ? dem + " " : "") + ten;
    }
}