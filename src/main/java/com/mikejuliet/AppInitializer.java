package com.mikejuliet;


import com.mikejuliet.connection.DatabaseConnection;
import com.mikejuliet.entities.Employee;
import com.mikejuliet.repositories.EmployeeRepository;
import org.springframework.web.WebApplicationInitializer;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import java.io.IOException;

public class AppInitializer implements WebApplicationInitializer {


    @Override
    public void onStartup(ServletContext servletContext) throws ServletException, RuntimeException {
        // Initialize the database
        DatabaseConnection dbConnection = DatabaseConnection.getInstance();

        try {
            EmployeeRepository repository = EmployeeRepository.getInstance();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }


        System.out.println("Database initialized successfully.");
    }



}
