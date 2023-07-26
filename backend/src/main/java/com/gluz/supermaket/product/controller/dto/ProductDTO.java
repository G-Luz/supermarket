package com.gluz.supermaket.product.controller.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter

public class ProductDTO {

    private Long id;
    private String base64Image;
    private String name;
    private String description;
    private String category;
    private boolean enable;
    private double rating;
    private double price;


}
