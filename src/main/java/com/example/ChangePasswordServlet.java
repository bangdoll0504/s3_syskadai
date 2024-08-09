package com.example;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/change_password")
public class ChangePasswordServlet extends HttpServlet {
	private static final Logger logger = Logger.getLogger(LoginServlet.class.getName());
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // GETリクエストの場合はPOSTメソッドを呼び出す
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // セッションの取得とログイン確認
        HttpSession session = request.getSession(false); // 既存のセッションを取得
        if (session == null || session.getAttribute("empid") == null) {
            // セッションが存在しない、またはログインしていない場合はログインページにリダイレクト
            response.sendRedirect("login.jsp");
            return;
        }

        String newPassword = (String) request.getSession().getAttribute("newPassword");
        String empid = (String) request.getSession().getAttribute("empid");
        logger.info("empid="+empid);
        logger.info("newPassword="+newPassword);

        if (newPassword == null || empid == null) {
            response.sendRedirect("change_password.jsp?error=Invalid session or input");
            return;
        }

        try {
            String hashedPassword = PasswordUtil.hashPassword(newPassword);
            logger.info("hashedPassword="+hashedPassword);

            Connection connection = DatabaseConnection.initializeDatabase();
            String sql = "UPDATE employees SET emppassword_hash = ? WHERE empid = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, hashedPassword);
            statement.setString(2, empid);
            int rowsUpdated = statement.executeUpdate();
            
            if (rowsUpdated > 0) {
                //connection.commit();
                logger.info("Password updated successfully.");
            } else {
            	logger.info("User not found.");
            }

            statement.close();
            connection.close();

            response.sendRedirect("change_password_success.jsp");
        } catch (NoSuchAlgorithmException | ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("change_password.jsp?error=An error occurred");
        }
    }
}