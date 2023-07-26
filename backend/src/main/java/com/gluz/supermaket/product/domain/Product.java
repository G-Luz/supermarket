package com.gluz.supermaket.product.domain;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Objects;

@Getter
@Setter
@Entity
@Table(name = "product")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "base_64_image", columnDefinition="TEXT")
    private String base64Image;

    @Column(nullable = false)
    private String name;

    @Column(name = "description", length = 150, nullable = false)
    private String description;

    @Column(name = "category", length = 150, nullable = false)
    private String category;

    @Column(name = "enable")
    private boolean enable;

    @Column(name = "price", nullable = false)
    private double price;

    @Column(name = "rating", nullable = false)
    private double rating;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Product)) return false;
        Product product = (Product) o;
        return Objects.equals(id, product.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }
}