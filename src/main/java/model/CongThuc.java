package model;

public class CongThuc {
    private int maCT;
    private int maSP;
    private String tenNguyenLieu;
    private String hamLuong;

    public CongThuc() {
    }

    // Hàm tạo này phải có đúng 4 tham số như thế này:
    public CongThuc(int maCT, int maSP, String tenNguyenLieu, String hamLuong) {
        this.maCT = maCT;
        this.maSP = maSP;
        this.tenNguyenLieu = tenNguyenLieu;
        this.hamLuong = hamLuong;
    }

    // Các hàm Getter để Servlet gọi được dữ liệu
    public String getTenNguyenLieu() {
        return tenNguyenLieu;
    }

    public String getHamLuong() {
        return hamLuong;
    }

    // Thêm các Getter khác nếu anh cần dùng sau này
    public int getMaCT() { return maCT; }
    public int getMaSP() { return maSP; }
}