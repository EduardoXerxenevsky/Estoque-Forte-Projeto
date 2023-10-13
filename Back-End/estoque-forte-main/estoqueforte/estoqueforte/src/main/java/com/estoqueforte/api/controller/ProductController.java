package com.estoqueforte.api.controller;

import com.estoqueforte.api.models.*;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;


@RequestMapping("/produtos")
@RestController
public class ProductController {
    @Autowired
    private ProductRepository repository;
    private Products products;

    @PostMapping
    @Transactional
    public ResponseEntity postProduct(@RequestBody @Valid DataSigninProduct data, UriComponentsBuilder uriBuilder) {
        var produto = new Products(data);
        repository.save(produto);

        var uri = uriBuilder.path("/products/{id}").buildAndExpand(produto.getId()).toUri();
        return ResponseEntity.created(uri).body(data);
    }


    @GetMapping
    public ResponseEntity<Page<DataPageProduct>> getProduct(@PageableDefault(size = 10, sort = {"name"})Pageable pageable){
       var page = repository.findAllByAtivoTrue(pageable).map(DataPageProduct::new);
       return ResponseEntity.ok(page);

    }



    @PutMapping
    @Transactional
    public ResponseEntity updateProduct(@RequestBody @Valid DataUpdateProduct data){
        var product = repository.getReferenceById(data.id());
        System.out.println("Atualizando: " + data.id());
        System.out.println("Nome Antigo: " + product.getName());
        product.updateData(data);
        System.out.println("Nome novo: " + product.getName());
        return ResponseEntity.ok().build();
    }



    @DeleteMapping("/{id}")
    @Transactional
    public ResponseEntity deleteProduct(@PathVariable Long id){
        var product = repository.getReferenceById(id);
        product.excluir();
        return ResponseEntity.noContent().build();
    }
}




