package com.example;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/patient_confirm")
public class PatientConfirmServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // セッションの取得とログイン確認
        HttpSession session = request.getSession(false); // 既存のセッションを取得
        if (session == null || session.getAttribute("empid") == null) {
            // セッションが存在しない、またはログインしていない場合はログインページにリダイレクト
            response.sendRedirect("login.jsp");
            return;
        }
        request.setCharacterEncoding("UTF-8");
        
        String patid = request.getParameter("patid");
        String patfname = request.getParameter("patfname");
        String patlname = request.getParameter("patlname");
        String hokenmei = request.getParameter("hokenmei");
        String hokenexp = request.getParameter("hokenexp");

        request.setAttribute("patid", patid);
        request.setAttribute("patfname", patfname);
        request.setAttribute("patlname", patlname);
        request.setAttribute("hokenmei", hokenmei);
        request.setAttribute("hokenexp", hokenexp);

        request.getRequestDispatcher("patient_confirm.jsp").forward(request, response);
    }
}
