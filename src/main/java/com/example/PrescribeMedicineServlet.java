package com.example;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/prescribe_medicine")
public class PrescribeMedicineServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // セッションの取得とログイン確認
        HttpSession session = request.getSession(false); // 既存のセッションを取得
        if (session == null || session.getAttribute("empid") == null) {
            // セッションが存在しない、またはログインしていない場合はログインページにリダイレクト
            response.sendRedirect("login.jsp");
            return;
        }
        String patientId = request.getParameter("patientId");
        Map<String, String[]> parameterMap = request.getParameterMap();
        
        List<Prescription> prescriptions = new ArrayList<>();

        for (Map.Entry<String, String[]> entry : parameterMap.entrySet()) {
            String key = entry.getKey();
            if (key.startsWith("quantity_")) {
                String medicineId = key.split("_")[1];
                int quantity = Integer.parseInt(entry.getValue()[0]);
                
                if (quantity > 0) {
                    Prescription prescription = new Prescription();
                    prescription.setPatientId(patientId);
                    prescription.setMedicineid(medicineId);
                    prescription.setQuantity(quantity);
                    prescriptions.add(prescription);
                }
            }
        }

        request.setAttribute("prescriptions", prescriptions);
        
        // 確認画面に転送
        RequestDispatcher dispatcher = request.getRequestDispatcher("medicine_confirm.jsp");
        dispatcher.forward(request, response);
    }
}
