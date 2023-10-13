package com.estoqueforte.api.models;

public record DataPageProduct(Long id, String name, String brand, String description, double price) {
    public DataPageProduct(Products products){
        this(products.getId(), products.getName(), products.getBrand(), products.getDescription(), products.getPrice());

    }


}
