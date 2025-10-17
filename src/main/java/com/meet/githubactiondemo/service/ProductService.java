package com.meet.githubactiondemo.service;

import com.meet.githubactiondemo.models.Product;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProductService {
    private final List<Product> productRepo = new ArrayList<>();

    ProductService() {
        for (int i = 1; i <= 10; i++)
            productRepo.add(new Product("Product" + i, i * 10.0));
    }

    public List<Product> getAllProducts() {
        return productRepo;
    }
}
