package com.example;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/patient_list_expired")
public class PatientExpiredListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // セッションの取得とログイン確認
        HttpSession session = request.getSession(false); // 既存のセッションを取得
        if (session == null || session.getAttribute("empid") == null) {
            // セッションが存在しない、またはログインしていない場合はログインページにリダイレクト
            response.sendRedirect("login.jsp");
            return;
        }
        List<Patient> patientList = new ArrayList<>();
        
        try {
            Connection connection = DatabaseConnection.initializeDatabase();
            
            // SQLクエリを変更して、現在の日付より古い保険の有効期限を持つ患者を取得
            String sql = "SELECT patid, patfname, patlname, hokenmei, hokenexp FROM patient WHERE hokenexp < ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            
            // 現在の日付を取得してSQLにセット
            LocalDate today = LocalDate.now();
            statement.setDate(1, java.sql.Date.valueOf(today));
            
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
        request.getRequestDispatcher("patient_expired_list.jsp").forward(request, response);
    }
}
