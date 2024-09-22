package com.mikejuliet.service;


import com.mikejuliet.entities.Employee;
import com.mikejuliet.repositories.EmployeeRepository;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.io.IOException;
import java.sql.SQLException;
import java.util.UUID;

public class EmployeeService {

    private static EmployeeService employeeService ;
    private static EmployeeRepository repository;

    static {
        try {
            repository = EmployeeRepository.getInstance();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
    private EmployeeService(){

    }

    public static synchronized EmployeeService getInstance(){

        if(employeeService==null){
            employeeService = new EmployeeService();
        }
        return employeeService;
    }

    public Employee saveEmployee(Employee employee) throws SQLException {

        employee.setEmpId("Emp"+UUID.randomUUID().toString());
        employee.setPassword(encoder.encode(employee.getPassword()));

        return repository.saveEmployee(employee);

    }

    public Employee getEmployeeByUsername(String username) throws SQLException {
        return repository.getEmployeeByUsername(username);
    }
    public Employee updateEmployee(Employee employee) throws SQLException {

        Employee resultantEmployee = repository.getEmployeeByUsername(employee.getUsername());
        resultantEmployee.setName(employee.getName());
        resultantEmployee.setEmail(employee.getEmail());
        resultantEmployee.setPhoneNumber(employee.getPhoneNumber());
        return repository.updateEmployee(resultantEmployee);
    }

    public Employee deleteEmployee(Employee employee) throws SQLException {
        return repository.deleteEmployee(employee.getUsername()) ? employee : null;
    }


}
