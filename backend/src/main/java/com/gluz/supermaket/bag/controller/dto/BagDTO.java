package com.gluz.supermaket.bag.controller.dto;

import com.gluz.supermaket.item.controller.dto.ItemDTO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@AllArgsConstructor

@Setter
@Getter

public class BagDTO {
    private Long id;
    private int itemCount;
    private double totalPrice;
    private List<ItemDTO> items;

    public BagDTO() {

    }
}
