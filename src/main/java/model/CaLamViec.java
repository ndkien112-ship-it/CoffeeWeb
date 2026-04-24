package model;

public class CaLamViec {
    private String maCa, tenCa, gioBatDau, gioKetThuc;

    public CaLamViec() {}

    public CaLamViec(String maCa, String tenCa, String gioBatDau, String gioKetThuc) {
        this.maCa = maCa; this.tenCa = tenCa; 
        this.gioBatDau = gioBatDau; this.gioKetThuc = gioKetThuc;
    }

    public String getMaCa() { return maCa; }
    public String getTenCa() { return tenCa; }
    public String getGioBatDau() { return gioBatDau; }
    public String getGioKetThuc() { return gioKetThuc; }
}
