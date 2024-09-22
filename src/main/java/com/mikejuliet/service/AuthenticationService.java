package com.mikejuliet.service;

import com.mikejuliet.entities.AuthenticationEntity;
import com.mikejuliet.entities.Employee;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.sql.SQLException;

public class AuthenticationService {

    private static AuthenticationService authService;
    private static BCryptPasswordEncoder passwordEncoder;
    private EmployeeService employeeService = EmployeeService.getInstance();
    private AuthenticationService(){

        passwordEncoder = new BCryptPasswordEncoder();
    }

    public static AuthenticationService getInstance(){

        if(authService==null){
            authService = new AuthenticationService();
        }
        return authService;
    }

    public boolean doAuthentication(AuthenticationEntity authenticationEntity) throws SQLException {
        Employee resultantEmployee = employeeService.getEmployeeByUsername(authenticationEntity.getUsername());
        if(passwordEncoder.matches(authenticationEntity.getPassword(), resultantEmployee.getPassword())){
            return true;
        }
        return false;
    }

}
