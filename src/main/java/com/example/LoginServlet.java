package com.example;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final Logger logger = Logger.getLogger(LoginServlet.class.getName());

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //String empid;
    	String userId = request.getParameter("userId");
        String password = request.getParameter("password");
        logger.info(userId);
        logger.info(password);
        
        try {
            // パスワードをハッシュ化
            String hashedPassword = PasswordUtil.hashPassword(password);
            System.out.println(hashedPassword);
            
            // データベース接続
            Connection con = DatabaseConnection.initializeDatabase();

            // ユーザーIDとハッシュ化されたパスワードをデータベースで照合
            String query = "SELECT * FROM employees WHERE empid = ? AND emppassword_hash = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, userId);
            pst.setString(2, hashedPassword);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                // ログイン成功
            	System.out.println("success");
            	System.out.println(rs.getInt("empRole"));
                HttpSession session = request.getSession();
                session.setAttribute("empid", userId);
                session.setAttribute("userRole", rs.getInt("empRole"));
                session.setMaxInactiveInterval(30 * 60); // セッションタイムアウトを30分に設定
                logger.info("Complete!!!!");                
                response.sendRedirect("welcome.jsp");
            } else {
                // ログイン失敗
                response.sendRedirect("login.jsp?error=1");
                logger.info("login.jsp?error=1");
            }

            pst.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
            logger.info("Somosomo Okasii");
            logger.info(e.toString());
        }
    }
}
