package com.example.product_management.controller;

import com.example.product_management.model.Product;
import com.example.product_management.service.ProductService;
import com.example.product_management.service.ProductServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet",urlPatterns = "/products")
public class ProductServlet extends HttpServlet {
    private final ProductService productService = new ProductServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "add":
                addProduct(req,resp);
                break;
            case "edit":
                editProduct(req,resp);
                break;
            case "remove":
                removeProduct(req,resp);
                break;
            default:
                break;
        }
    }
    private void removeProduct(HttpServletRequest request,HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        RequestDispatcher requestDispatcher;
        if (product == null){
            requestDispatcher = request.getRequestDispatcher("/error-404.jsp");
        } else {
            productService.removeProduct(id);
            try{
                response.sendRedirect("/products");
            }catch (IOException e){
                e.printStackTrace();
            }
        }
    }
    private void editProduct(HttpServletRequest request,HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        Long price = Long.parseLong(request.getParameter("price"));
        String describe = request.getParameter("describe");
        String producer = request.getParameter("producer");
        Product product = productService.findById(id);
        RequestDispatcher requestDispatcher;
        if (product == null){
            requestDispatcher = request.getRequestDispatcher("/error-404.jsp");
        } else {
            product.setName(name);
            product.setPrice(price);
            product.setDescribe(describe);
            product.setProducer(producer);
            productService.editProduct(id,product);
            request.setAttribute("product",product);
            request.setAttribute("message","Product information was updated");
            requestDispatcher = request.getRequestDispatcher("product/edit.jsp");
        }
        try{
            requestDispatcher.forward(request,response);
        }catch (ServletException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }
    }
    private void addProduct(HttpServletRequest request,HttpServletResponse response){
        String name = request.getParameter("name");
        Long price = Long.parseLong(request.getParameter("price"));
        String describe = request.getParameter("describe");
        String producer = request.getParameter("producer");
        int id = 0;
        do {
            id += 1;
        }while (productService.checkId(id));
        Product product = new Product(id,name,price,describe,producer);
        productService.addProduct(product);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/add.jsp");
        request.setAttribute("message","New product was create");
        try{
            requestDispatcher.forward(request,response);
        }catch (ServletException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "add":
                showAddForm(req,resp);
                break;
            case "edit":
                showEditForm(req,resp);
                break;
            case "remove":
                showRemoveForm(req,resp);
                break;
            case "view":
                viewProduct(req,resp);
                break;
            default:
                listProducts(req,resp);
                break;
        }
    }
    private void viewProduct(HttpServletRequest request,HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        RequestDispatcher requestDispatcher;
        if(product == null){
            requestDispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product",product);
            requestDispatcher = request.getRequestDispatcher("product/view.jsp");
        }
        try{
            requestDispatcher.forward(request,response);
        }catch (ServletException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }
    }
    private void showRemoveForm(HttpServletRequest request, HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        RequestDispatcher requestDispatcher;
        if (product == null){
            requestDispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product",product);
            requestDispatcher = request.getRequestDispatcher("product/remove.jsp");
        }
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void showEditForm(HttpServletRequest request,HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        RequestDispatcher requestDispatcher;
        if (product == null){
            requestDispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product-edit",product);
            requestDispatcher = request.getRequestDispatcher("product/list.jsp");
        }
        try {
            requestDispatcher.forward(request,response);
        }catch (ServletException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }
    }
    private void showAddForm(HttpServletRequest request, HttpServletResponse response){
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/add.jsp");
        try{
            requestDispatcher.forward(request,response);
        }catch (ServletException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }
    }
    private void listProducts(HttpServletRequest request,HttpServletResponse response){
        List<Product> productList = productService.getAll();
        request.setAttribute("products",productList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/list.jsp");
        try{
            requestDispatcher.forward(request,response);
        }catch (ServletException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }
    }
}
