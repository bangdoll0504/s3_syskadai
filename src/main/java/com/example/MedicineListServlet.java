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

@WebServlet("/medicine_list")
public class MedicineListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection connection = DatabaseConnection.initializeDatabase();
            String query = "SELECT * FROM medicine";
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();

            List<Medicine> medicines = new ArrayList<>();
            while (resultSet.next()) {
                String medicineId = resultSet.getString("medicineid");
                String medicineName = resultSet.getString("medicinename");
                String unit = resultSet.getString("unit"); // 追加
                Medicine medicine = new Medicine(medicineId, medicineName, unit);
                medicines.add(medicine);
            }

            request.setAttribute("medicines", medicines);
            request.getRequestDispatcher("medicine_list.jsp").forward(request, response);

            statement.close();
            resultSet.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
