package com.ecommerce.sportcenter.service;

import com.ecommerce.sportcenter.model.TypeResponse;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface TypeService {
    List<TypeResponse> getAllTypes();
}
