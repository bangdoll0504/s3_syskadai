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
import javax.servlet.http.HttpSession;

@WebServlet("/view_prescriptions")
public class ViewPrescriptionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // セッションの取得とログイン確認
        HttpSession session = request.getSession(false); // 既存のセッションを取得
        if (session == null || session.getAttribute("empid") == null) {
            // セッションが存在しない、またはログインしていない場合はログインページにリダイレクト
            response.sendRedirect("login.jsp");
            return;
        }
        try {
            Connection connection = DatabaseConnection.initializeDatabase();
            String query = "SELECT * FROM prescription";
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();

            List<Prescription> prescriptions = new ArrayList<>();
            while (resultSet.next()) {
                Prescription prescription = new Prescription();
                prescription.setPrescriptionId(resultSet.getInt("prescriptionid"));
                prescription.setPrescriptionDate(resultSet.getString("prescription_date"));
                prescription.setPatientId(resultSet.getString("patientId"));
                prescription.setMedicineid(resultSet.getString("medicineid"));
                prescription.setQuantity(resultSet.getInt("prescribedAt"));
                prescriptions.add(prescription);
            }

            request.setAttribute("prescriptions", prescriptions);
            request.getRequestDispatcher("prescription_list.jsp").forward(request, response);

            statement.close();
            resultSet.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("prescription_error.jsp");
        }
    }

    // POSTメソッドのリクエストをGETメソッドにリダイレクトする
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
