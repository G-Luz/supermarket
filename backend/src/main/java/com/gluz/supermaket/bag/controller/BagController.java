package com.gluz.supermaket.bag.controller;

import com.gluz.supermaket.bag.controller.dto.BagDTO;
import com.gluz.supermaket.bag.service.BagService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping(path = "/v1/bags")
public class BagController {

    public BagService bagService;

    public BagController(BagService bagService) {
        this.bagService = bagService;
    }

    @PostMapping
    public ResponseEntity<BagDTO> saveBag(@RequestBody BagDTO dto) {
        return ResponseEntity.ok().body(bagService.saveBagItems(dto));
    }

    @GetMapping(params = "id")
    public ResponseEntity<Optional<BagDTO>> fetchUserBag(@RequestParam int id) {
        return ResponseEntity.ok().body(bagService.fetchBagByUser(id));
    }
}
