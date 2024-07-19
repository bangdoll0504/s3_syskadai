package com.example;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/patient_list")
public class PatientListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Patient> patientList = new ArrayList<>();
        
        try {
            Connection connection = DatabaseConnection.initializeDatabase();
            String sql = "SELECT patid, patfname, patlname, hokenmei, hokenexp FROM patient";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String patid = resultSet.getString("patid");
                String patfname = resultSet.getString("patfname");
                String patlname = resultSet.getString("patlname");
                String hokenmei = resultSet.getString("hokenmei");
                String hokenexp = resultSet.getDate("hokenexp").toString();
                
                Patient patient = new Patient(patid, patfname, patlname, hokenmei, hokenexp);
                patientList.add(patient);
            }

            statement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("patientList", patientList);
        request.getRequestDispatcher("patient_list.jsp").forward(request, response);
    }
}
