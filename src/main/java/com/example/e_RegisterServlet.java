package com.example;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/e_register")
public class e_RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); // 漢字対応
        response.setContentType("text/html; charset=UTF-8");

        String empid = request.getParameter("empid");
        String empfname = request.getParameter("empfname");
        String emplname = request.getParameter("emplname");
        String emppasswordd = request.getParameter("emppasswordd");
        String emproleStr = request.getParameter("emprole");
        int emprole = Integer.parseInt(emproleStr);

        try {
            String hashedPassword = PasswordUtil.hashPassword(emppasswordd);

            Connection connection = DatabaseConnection.initializeDatabase();
            String sql = "INSERT INTO employees (empid, empfname, emplname, emppasswordd, emppassword_hash, emprole) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, empid);
            statement.setString(2, empfname);
            statement.setString(3, emplname);
            statement.setString(4, emppasswordd);  // Plain text password (if needed)
            statement.setString(5, hashedPassword); // Hashed password
            statement.setInt(6, emprole);
            statement.executeUpdate();

            statement.close();
            connection.close();

            response.sendRedirect("e_register_success.jsp");
        } catch (NoSuchAlgorithmException | ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("e_error.jsp");
        }
    }
}
