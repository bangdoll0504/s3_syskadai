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

@WebServlet("/u_change_password")
public class U_ChangePasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // セッションの取得とログイン確認
        HttpSession session = request.getSession(false); // 既存のセッションを取得
        if (session == null || session.getAttribute("empid") == null) {
            // セッションが存在しない、またはログインしていない場合はログインページにリダイレクト
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

            response.sendRedirect("u_password_change_success.jsp");
        } catch (NoSuchAlgorithmException | ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("u_password_change_error.jsp");
        }
    }
}
