package com.ecommerce.sportcenter.repository;

import com.ecommerce.sportcenter.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
    // api : /page => thêm JpaSpecificationExecutor<Product> để hỗ trợ phân trang với các tiêu chí động
}
