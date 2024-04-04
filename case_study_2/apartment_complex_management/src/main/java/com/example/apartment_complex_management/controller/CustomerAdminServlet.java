package com.example.apartment_complex_management.controller;

import com.example.apartment_complex_management.model.Account;
import com.example.apartment_complex_management.model.Customer;
import com.example.apartment_complex_management.model.CustomerDTO;
import com.example.apartment_complex_management.model.StaffDTO;
import com.example.apartment_complex_management.service.CustomerService;
import com.example.apartment_complex_management.service.IApartmentService;
import com.example.apartment_complex_management.service.ICustomerService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer-admin")
public class CustomerAdminServlet extends HttpServlet {
    private ICustomerService iCustomerService;

    @Override
    public void init() throws ServletException {
        iCustomerService = new CustomerService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "listCustomer":
                showListCustomer(req,resp);
                break;
            case "doingCustomer":
                showListDoingCustomer(req,resp);
                break;
            case "notDoingCustomer":
                showListNotDoingCustomer(req,resp);
                break;
            case "addCustomer":
                showAddCustomerForm(req,resp);
                break;
        }
    }

    private void showAddCustomerForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/add-customer-form.jsp");
        List<Account> accounts = iCustomerService.selectAccountCustomer();
        req.setAttribute("account",accounts);
        requestDispatcher.forward(req,resp);
    }

    private void showListNotDoingCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CustomerDTO> customerDTOS = iCustomerService.selectAllCustomerDTO();
        List<CustomerDTO> customerDTOS1 = new ArrayList<>();
        for (CustomerDTO customerDTO:customerDTOS){
            if (customerDTO.getIsDeleted() == 1){
                customerDTOS1.add(customerDTO);
            }
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/list-customer.jsp");
        req.setAttribute("customerDTOS",customerDTOS1);
        requestDispatcher.forward(req,resp);
    }

    private void showListDoingCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CustomerDTO> customerDTOS = iCustomerService.selectAllCustomerDTO();
        List<CustomerDTO> customerDTOS1 = new ArrayList<>();
        for (CustomerDTO customerDTO:customerDTOS){
            if (customerDTO.getIsDeleted() == 0){
                customerDTOS1.add(customerDTO);
            }
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/list-customer.jsp");
        req.setAttribute("customerDTOS",customerDTOS1);
        requestDispatcher.forward(req,resp);
    }

    private void showListCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<CustomerDTO> customerDTOS = iCustomerService.selectAllCustomerDTO();
        List<CustomerDTO> customerDTOS1 = new ArrayList<>();
        for (CustomerDTO customerDTO:customerDTOS){
            if (customerDTO.getIsDeleted() == 0){
                customerDTOS1.add(customerDTO);
            }
        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/list-customer.jsp");
        req.setAttribute("customerDTOS",customerDTOS1);
        requestDispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "editCustomer":
                editCustomer(req,resp);
                break;
            case "removeCustomer":
                removeCustomer(req,resp);
                break;
            case "recoverCustomer":
                recoverCustomer(req,resp);
                break;
            case "addCustomer":
                addNewCustomer(req,resp);
                break;
        }
    }

    private void addNewCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String dateOfBirth = req.getParameter("dateOfBirth");
        Integer gender = Integer.parseInt(req.getParameter("gender"));
        String numberCMND = req.getParameter("numberCMND");
        String numberPhone = req.getParameter("numberPhone");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        int idAccount = Integer.parseInt(req.getParameter("idAccount"));
        int isDelete = 0;
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/add-customer-form.jsp");
        req.setAttribute("name", name);
        req.setAttribute("dateOfBirth", dateOfBirth);
        req.setAttribute("numberCMND", numberCMND);
        req.setAttribute("numberPhone", numberPhone);
        req.setAttribute("email", email);
        req.setAttribute("address", address);
        req.setAttribute("idAccount", idAccount);
        if (name.isEmpty()) {
            req.setAttribute("drum1", "Vui lòng không để trống tên");
        }
        if (dateOfBirth.isEmpty()) {
            req.setAttribute("drum2", "Vui lòng không để trống ngày sinh");
        }
        if (numberCMND.isEmpty()) {
            req.setAttribute("drum3", "Vui lòng không để trống");
        } else if (iCustomerService.checkNumberCMND(numberCMND)) {
            req.setAttribute("drum3", "CCCD này đã tồn tại! Xin vui lòng nhập lại!");
        }
        if (numberPhone.isEmpty()) {
            req.setAttribute("drum4", "Vui lòng không để trống");
        } else if (iCustomerService.checkNumberPhone(numberPhone)) {
            req.setAttribute("drum4", "SĐT này đã tồn tại! Xin vui lòng nhập lại!");
        }
        if (email.isEmpty()) {
            req.setAttribute("drum5", "Vui lòng không để trống");
        }
        if (address.isEmpty()) {
            req.setAttribute("drum6", "Vui lòng không để trống");
        }
        if (!name.isEmpty() && !dateOfBirth.isEmpty() && !numberCMND.isEmpty() && !numberPhone.isEmpty() && !email.isEmpty() && !address.isEmpty()
                && !iCustomerService.checkNumberCMND(numberCMND) && !iCustomerService.checkNumberPhone(numberPhone)) {
            iCustomerService.addCustomer(new Customer(name, dateOfBirth, gender, numberCMND, numberPhone, email, address, idAccount, isDelete));
            req.setAttribute("result", "Bạn đã thêm thành công!");
            req.setAttribute("message","1");
        }
        requestDispatcher.forward(req, resp);
    }

    private void editCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String address = req.getParameter("address");
        Integer id = Integer.parseInt(req.getParameter("id"));
        iCustomerService.editCustomer(id,address);
        String message = "Bạn đã sửa thông tin khách hàng có id " + id + " thành công!";
        List<CustomerDTO> customerDTOS = iCustomerService.selectAllCustomerDTO();
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/list-customer.jsp");
        req.setAttribute("customerDTOS", customerDTOS);
        req.setAttribute("message", message);
        requestDispatcher.forward(req, resp);
    }
    private void recoverCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = Integer.parseInt(req.getParameter("id"));
        iCustomerService.recoverCustomer(id);
        String message = "Bạn đã phục hồi khách hàng có id " + id + " thành công!";
        List<CustomerDTO> customerDTOS = iCustomerService.selectAllCustomerDTO();
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/list-customer.jsp");
        req.setAttribute("customerDTOS", customerDTOS);
        req.setAttribute("message", message);
        requestDispatcher.forward(req, resp);
    }

    private void removeCustomer(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer id = Integer.parseInt(req.getParameter("id"));
        iCustomerService.removeCustomer(id);
        String message = "Bạn đã xoá khách hàng có id " + id + " thành công!";
        List<CustomerDTO> customerDTOS = iCustomerService.selectAllCustomerDTO();
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("admin/list-customer.jsp");
        req.setAttribute("customerDTOS", customerDTOS);
        req.setAttribute("message", message);
        requestDispatcher.forward(req, resp);
    }
}
