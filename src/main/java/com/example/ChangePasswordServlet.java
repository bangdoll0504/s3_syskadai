package com.example;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/change_password")
public class ChangePasswordServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // GETリクエストの場合はPOSTメソッドを呼び出す
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newPassword = (String) request.getSession().getAttribute("newPassword");
        String empid = (String) request.getSession().getAttribute("empid");

        if (newPassword == null || empid == null) {
            response.sendRedirect("change_password.jsp?error=Invalid session or input");
            return;
        }

        try {
            String hashedPassword = PasswordUtil.hashPassword(newPassword);

            Connection connection = DatabaseConnection.initializeDatabase();
            String sql = "UPDATE employees SET emppassword_hash = ? WHERE empid = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, hashedPassword);
            statement.setString(2, empid);
            statement.executeUpdate();

            statement.close();
            connection.close();

            response.sendRedirect("change_password_success.jsp");
        } catch (NoSuchAlgorithmException | ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("change_password.jsp?error=An error occurred");
        }
    }
}