package com.mikejuliet.controller;

import com.mikejuliet.entities.Employee;
import com.mikejuliet.service.EmployeeService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/employee")
public class EmployeeController extends HttpServlet {

    private EmployeeService employeeService;

    @Override
    public void init() throws ServletException {
        employeeService = EmployeeService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        try {
            if (username != null) {
                Employee employee = employeeService.getEmployeeByUsername(username);
                if (employee != null) {
                    resp.setContentType("application/json");
                    resp.getWriter().write(employeeToJson(employee));
                } else {
                    resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
                    resp.getWriter().write("Employee not found");
                }
            } else {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                resp.getWriter().write("Missing parameter: username");
            }
        } catch (SQLException e) {
            throw new ServletException("Unable to get employee", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Employee employee = new Employee();
        employee.setName(req.getParameter("name"));
        employee.setPhoneNumber(req.getParameter("phoneNumber"));
        employee.setUsername(req.getParameter("username"));
        employee.setPassword(req.getParameter("password"));
        employee.setEmail(req.getParameter("email"));

        try {
            Employee savedEmployee = employeeService.saveEmployee(employee);
            resp.setContentType("application/json");
            resp.getWriter().write(employeeToJson(savedEmployee));
        } catch (SQLException e) {
            throw new ServletException("Unable to save employee", e);
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Employee employee = new Employee();
        employee.setUsername(req.getParameter("username"));
        employee.setName(req.getParameter("name"));
        employee.setPhoneNumber(req.getParameter("phoneNumber"));
        employee.setEmail(req.getParameter("email"));

        try {
            Employee updatedEmployee = employeeService.updateEmployee(employee);
            resp.setContentType("application/json");
            resp.getWriter().write(employeeToJson(updatedEmployee));
        } catch (SQLException e) {
            throw new ServletException("Unable to update employee", e);
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");

        try {
            Employee employeeToDelete = employeeService.getEmployeeByUsername(username);
            if (employeeToDelete != null) {
                Employee deletedEmployee = employeeService.deleteEmployee(employeeToDelete);
                if (deletedEmployee != null) {
                    resp.setContentType("application/json");
                    resp.getWriter().write(employeeToJson(deletedEmployee));
                } else {
                    resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                    resp.getWriter().write("Failed to delete employee");
                }
            } else {
                resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
                resp.getWriter().write("Employee not found");
            }
        } catch (SQLException e) {
            throw new ServletException("Unable to delete employee", e);
        }
    }

    private String employeeToJson(Employee employee) {
        return String.format(
                "{\"empId\":\"%s\",\"name\":\"%s\",\"phoneNumber\":\"%s\",\"username\":\"%s\",\"email\":\"%s\"}",
                employee.getEmpId(), employee.getName(), employee.getPhoneNumber(), employee.getUsername(), employee.getEmail()
        );
    }
}
