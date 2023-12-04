package com.example.calculator;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "calculator", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        try {
            float firstOperand = Float.parseFloat(request.getParameter("firstOperand"));
            String operator = request.getParameter("operator");
            float secondOperand = Float.parseFloat(request.getParameter("secondOperand"));
            float result = calculator(firstOperand, operator, secondOperand);
            String resultStr = firstOperand + " " + operator + " " + secondOperand + " = " + result;
            request.setAttribute("result", resultStr);
        } catch (Exception e) {
            request.setAttribute("message", e);
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        requestDispatcher.forward(request, response);
    }

    private float calculator(float firstOperand, String operator, float secondOperand) {
        switch (operator) {
            case "+":
                return firstOperand + secondOperand;
            case "-":
                return firstOperand - secondOperand;
            case "*":
                return firstOperand * secondOperand;
            case "/":
                if (secondOperand == 0) {
                    throw new RuntimeException("Can't divide by zero");
                }
                return firstOperand / secondOperand;
        }
        return 0;
    }
}