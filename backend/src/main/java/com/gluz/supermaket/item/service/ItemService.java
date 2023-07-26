package com.gluz.supermaket.item.service;

import com.gluz.supermaket.item.controller.dto.ItemDTO;
import com.gluz.supermaket.item.domain.Item;
import com.gluz.supermaket.item.repository.ItemRepository;
import com.gluz.supermaket.utils.ConvertEntities;
import org.springframework.stereotype.Service;

@Service
public class ItemService implements ConvertEntities<ItemDTO, Item> {

    public ItemRepository itemRepository;

    public ItemService(ItemRepository itemRepository) {
        this.itemRepository = itemRepository;
    }

    public ItemDTO saveItem(ItemDTO dto) {
        return convertToDTO(itemRepository.save(convertToEntity(dto)));
    }

    public ItemDTO updateItem(ItemDTO dto) {
        return convertToDTO(itemRepository.save(convertToEntity(dto)));
    }

    public void deleteItem(ItemDTO dto) {
        itemRepository.delete(convertToEntity(dto));
    }


    @Override
    public Item convertToEntity(ItemDTO dto) {
        Item item = new Item();
        item.setId((dto.getId()));
        item.setItemCount(dto.getItemCount());
        item.setProduct(dto.getProduct());
//        item.setBag(dto.getBag());
        return item;
    }

    @Override
    public ItemDTO convertToDTO(Item entity) {
        ItemDTO dto = new ItemDTO();
        dto.setId((entity.getId()));
        dto.setItemCount(entity.getItemCount());
        dto.setProduct(entity.getProduct());
//        dto.setBag(entity.getBag());
        return dto;
    }
}
