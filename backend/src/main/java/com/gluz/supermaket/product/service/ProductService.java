package com.gluz.supermaket.product.service;

import com.gluz.supermaket.product.domain.Product;
import com.gluz.supermaket.product.controller.dto.ProductDTO;
import com.gluz.supermaket.product.repository.ProductRepository;
import com.gluz.supermaket.utils.ConvertEntities;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProductService implements ConvertEntities<ProductDTO, Product> {

    private ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public ProductDTO saveNewProduct(ProductDTO dto) {
        Product product =
                productRepository.saveAndFlush(convertToEntity(dto));
        return convertToDTO(product);
    }

    public List<ProductDTO> findAllProducts() {
        List<ProductDTO> dtoList = new ArrayList<>();
        List<Product> products =
                productRepository.findAll();
        for (Product it : products) {
            dtoList.add(convertToDTO(it));
        }
        return dtoList;
    }


    public ProductDTO findProductsByID(Long id) {
        Product product =
                productRepository.findById(id).get();
        return convertToDTO(product);
    }

    public ProductDTO updateProduct(Long id, ProductDTO dto) {
        dto.setId(id);
        Product product =
                productRepository.save(convertToEntity(dto));
        return convertToDTO(product);
    }

    public String deleteProduct(Long id) {
        Product product = productRepository.findById(id).get();
        product.setEnable(false);
        productRepository.saveAndFlush(product);
        return "Produto desativado com sucesso!";
    }

    public List<ProductDTO> findProductsByCategory(String category) {
        List<ProductDTO> dtoList = new ArrayList<>();
        List<Product> products =
                productRepository.findProductsByCategory(category);
        for (Product it : products) {
            dtoList.add(convertToDTO(it));
        }
        return dtoList;
    }

    public List<ProductDTO> findActiveProductByCategory(String category) {
        List<ProductDTO> dtoList = new ArrayList<>();
        List<Product> products =
                productRepository.findActiveProductsByCategory(category);
        for (Product it : products) {
            dtoList.add(convertToDTO(it));
        }
        return dtoList;
    }

    public List<ProductDTO> findProductByNameOrDescription(String category, String filter) {
        List<ProductDTO> dtoList = new ArrayList<>();
        List<Product> products =
                productRepository.findCategoryProductByNameOrDescription(category, filter);
        for (Product it : products) {
            dtoList.add(convertToDTO(it));
        }
        return dtoList;
    }

    @Override
    public Product convertToEntity(ProductDTO dto) {
        Product product = new Product();
        product.setId(dto.getId());
        product.setName(dto.getName());
        product.setBase64Image(dto.getBase64Image());
        product.setCategory(dto.getCategory());
        product.setPrice(dto.getPrice());
        product.setEnable(dto.isEnable());
        product.setRating(dto.getRating());
        product.setDescription(dto.getDescription());
        return product;
    }

    @Override
    public ProductDTO convertToDTO(Product entity) {
        ProductDTO productDTO = new ProductDTO();
        productDTO.setId(entity.getId());
        productDTO.setName(entity.getName());
        productDTO.setPrice(entity.getPrice());
        productDTO.setDescription(entity.getDescription());
        productDTO.setCategory(entity.getCategory());
        productDTO.setEnable(entity.isEnable());
        productDTO.setRating(entity.getRating());
        productDTO.setBase64Image(entity.getBase64Image());
        return productDTO;
    }
}
