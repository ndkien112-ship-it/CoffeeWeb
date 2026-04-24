package model;

public class PhanCong {
    private String maNV, tenNV, maCa, tenCa, ngayLam, trangThai;

    public PhanCong() {}

    // Bổ sung tenNV và tenCa để hiển thị lên bảng cho đẹp, thay vì chỉ hiện những mã vô hồn
    public PhanCong(String maNV, String tenNV, String maCa, String tenCa, String ngayLam, String trangThai) {
        this.maNV = maNV; this.tenNV = tenNV;
        this.maCa = maCa; this.tenCa = tenCa;
        this.ngayLam = ngayLam; this.trangThai = trangThai;
    }

    public String getMaNV() { return maNV; }
    public String getTenNV() { return tenNV; }
    public String getMaCa() { return maCa; }
    public String getTenCa() { return tenCa; }
    public String getNgayLam() { return ngayLam; }
    public String getTrangThai() { return trangThai; }
}