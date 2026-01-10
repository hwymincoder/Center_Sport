package com.ecommerce.sportcenter.controller;

import com.ecommerce.sportcenter.dto.response.BrandResponse;
import com.ecommerce.sportcenter.service.BrandService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/brands")
public class BrandController {

    private final BrandService brandService;

    public BrandController(BrandService brandService) {
        this.brandService = brandService;
    }

    @GetMapping
    public List<BrandResponse> getAllBrands(){
        List<BrandResponse> brandResponses = brandService.getAllBrands();

        return brandResponses;
    }

}
