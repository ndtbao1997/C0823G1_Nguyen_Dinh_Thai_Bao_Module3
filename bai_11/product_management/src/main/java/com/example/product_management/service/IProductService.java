package com.example.product_management.service;

import com.example.product_management.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> getAll();
    void addProduct(Product product);
    void editProduct(int id, Product product);
    void removeProduct(int id);

    Product findById(int id);

    boolean checkId(int id);

    List<Product> searchByName(String name);
}
