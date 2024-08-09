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

@WebServlet("/MedicineRegisterServlet")
public class MedicineRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); // 漢字対応
        // セッションの取得とログイン確認
        HttpSession session = request.getSession(false); // 既存のセッションを取得
        if (session == null || session.getAttribute("empid") == null) {
            // セッションが存在しない、またはログインしていない場合はログインページにリダイレクト
            response.sendRedirect("login.jsp");
            return;
        }

        String medicineid = request.getParameter("medicineid");
        String medicinename = request.getParameter("medicinename");
        String unit = request.getParameter("unit");

        try {
            Connection connection = DatabaseConnection.initializeDatabase();
            String sql = "INSERT INTO medicine (medicineid, medicinename, unit) VALUES (?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, medicineid);
            statement.setString(2, medicinename);
            statement.setString(3, unit);
            statement.executeUpdate();

            statement.close();
            connection.close();

            response.sendRedirect("medicine_register_success.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("medicine_register_error.jsp");
        }
    }
}
