package com.gluz.supermaket.item.controller.dto;

import com.gluz.supermaket.bag.controller.dto.BagDTO;
import com.gluz.supermaket.product.controller.dto.ProductDTO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;


@AllArgsConstructor

@Setter
@Getter

public class ItemDTO {

    private Long id;
    private int itemCount;
    private ProductDTO product;
    private BagDTO bag;

    public ItemDTO() {

    }
}
