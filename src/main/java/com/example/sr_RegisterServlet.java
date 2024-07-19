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

@WebServlet("/shiire_RegisterServlet")
public class sr_RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String shiireid = request.getParameter("shiireid");
        String shiiremei = request.getParameter("shiiremei");
        String shiireaddress = request.getParameter("shiireaddress");
        String shiiretel = request.getParameter("shiiretel");
        int shihonkin = Integer.parseInt(request.getParameter("shihonkin"));
        int nouki = Integer.parseInt(request.getParameter("nouki"));

        String jdbcUrl = "jdbc:mysql://localhost:3306/s3_syskadai?useUnicode=true&characterEncoding=utf8";
        String jdbcUser = "root";
        String jdbcPass = "password";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPass)) {
                String sql = "INSERT INTO shiiregyosha (shiireid, shiiremei, shiireaddress, shiiretel, shihonkin, nouki) VALUES (?, ?, ?, ?, ?, ?)";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, shiireid);
                    stmt.setString(2, shiiremei);
                    stmt.setString(3, shiireaddress);
                    stmt.setString(4, shiiretel);
                    stmt.setInt(5, shihonkin);
                    stmt.setInt(6, nouki);
                    stmt.executeUpdate();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("sr_success.jsp");
    }
}
