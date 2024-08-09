package com.example;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/sr_RegisterServlet")
public class sr_RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // セッションの取得とログイン確認
        HttpSession session = request.getSession(false); // 既存のセッションを取得
        if (session == null || session.getAttribute("empid") == null) {
            // セッションが存在しない、またはログインしていない場合はログインページにリダイレクト
            response.sendRedirect("login.jsp");
            return;
        }
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String addr = request.getParameter("address");
        String phone = request.getParameter("phone");
        String capital = request.getParameter("capital");
        String deliveryDate = request.getParameter("delivery_date");

        boolean hasError = false;
        StringBuilder errorMessage = new StringBuilder();

        if (!Validator.isValidPhoneNumber(phone)) {
            hasError = true;
            errorMessage.append("電話番号が正しくありません。<br/>");
        }

        if (!Validator.isValidAmount(capital)) {
            hasError = true;
            errorMessage.append("資本金が正しくありません。<br/>");
        }

        if (hasError) {
            request.setAttribute("error", errorMessage.toString());
            request.setAttribute("id", id);
            request.setAttribute("name", name);
            request.setAttribute("addr", addr);
            request.setAttribute("phone", phone);
            request.setAttribute("capital", capital);
            request.setAttribute("delivery_date", deliveryDate);
            request.getRequestDispatcher("sr_register.jsp").forward(request, response);
        } else {
            request.setAttribute("id", id);
            request.setAttribute("name", name);
            request.setAttribute("addr", addr);
            request.setAttribute("phone", phone);
            request.setAttribute("capital", capital);
            request.setAttribute("delivery_date", deliveryDate);
            request.getRequestDispatcher("sr_confirm.jsp").forward(request, response);
        }
    }
}
