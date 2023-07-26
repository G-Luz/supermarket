package com.gluz.supermaket.item.service;

import com.gluz.supermaket.bag.controller.dto.BagDTO;
import com.gluz.supermaket.bag.domain.Bag;
import com.gluz.supermaket.bag.service.BagService;
import com.gluz.supermaket.item.controller.dto.ItemDTO;
import com.gluz.supermaket.item.domain.Item;
import com.gluz.supermaket.item.repository.ItemRepository;
import com.gluz.supermaket.product.service.ProductService;
import com.gluz.supermaket.utils.ConvertEntities;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ItemService implements ConvertEntities<ItemDTO, Item> {

    public ItemRepository itemRepository;
    public ProductService productService;

    public ItemService(ItemRepository itemRepository, ProductService productService) {
        this.itemRepository = itemRepository;
        this.productService = productService;
    }

    public ItemDTO saveItem(ItemDTO dto) {
        Item item = itemRepository.countAllItemsByProductId(dto.getProduct().getId());
        if (item != null) {
            dto.setId(item.getId());
            dto.setItemCount(item.getItemCount() + 1);
        }
        return convertToDTO(itemRepository.save(convertToEntity(dto)));
    }

    public ItemDTO updateItem(ItemDTO dto) {
        return convertToDTO(itemRepository.save(convertToEntity(dto)));
    }

    public List<ItemDTO> retrieveItemsByBagId(int bagId) {
        List<ItemDTO> dtoItemsList = new ArrayList<>();
        List<Item> itemsList = itemRepository.findItemsByBagID(bagId);
        for (Item it : itemsList) {
            dtoItemsList.add(convertToDTO(it));
        }
        return dtoItemsList;
    }

    public void deleteItem(ItemDTO dto) {
        itemRepository.delete(convertToEntity(dto));
    }


    @Override
    public Item convertToEntity(ItemDTO dto) {
        Item item = new Item();
        item.setId((dto.getId()));
        item.setItemCount(dto.getItemCount());

        if (dto.getProduct() != null) {
            item.setProduct(productService.convertToEntity(dto.getProduct()));
        }
        if (dto.getBag() != null) {
            Bag bagEntity = new Bag();
            double totalPrice = 0;
            int totalItems = 0;

            bagEntity.setId(dto.getBag().getId());
            bagEntity.setTotalPrice(totalPrice);
            bagEntity.setTotalItems(totalItems);
            item.setBag(bagEntity);

        }
        return item;
    }

    @Override
    public ItemDTO convertToDTO(Item entity) {
        ItemDTO dto = new ItemDTO();
        dto.setId((entity.getId()));
        dto.setItemCount(entity.getItemCount());
        if (entity.getProduct() != null) {
            dto.setProduct(productService.convertToDTO(entity.getProduct()));
        }
        if (entity.getBag() != null) {
            BagDTO bagDto = new BagDTO();
            double totalPrice = 0;
            int totalItems = 0;
            bagDto.setId(entity.getBag().getId());
            bagDto.setTotalPrice(totalPrice);
            bagDto.setItemCount(totalItems);

            dto.setBag(bagDto);
        }
        return dto;
    }
}
