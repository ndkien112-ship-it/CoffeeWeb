package dal;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {
    public Connection getConnection() throws Exception {
        // Thay 'Ten_DB' bằng tên Database anh tạo trong SQL Server
        // Thay 'sa' và '123' bằng tài khoản/mật khẩu SQL của máy anh
        String url = "jdbc:sqlserver://localhost:1433;databaseName=CoffeeWeb_CSDL;encrypt=true;trustServerCertificate=true;";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, "sa", "011206");
    }
}