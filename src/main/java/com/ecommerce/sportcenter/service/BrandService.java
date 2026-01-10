package com.ecommerce.sportcenter.service;

import com.ecommerce.sportcenter.dto.response.BrandResponse;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface BrandService {
    List<BrandResponse> getAllBrands();
}
