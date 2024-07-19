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

@WebServlet("/th_RegisterServlet")
public class th_RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String tabyouinid = request.getParameter("tabyouinid");
        String tabyouinmei = request.getParameter("tabyouinmei");
        String tabyouinaddress = request.getParameter("tabyouinaddress");
        String tabyouintel = request.getParameter("tabyouintel");
        int tabyouinshihonkin = Integer.parseInt(request.getParameter("tabyouinshihonkin"));
        int kyukyu = Integer.parseInt(request.getParameter("kyukyu"));

        String jdbcUrl = "jdbc:mysql://localhost:3306/s3_syskadai?useUnicode=true&characterEncoding=utf8";
        String jdbcUser = "root";
        String jdbcPass = "password";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPass)) {
                String sql = "INSERT INTO tabyouin (tabyouinid, tabyouinmei, tabyouinaddress, tabyouintel, tabyouinshihonkin, kyukyu) VALUES (?, ?, ?, ?, ?, ?)";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, tabyouinid);
                    stmt.setString(2, tabyouinmei);
                    stmt.setString(3, tabyouinaddress);
                    stmt.setString(4, tabyouintel);
                    stmt.setInt(5, tabyouinshihonkin);
                    stmt.setInt(6, kyukyu);
                    stmt.executeUpdate();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("th_success.jsp");
    }
}
