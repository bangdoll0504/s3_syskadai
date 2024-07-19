package com.example;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String empid = request.getParameter("empid");
        String emppassword = request.getParameter("emppassword");

        try {
            Connection connection = DatabaseConnection.initializeDatabase();
            String sql = "SELECT empid, emppassword_hash, emprole FROM employees WHERE empid = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, empid);

            ResultSet result = statement.executeQuery();
            if (result.next()) {
                String storedPasswordHash = result.getString("emppassword_hash");
                int userRole = result.getInt("emprole");

                try {
                    if (PasswordUtil.verifyPassword(emppassword, storedPasswordHash)) {
                        // ログイン成功時の処理
                        HttpSession session = request.getSession();
                        session.setAttribute("empid", empid);
                        session.setAttribute("userRole", userRole);

                        response.sendRedirect("welcome.jsp");
                    } else {
                        // パスワードが一致しない場合の処理
                        response.sendRedirect("login.jsp?error=password");
                    }
                } catch (NoSuchAlgorithmException e) {
                    e.printStackTrace();
                    response.sendRedirect("error.jsp");
                }
            } else {
                // ユーザーが存在しない場合の処理
                response.sendRedirect("login.jsp?error=user");
            }

            result.close();
            statement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
