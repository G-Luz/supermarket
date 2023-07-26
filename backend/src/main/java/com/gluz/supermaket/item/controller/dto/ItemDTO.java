package com.gluz.supermaket.item.controller.dto;

import com.gluz.supermaket.bag.domain.Bag;
import com.gluz.supermaket.product.domain.Product;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;


@AllArgsConstructor

@Setter
@Getter

public class ItemDTO {

    private Long id;
    private int itemCount;
    private Product product;
    private Bag bag;

    public ItemDTO() {

    }
}
