
package pack;

import java.sql.Connection;
import java.sql.DriverManager;

public class Dbconnection {

    public static Connection getConn() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");

        String dbUrl = System.getenv("DB_URL");
        String dbUser = System.getenv("DB_USER");
        String dbPassword = System.getenv("DB_PASSWORD");

        if (dbUrl == null || dbUser == null || dbPassword == null) {
            throw new IllegalStateException(
                "Database environment variables are not configured."
            );
        }

        Connection con = DriverManager.getConnection(
            dbUrl, dbUser, dbPassword
        );

        return con;
    }
}
