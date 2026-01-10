package com.ecommerce.sportcenter.controller;

import com.ecommerce.sportcenter.dto.response.TypeResponse;
import com.ecommerce.sportcenter.service.TypeService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/types")
public class TypeController {

    private final TypeService typeService;

    public TypeController(TypeService typeService) {
        this.typeService = typeService;
    }

    @GetMapping
    public List<TypeResponse> getAllBrands(){
        return typeService.getAllTypes();

    }

}
