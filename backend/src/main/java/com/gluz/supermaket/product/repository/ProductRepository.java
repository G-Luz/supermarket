package com.gluz.supermaket.product.repository;

import com.gluz.supermaket.product.domain.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    @Query(value = "SELECT * FROM Product prod WHERE prod.category = :category AND prod.enable = true", nativeQuery = true)
    List<Product> findActiveProductsByCategory(@Param("category") String category);

    @Query(value = "SELECT * FROM Product prod WHERE prod.category = :category", nativeQuery = true)
    List<Product> findProductsByCategory(@Param("category") String category);

    @Query(value = "SELECT * FROM Product prod " +
            "WHERE prod.category = :category " +
            "AND (prod.name = :filter OR prod.description = :filter)",
            nativeQuery = true)
    List<Product> findCategoryProductByNameOrDescription(@Param("category") String category,
                                                         @Param("filter") String filter);

}