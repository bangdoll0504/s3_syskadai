package com.example;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/shiireListServlet")
public class shiireListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String jdbcUrl = "jdbc:mysql://localhost:3306/s3_syskadai?useUnicode=true&characterEncoding=utf8";
        String jdbcUser = "root";
        String jdbcPass = "password";

        List<Shiiregyosha> shiireList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPass)) {
                String sql = "SELECT * FROM shiiregyosha";
                try (Statement stmt = conn.createStatement()) {
                    ResultSet rs = stmt.executeQuery(sql);
                    while (rs.next()) {
                        Shiiregyosha shiire = new Shiiregyosha();
                        shiire.setShiireid(rs.getString("shiireid"));
                        shiire.setShiiremei(rs.getString("shiiremei"));
                        shiire.setShiireaddress(rs.getString("shiireaddress"));
                        shiire.setShiiretel(rs.getString("shiiretel"));
                        shiire.setShihonkin(rs.getInt("shihonkin"));
                        shiire.setNouki(rs.getInt("nouki"));
                        shiireList.add(shiire);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("shiireList", shiireList);
        request.getRequestDispatcher("sr_list.jsp").forward(request, response);
    }
}
