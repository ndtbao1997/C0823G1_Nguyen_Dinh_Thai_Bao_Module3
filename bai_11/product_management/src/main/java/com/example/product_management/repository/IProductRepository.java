package com.example.product_management.repository;

import com.example.product_management.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> getAll();
    void addProduct(Product product);
    void editProduct(int id, Product product);
    void removeProduct(int id);
    Product findById(int id);

    boolean checkId(int id);

    List<Product> searchByName(String name);
}
