package com.estoqueforte.api.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Table(name="Product")
@Entity(name="Products")
@Getter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(of="id")

public class Products {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String brand;
    private String description;
    private double price;
    private boolean ativo;

    public Products(DataSigninProduct data) {
        this.ativo = true;
        this.name = data.name();
        this.brand = data.brand();
        this.description = data.description();
        this.price = data.price();
    }

    public void excluir(){
        this.ativo = false;
    }

    public void updateData(DataUpdateProduct dataUpdateProduct){
        if(dataUpdateProduct.name() != null){
            this.name = dataUpdateProduct.name();
        }
        if (dataUpdateProduct.brand()!= null){
            this.brand = dataUpdateProduct.brand();
        }
        if (dataUpdateProduct.description()!= null){
            this.description = dataUpdateProduct.description();

        }
        if (Math.abs(dataUpdateProduct.price() - this.price) > 0.0001) {
            this.price = dataUpdateProduct.price();
        }

    }

}
