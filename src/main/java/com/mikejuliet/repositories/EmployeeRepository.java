package com.mikejuliet.repositories;

import com.mikejuliet.connection.DatabaseConnection;
import com.mikejuliet.entities.Employee;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository {

    private static final DatabaseConnection connection = DatabaseConnection.getInstance(); // Use singleton instance
    private static final String SQL_FILE = "/main/resources/SQL/sql_crud_queries.sql";
    private static EmployeeRepository repository;

    private String[] queries;

    private EmployeeRepository() throws IOException {
        queries = loadSqlQueries(SQL_FILE);
    }

    public static synchronized EmployeeRepository getInstance() throws IOException {
        if (repository == null) {
            repository = new EmployeeRepository();
        }
        return repository;
    }
    private String[] loadSqlQueries(String fileName) throws IOException {
        StringBuilder sql = new StringBuilder();
        try (InputStream inputStream = getClass().getClassLoader().getResourceAsStream(fileName)) {
            if (inputStream == null) {
                throw new IOException("SQL file not found: " + fileName);
            }
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream))) {
                String line;
                while ((line = reader.readLine()) != null) {
                    sql.append(line).append("\n");
                }
            }
        } catch (IOException e) {
            System.err.println("Error loading SQL queries: " + e.getMessage());
            throw e;
        }
        return sql.toString().split(";"); // Split queries by semicolon
    }


    public Employee saveEmployee(Employee employee) throws SQLException {
        executeUpdate(queries[0], employee.getEmpId(), employee.getName(), employee.getPhoneNumber(),
                employee.getUsername(), employee.getPassword(), employee.getEmail());
        return employee;
    }

    public Employee updateEmployee(Employee employee) throws SQLException {
        executeUpdate(queries[1], employee.getName(), employee.getPhoneNumber(),
                employee.getPassword(), employee.getEmail(), employee.getUsername());
        return employee;
    }

    public boolean deleteEmployee(String username) throws SQLException {
        try (Connection conn = connection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(queries[2])) {
            pstmt.setString(1, username);
            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        }
    }

    public Employee getEmployeeByUsername(String username) throws SQLException {
        try (Connection conn = connection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(queries[3])) {
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return new Employee(
                        rs.getString("empId"),
                        rs.getString("name"),
                        rs.getString("phoneNumber"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email")
                );
            }
        }
        return null; // Employee not found
    }

    public List<Employee> getAllEmployees() throws SQLException {
        List<Employee> employees = new ArrayList<>();
        try (Connection conn = connection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(queries[4]);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                employees.add(new Employee(
                        rs.getString("empId"),
                        rs.getString("name"),
                        rs.getString("phoneNumber"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("email")
                ));
            }
        }
        return employees;
    }

    private void executeUpdate(String sql, Object... params) throws SQLException {
        try (Connection conn = connection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            for (int i = 0; i < params.length; i++) {
                pstmt.setObject(i + 1, params[i]);
            }

            pstmt.executeUpdate();
        }
    }
}
