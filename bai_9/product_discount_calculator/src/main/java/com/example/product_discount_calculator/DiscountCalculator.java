package com.example.product_discount_calculator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "displayDiscount", value = "/display-discount")
public class DiscountCalculator extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String description = req.getParameter("description");
        double price = Double.parseDouble(req.getParameter("price"));
        double discountPercent = Double.parseDouble(req.getParameter("discountPercent"));
        double discountAmount = price * discountPercent * 0.01;
        double discountPrice = price - discountAmount;
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/result.jsp");
        req.setAttribute("description", description);
        req.setAttribute("price", price);
        req.setAttribute("discountPercent", discountPercent);
        req.setAttribute("discountAmount", discountAmount);
        req.setAttribute("discountPrice", discountPrice);
        requestDispatcher.forward(req,resp);
    }
}
