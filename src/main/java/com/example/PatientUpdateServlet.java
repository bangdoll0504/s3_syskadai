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

@WebServlet("/patient_update")
public class PatientUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String patid = request.getParameter("patid");
        String hokenmei = request.getParameter("hokenmei");
        String hokenexp = request.getParameter("hokenexp");

        try {
            Connection connection = DatabaseConnection.initializeDatabase();

            if (hokenmei != null && !hokenmei.isEmpty()) {
                String checkSql = "SELECT hokenexp FROM patient WHERE patid = ? AND hokenmei IS NOT NULL";
                PreparedStatement checkStmt = connection.prepareStatement(checkSql);
                checkStmt.setString(1, patid);
                ResultSet rs = checkStmt.executeQuery();

                if (rs.next()) {
                    String existingExp = rs.getString("hokenexp");
                    if (hokenexp.compareTo(existingExp) <= 0) {
                        response.sendRedirect("patient_update_error.jsp");
                        return;
                    }
                }

                rs.close();
                checkStmt.close();
            }

            StringBuilder sqlBuilder = new StringBuilder("UPDATE patient SET ");
            boolean first = true;

            if (hokenmei != null && !hokenmei.isEmpty()) {
                sqlBuilder.append("hokenmei = ?");
                first = false;
            }

            if (!first) {
                sqlBuilder.append(", ");
            }
            sqlBuilder.append("hokenexp = ? WHERE patid = ?");

            PreparedStatement statement = connection.prepareStatement(sqlBuilder.toString());
            int index = 1;

            if (hokenmei != null && !hokenmei.isEmpty()) {
                statement.setString(index++, hokenmei);
            }
            statement.setString(index++, hokenexp);
            statement.setString(index, patid);

            statement.executeUpdate();
            statement.close();
            connection.close();

            response.sendRedirect("patient_update_success.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("patient_update_error.jsp");
        }
    }
}
