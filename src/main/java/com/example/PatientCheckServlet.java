package com.example;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/patient_check")
public class PatientCheckServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String patid = request.getParameter("patid");

        try {
            Connection connection = DatabaseConnection.initializeDatabase();
            String sql = "SELECT * FROM patient WHERE patid = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, patid);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                request.setAttribute("patid", patid);
                request.getRequestDispatcher("patient_check.jsp").forward(request, response);
            } else {
                response.sendRedirect("patient_id_not_found.jsp");
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("patient_update_error.jsp");
        }
    }
}
