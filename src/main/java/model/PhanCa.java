package model;
import java.sql.Date;

public class PhanCa {
    private String maNV;
    private String tenNV;
    private Date ngayLam;
    private String caLam;
    private String gioBatDau;
    private String gioKetThuc;
    private String maCN;

    public PhanCa(String maNV, String tenNV, Date ngayLam, String caLam, String gioBatDau, String gioKetThuc, String maCN) {
        this.maNV = maNV; this.tenNV = tenNV; this.ngayLam = ngayLam;
        this.caLam = caLam; this.gioBatDau = gioBatDau; this.gioKetThuc = gioKetThuc; this.maCN = maCN;
    }

    public String getMaNV() { return maNV; }
    public String getTenNV() { return tenNV; }
    public Date getNgayLam() { return ngayLam; }
    public String getCaLam() { return caLam; }
    public String getGioBatDau() { return gioBatDau; }
    public String getGioKetThuc() { return gioKetThuc; }
    public String getMaCN() { return maCN; }
}