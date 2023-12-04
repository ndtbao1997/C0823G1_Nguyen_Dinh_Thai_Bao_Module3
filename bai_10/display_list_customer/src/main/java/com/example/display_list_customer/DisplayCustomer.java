package com.example.display_list_customer;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "displayCustomer", value = "/display-customer")
public class DisplayCustomer extends HttpServlet {
    private static final List<Customer> customerList = new ArrayList<>();

    static {
        customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "tham-tu-lung-danh-conan-01-2998.jpg"));
        customerList.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "tham-tu-lung-danh-conan-01-2998.jpg"));
        customerList.add(new Customer("Nguyễn Thái Hòa", "1983-08-22", "Nam Định", "tham-tu-lung-danh-conan-01-2998.jpg"));
        customerList.add(new Customer("Trần Đăng Khoa", "1983-08-17", "Hà Tây", "tham-tu-lung-danh-conan-01-2998.jpg"));
        customerList.add(new Customer("Nguyễn Đình Thi", "1983-08-19", "Đà Nẵng", "tham-tu-lung-danh-conan-01-2998.jpg"));
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
        request.setAttribute("customerList", customerList);
        requestDispatcher.forward(request, response);
    }
}