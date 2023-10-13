package com.estoqueforte.api.models;

import jakarta.validation.constraints.NotNull;

public record DataUpdateProduct(
        @NotNull
        Long id,
        String name,
        String brand,
        String description,
        double price


) {
}
