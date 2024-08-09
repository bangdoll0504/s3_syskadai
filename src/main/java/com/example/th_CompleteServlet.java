package com.example;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/th_CompleteServlet")
public class th_CompleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
    	
	    // セッションの取得とログイン確認
	    HttpSession session = request.getSession(false); // 既存のセッションを取得
	    if (session == null || session.getAttribute("empid") == null) {
	        // セッションが存在しない、またはログインしていない場合はログインページにリダイレクト
	        response.sendRedirect("login.jsp");
	        return;
	    }
        String tabyouinid = request.getParameter("tabyouinid");
        String tabyouinmei = request.getParameter("tabyouinmei");
        String tabyouinaddress = request.getParameter("tabyouinaddress");
        String tabyouintel = request.getParameter("tabyouintel");
        String tabyouinshihonkin;
        String tabyouinshihonkin_wk = request.getParameter("tabyouinshihonkin");
        String kyukyu = request.getParameter("kyukyu");

        try {
            // データベース接続情報
//            String jdbcURL = "jdbc:mysql://localhost:3306/?useUnicode=true&characterEncoding=utf8";
//            String dbUser = "root";
//            String dbPassword = "password";

            //Class.forName("com.mysql.jdbc.Driver");
            //Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
            Connection connection = DatabaseConnection.initializeDatabase();
            
            String sql = "INSERT INTO tabyouin (tabyouinid, tabyouinmei, tabyouinaddress, tabyouintel, tabyouinshihonkin, kyukyu) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            
            System.out.println("資本金=" + tabyouinshihonkin_wk);
            tabyouinshihonkin = Validator.ConvAmount(tabyouinshihonkin_wk);
            
            statement.setString(1, tabyouinid);
            statement.setString(2, tabyouinmei);
            statement.setString(3, tabyouinaddress);
            statement.setString(4, tabyouintel);
            statement.setString(5, tabyouinshihonkin);
            statement.setString(6, kyukyu);

            statement.executeUpdate();
            statement.close();
            connection.close();
            System.out.println("th Complete");

            response.sendRedirect("th_success.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("th_error.jsp");
        }
    }
}
