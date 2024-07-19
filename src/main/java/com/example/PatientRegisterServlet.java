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

@WebServlet("/patient_register")
public class PatientRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        String patid = request.getParameter("patid");
        String patfname = request.getParameter("patfname");
        String patlname = request.getParameter("patlname");
        String hokenmei = request.getParameter("hokenmei");
        String hokenexp = request.getParameter("hokenexp");

        try {
            Connection connection = DatabaseConnection.initializeDatabase();
            String sql = "INSERT INTO patient (patid, patfname, patlname, hokenmei, hokenexp) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, patid);
            statement.setString(2, patfname);
            statement.setString(3, patlname);
            statement.setString(4, hokenmei);
            statement.setString(5, hokenexp);
            statement.executeUpdate();

            statement.close();
            connection.close();

            response.sendRedirect("patient_register_success.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("patient_register_error.jsp");
        }
    }
}
