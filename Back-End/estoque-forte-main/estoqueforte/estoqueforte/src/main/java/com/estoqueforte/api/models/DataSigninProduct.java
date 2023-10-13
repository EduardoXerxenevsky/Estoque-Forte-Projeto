package com.estoqueforte.api.models;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

public record DataSigninProduct(
                                 @NotBlank
                                 String name,
                                  @NotBlank
                                  String brand,
                                @NotBlank
                                String description,
                                @NotNull
                                double price) {

}
