package com.example.product_management.repository;

import com.example.product_management.model.Product;

import java.util.*;

public class ProductRepository implements IProductRepository {
    private static final Map<Integer, Product> productMap = new LinkedHashMap<>();

    static {
        productMap.put(1, new Product(1, "Bàn", 100000L, "Bàn rộng 50cm", "VietNam"));
        productMap.put(2, new Product(2, "Ghế", 110000L, "Ghế rộng 50cm", "Laos"));
        productMap.put(3, new Product(3, "Tủ", 120000L, "Tủ cao 50cm", "Thailand"));
        productMap.put(4, new Product(4, "Giá đựng dép", 125000L, "Giá đựng dép cao 50cm", "Thailand"));
    }


    @Override
    public List<Product> getAll() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public void addProduct(Product product) {
        productMap.put(product.getId(),product);
    }

    @Override
    public void editProduct(int id, Product product) {
        productMap.put(id, product);
    }

    @Override
    public void removeProduct(int id) {
        productMap.remove(id);
    }

    @Override
    public Product findById(int id) {
        return productMap.get(id);
    }

    @Override
    public boolean checkId(int id) {
        Set<Integer> products = productMap.keySet();
        for (Integer integer : products) {
            if(productMap.get(integer).getId() == id){
                return true;
            }
        }
        return false;
    }

    @Override
    public List<Product> searchByName(String name) {
        List<Product> productList = getAll();
        List<Product> products = new ArrayList<>();
        for (Product product:productList){
            if (product.getName().toLowerCase().contains(name.toLowerCase())){
                products.add(product);
            }
        }
        return products;
    }
}
