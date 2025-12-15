package com.ecommerce.sportcenter.service;

import com.ecommerce.sportcenter.entity.Type;
import com.ecommerce.sportcenter.model.TypeResponse;
import com.ecommerce.sportcenter.repository.TypeRepository;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class TypeServiceImpl implements TypeService{

    private final TypeRepository typeRepository;

    public TypeServiceImpl(TypeRepository typeRepository) {
        this.typeRepository = typeRepository;
    }

    @Override
    public List<TypeResponse> getAllTypes() {
        List<Type> types = typeRepository.findAll();

        List<TypeResponse> typeResponses = types.stream()
                .map(this::mapToTypeResponse)
                .collect(Collectors.toList());

        return typeResponses;
    }

    private TypeResponse mapToTypeResponse(Type type) {
        return TypeResponse.builder()
                .id(type.getId())
                .name(type.getName())
                .build();
    }
}
