package com.mikejuliet.connection;

import com.mikejuliet.configurations.DatabaseConfiguration;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseConnection {

    private DatabaseConfiguration config = new DatabaseConfiguration();
    private static DatabaseConnection connection;

    private DatabaseConnection() {
        try {
            // Load the JDBC driver using the driver class name from config
            Class.forName(config.getDriverClassName());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        initializeDatabase();
    }

    public static synchronized DatabaseConnection getInstance() {
        if (connection == null) {
            connection = new DatabaseConnection();
        }
        return connection;
    }

    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection(config.getUrl(), config.getUser(), config.getPassword());
    }

    public void initializeDatabase() {
        String setupSql = "/main/resources/SQL/employee_setup.sql" ; // Ensure this path is correct
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             InputStream inputStream = getClass().getResourceAsStream(setupSql);
             BufferedReader br = new BufferedReader(new InputStreamReader(inputStream))) {

            if (inputStream == null) {
                throw new IOException("SQL file not found: " + setupSql);
            }

            StringBuilder sql = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                sql.append(line).append("\n"); // Append newline to separate commands
            }
            stmt.execute(sql.toString());
        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
    }
}
