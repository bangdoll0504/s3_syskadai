package com.example;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/sr_CompleteServlet")
public class sr_CompleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // セッションの取得とログイン確認
        HttpSession session = request.getSession(false); // 既存のセッションを取得
        if (session == null || session.getAttribute("empid") == null) {
            // セッションが存在しない、またはログインしていない場合はログインページにリダイレクト
            response.sendRedirect("login.jsp");
            return;
        }
       request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String addr = request.getParameter("addr");
        String phone = request.getParameter("phone");
        String capital = request.getParameter("capital");
        String deliveryDate = request.getParameter("delivery_date");

        saveToDatabase(id, name, addr, phone, capital, deliveryDate);
        request.getRequestDispatcher("sr_success.jsp").forward(request, response);
    }

    private void saveToDatabase(String id, String name, String addr, String phone, String capital, String deliveryDate) {
 
        try {
        	
        	Connection connection = DatabaseConnection.initializeDatabase();
            String sql = "INSERT INTO shiiregyosha (shiireid, shiiremei, shiireaddress, shiiretel, shihonkin, nouki) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, id);
                statement.setString(2, name);
                statement.setString(3, addr);
                statement.setString(4, phone);
                statement.setString(5, capital.replaceAll(",", ""));
                statement.setString(6, deliveryDate);
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
		}
    }
}
