package com.ecommerce.sportcenter.service;

import com.ecommerce.sportcenter.entity.Product;
import com.ecommerce.sportcenter.dto.response.ProductResponse;
import com.ecommerce.sportcenter.repository.ProductRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;


@Service
public class ProductServiceImpl implements ProductService {

    private final ProductRepository productRepository;

    public ProductServiceImpl(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @Override
    public ProductResponse getProductById(Integer id) {
        Product product = productRepository.findById(id).orElseThrow(() -> new RuntimeException("Product not found with id: " + id));
        return toConvertResponse(product);
    }

    private ProductResponse toConvertResponse(Product product) {
        return ProductResponse.builder()
                .id(product.getId())
                .name(product.getName())
                .description(product.getDescription())
                .price(product.getPrice())
                .pictureUrl(product.getPictureUrl())
                .productBrand(product.getBrand() != null ? product.getBrand().getName() : null)
                .productType(product.getType() != null ? product.getType().getName() : null)
                .build();
    }

    @Override
    public Page<ProductResponse> getAllProducts(Pageable pageable, Integer brandId, Integer typeId, String search) {

        Specification<Product> spec = (root, query, cb) -> cb.conjunction();

        if(brandId != null){
            spec = spec.and(((root, query, criteriaBuilder) ->  criteriaBuilder.equal(root.get("brand").get("id"), brandId)));
        }

        if(typeId != null){
            spec = spec.and(((root, query, criteriaBuilder) ->  criteriaBuilder.equal(root.get("type").get("id"), typeId)));
        }

        if(search != null && !search.isEmpty()){
            spec = spec.and(((root, query, criteriaBuilder) ->  criteriaBuilder.like(root.get("name"), "%" + search + "%")));
        }


        return productRepository.findAll(spec, pageable)
                .map(this::toConvertResponse);

    }

}
