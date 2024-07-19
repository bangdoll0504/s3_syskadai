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
import javax.servlet.http.HttpSession;

@WebServlet("/change_password")
public class ChangePasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("empid") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String empid = (String) session.getAttribute("empid");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (newPassword == null || !newPassword.equals(confirmPassword)) {
            response.sendRedirect("change_password.jsp?error=Passwords do not match");
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
