package com.example.product_management.controller;

import com.example.product_management.model.Product;
import com.example.product_management.service.IProductService;
import com.example.product_management.service.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

@WebServlet(name = "ProductServlet",urlPatterns = "/products")
public class ProductServlet extends HttpServlet {
    private final IProductService productService = new ProductService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
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
            case "search":
                searchProduct(req,resp);
                break;
            default:
                break;
        }
    }

    private void searchProduct(HttpServletRequest req, HttpServletResponse resp) {
        String name = req.getParameter("name");
        List<Product> productList = productService.searchByName(name);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("product/search.jsp");
        req.setAttribute("products",productList);
        try{
            requestDispatcher.forward(req,resp);
        }catch (ServletException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }
    }

    private void removeProduct(HttpServletRequest request,HttpServletResponse response){
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        RequestDispatcher requestDispatcher;
        List<Product> productList;
        if (product == null){
            requestDispatcher = request.getRequestDispatcher("/error-404.jsp");
        } else {
            productService.removeProduct(id);
            productList = productService.getAll();
            String message = "Bạn đã xóa sản phẩm có id " + id + " thành công!";
            request.setAttribute("products",productList);
            request.setAttribute("message", message);
            requestDispatcher = request.getRequestDispatcher("product/list.jsp");
        }
        try{
            requestDispatcher.forward(request,response);
        }catch (ServletException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }
    }
    private void editProduct(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        Long price = Long.parseLong(request.getParameter("price"));
        String describe = request.getParameter("describe");
        String producer = request.getParameter("producer");
        Product product = productService.findById(id);
        List<Product> productList;
        RequestDispatcher requestDispatcher;
        if (product == null){
            requestDispatcher = request.getRequestDispatcher("/error-404.jsp");
        } else {
            product.setName(name);
            product.setPrice(price);
            product.setDescribe(describe);
            product.setProducer(producer);
            productService.editProduct(id,product);
            productList = productService.getAll();
            request.setAttribute("products",productList);
            String message = "Bạn đã sửa thông tin của sản phẩm có id " + id + " thành công";
            request.setAttribute("message",message);
            requestDispatcher = request.getRequestDispatcher("product/list.jsp");
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
        List<Product> productList = productService.getAll();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/list.jsp");
        request.setAttribute("message","Bạn vừa thêm một sản phẩm thành công");
        request.setAttribute("products",productList);
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
            listProducts(req,resp);
        }
    }

    private void listProducts(HttpServletRequest request,HttpServletResponse response){
        List<Product> productList = this.productService.getAll();
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
