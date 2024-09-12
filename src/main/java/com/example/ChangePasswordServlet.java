package com.example;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // 既存のセッションを取得
        if (session == null || session.getAttribute("empid") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String newPassword = (String) request.getSession().getAttribute("newPassword");
        String c_empid = (String) request.getSession().getAttribute("c_empid");  // 変更対象のID

        if (newPassword == null || c_empid == null) {
            response.sendRedirect("change_password.jsp?error=Invalid session or input");
            return;
        }

        try {
            // パスワードのハッシュ化処理
            String hashedPassword = PasswordUtil.hashPassword(newPassword);

            // データベース接続とパスワード更新処理
            Connection connection = DatabaseConnection.initializeDatabase();
            String sql = "UPDATE employees SET emppassword_hash = ? WHERE empid = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, hashedPassword);
            statement.setString(2, c_empid);

            int rowsUpdated = statement.executeUpdate();

            statement.close();
            connection.close();

            // パスワード変更成功後、変更対象のIDをリクエストに渡してforward
            request.setAttribute("changedEmpId", c_empid);
            RequestDispatcher dispatcher = request.getRequestDispatcher("change_password_success.jsp");
            dispatcher.forward(request, response);

        } catch (NoSuchAlgorithmException | ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("change_password.jsp?error=An error occurred");
        }
    }
}
