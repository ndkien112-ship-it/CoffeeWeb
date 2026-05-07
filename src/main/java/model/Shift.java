package model;

public class Shift {
    private String maCa, tenCa, gioBatDau, gioKetThuc;

    public Shift(String maCa, String tenCa, String gioBatDau, String gioKetThuc) {
        this.maCa = maCa; this.tenCa = tenCa; this.gioBatDau = gioBatDau; this.gioKetThuc = gioKetThuc;
    }
    public String getMaCa() { return maCa; }
    public String getTenCa() { return tenCa; }
    public String getGioBatDau() { return gioBatDau; }
    public String getGioKetThuc() { return gioKetThuc; }
}
