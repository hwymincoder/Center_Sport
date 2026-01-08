package com.ecommerce.sportcenter.controller;

import com.ecommerce.sportcenter.model.ProductResponse;
import com.ecommerce.sportcenter.service.BrandService;
import com.ecommerce.sportcenter.service.ProductService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/products")
public class ProductController {

    private final ProductService productService;
    private final BrandService brandService;

    public ProductController(ProductService productService, BrandService brandService) {
        this.productService = productService;
        this.brandService = brandService;
    }

    @GetMapping
    public ResponseEntity<Map<String, Object>> getAllProducts(
            @RequestParam(name = "page", defaultValue = "0") int page,
            @RequestParam(name = "size", defaultValue = "10") int size,
            @RequestParam(name = "keyword", required = false) String keyword,
            @RequestParam(name = "brandId", required = false) Integer brandId,
            @RequestParam(name = "typeId", required = false) Integer typeId,
            @RequestParam(name = "sort", defaultValue = "id") String sort,
            @RequestParam(name = "order" , defaultValue = "asc") String order
    ){

        Sort.Direction sortDirection = order.equalsIgnoreCase("desc") ? Sort.Direction.DESC : Sort.Direction.ASC;
        Sort sortOrder = Sort.by(sortDirection, sort);

        Pageable pageable = PageRequest.of(page, size, sortOrder);

        Page<ProductResponse> productResponse = productService.getAllProducts(pageable, brandId, typeId, keyword);

        Map<String, Object> response = new HashMap<>();

        response.put("currentPage", productResponse.getNumber());
        response.put("totalItems", productResponse.getTotalElements());
        response.put("totalPages", productResponse.getTotalPages());
        response.put("data", productResponse);

        return ResponseEntity.ok(response);
    }



}
