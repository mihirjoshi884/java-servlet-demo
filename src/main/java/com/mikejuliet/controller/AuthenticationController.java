package com.mikejuliet.controller;

import com.mikejuliet.entities.AuthenticationEntity;
import com.mikejuliet.service.AuthenticationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/auth")
public class AuthenticationController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final AuthenticationService authenticationService = AuthenticationService.getInstance();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("logout".equals(action) || request.getRequestURI().endsWith("/logout")) {
            doLogout(request, response);
        } else {
            doLogin(request, response);
        }
    }


    private void doLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        AuthenticationEntity authenticationEntity = new AuthenticationEntity();
        authenticationEntity.setUsername(username);
        authenticationEntity.setPassword(password);

        try {
            boolean isAuthenticated = authenticationService.doAuthentication(authenticationEntity);
            if (isAuthenticated) {
                request.getSession().setAttribute("username", username);
                response.sendRedirect(request.getContextPath() + "/home.jsp"); // Redirect to home page upon successful authentication
            } else {
                request.setAttribute("errorMessage", "Invalid username or password.");
                request.getRequestDispatcher("/login.jsp").forward(request, response); // Forward back to login page with error message
            }
        } catch (Exception e) {
            request.setAttribute("errorMessage", "An error occurred during authentication: " + e.getMessage());
            request.getRequestDispatcher("/login.jsp").forward(request, response); // Forward back to login page with error message
        }
    }

    private void doLogout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().invalidate(); // Invalidate the session
        response.sendRedirect(request.getContextPath() + "/login.jsp"); // Redirect to login page
    }
}
