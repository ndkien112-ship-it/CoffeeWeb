package model;
import java.sql.Date;

public class Assignment {
    private String maNV, tenNhanVien, maCa, tenCa, trangThai;
    private Date ngayLam;

    public Assignment(String maNV, String tenNhanVien, String maCa, String tenCa, Date ngayLam, String trangThai) {
        this.maNV = maNV; this.tenNhanVien = tenNhanVien;
        this.maCa = maCa; this.tenCa = tenCa;
        this.ngayLam = ngayLam; this.trangThai = trangThai;
    }
    public String getTenNhanVien() { return tenNhanVien; }
    public String getTenCa() { return tenCa; }
    public Date getNgayLam() { return ngayLam; }
    public String getTrangThai() { return trangThai; }
}
