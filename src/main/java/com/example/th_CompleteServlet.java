package com.example;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/th_CompleteServlet")
public class th_CompleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tabyouinid = request.getParameter("tabyouinid");
        String tabyouinmei = request.getParameter("tabyouinmei");
        String tabyouinaddress = request.getParameter("tabyouinaddress");
        String tabyouintel = request.getParameter("tabyouintel");
        String tabyouinshihonkin = request.getParameter("tabyouinshihonkin");
        String kyukyu = request.getParameter("kyukyu");

        try {
            // データベース接続情報
            String jdbcURL = "jdbc:mysql://localhost:3306/?useUnicode=true&characterEncoding=utf8";
            String dbUser = "root";
            String dbPassword = "password";

            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            String sql = "INSERT INTO yourtable (tabyouinid, tabyouinmei, tabyouinaddress, tabyouintel, tabyouinshihonkin, kyukyu) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, tabyouinid);
            statement.setString(2, tabyouinmei);
            statement.setString(3, tabyouinaddress);
            statement.setString(4, tabyouintel);
            statement.setString(5, tabyouinshihonkin);
            statement.setString(6, kyukyu);

            statement.executeUpdate();
            statement.close();
            connection.close();

            response.sendRedirect("th_success.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("th_error.jsp");
        }
    }
}
