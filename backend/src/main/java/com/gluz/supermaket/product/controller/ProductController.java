package com.gluz.supermaket.product.controller;

import com.gluz.supermaket.product.controller.dto.ProductDTO;
import com.gluz.supermaket.product.service.ProductService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/v1/products")
public class ProductController {

    private ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @PostMapping
    public ResponseEntity<ProductDTO> addNewProduct(@RequestBody ProductDTO dto) {
        try {
            ProductDTO productDTO = productService.saveNewProduct(dto);
            return ResponseEntity.ok().body(productDTO);
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }

    }

    @GetMapping
    public ResponseEntity<List<ProductDTO>> retrieveAllProducts() {
        try {
            return ResponseEntity.ok().body(productService.findAllProducts());
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @GetMapping(path = "/activeByCategory")
    public ResponseEntity<List<ProductDTO>> findActiveProductsByCategory(@RequestParam String category) {
        try {
            return ResponseEntity.ok().body(productService.findActiveProductByCategory(category));
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @GetMapping(params = "category")
    public ResponseEntity<List<ProductDTO>> findProductsOnlyByCategory(@RequestParam String category) {
        try {
            return ResponseEntity.ok().body(productService.findProductsByCategory(category));
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @GetMapping(params = "id")
    public ResponseEntity<ProductDTO> findProductsByID(@RequestParam Long id) {
        try {
            return ResponseEntity.ok().body(productService.findProductsByID(id));
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @PutMapping(params = "id")
    public ResponseEntity<ProductDTO> updateProduct(@RequestParam Long id, @RequestBody ProductDTO productDTO) {
        try {
            return ResponseEntity.ok().body(productService.updateProduct(id, productDTO));
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

    @DeleteMapping(params = "id")
    public ResponseEntity<String> disableProduct(@RequestParam Long id) {
        try {
            return ResponseEntity.ok().body(productService.deleteProduct(id));
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }


    @GetMapping(path = "/filter")
    public ResponseEntity<List<ProductDTO>> findProductsByFilter(@RequestParam String category, @RequestParam String filter) {
        try {
            return ResponseEntity.ok().body(productService.findProductByNameOrDescription(category, filter));
        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }
}
