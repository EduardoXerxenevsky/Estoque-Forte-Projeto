package com.estoqueforte.api.models;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Products,Long> {
    Page<Products> findAllByAtivoTrue(Pageable pageable);
}
