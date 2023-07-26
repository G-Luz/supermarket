package com.gluz.supermaket.item.controller;

import com.gluz.supermaket.item.controller.dto.ItemDTO;
import com.gluz.supermaket.item.service.ItemService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/v1/items")
public class ItemController {

    public ItemService itemService;

    public ItemController(ItemService itemService) {
        this.itemService = itemService;
    }

    @PostMapping
    public ResponseEntity<ItemDTO> saveItem(@RequestBody ItemDTO dto) {
        return ResponseEntity.ok().body(itemService.saveItem(dto));
    }

    @GetMapping(params = "bagId")
    public ResponseEntity<List<ItemDTO>> saveItem(@RequestParam int bagId) {
        return ResponseEntity.ok().body(itemService.retrieveItemsByBagId(bagId));
    }

    @PutMapping
    public ResponseEntity<ItemDTO> updateItem(@RequestBody ItemDTO dto) {
        return ResponseEntity.ok().body(itemService.updateItem(dto));
    }

    @DeleteMapping
    public ResponseEntity<String> deleteItem(@RequestBody ItemDTO dto) {
        itemService.deleteItem(dto);
        return ResponseEntity.ok().body("Item excluído com sucesso!");
    }
}
