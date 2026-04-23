package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbconnect {
    public static Connection getConnection() {
        Connection conn = null;
        try {
            // Đăng ký driver
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            
            // Thông tin kết nối - Chỗ này sau này sửa theo thông số của thằng bạn ông
            String url = "jdbc:sqlserver://localhost:1433;databaseName=QuanLyCoffee;encrypt=true;trustServerCertificate=true;";
            String user = "sa"; 
            String pass = "123456"; 
            
            conn = DriverManager.getConnection(url, user, pass);
            System.out.println("Kết nối Database thành công!");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.out.println("Lỗi kết nối: " + e.getMessage());
        }
        return conn;
    }
}