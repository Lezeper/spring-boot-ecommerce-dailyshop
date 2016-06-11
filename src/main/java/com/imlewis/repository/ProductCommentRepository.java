package com.imlewis.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.imlewis.model.Product;
import com.imlewis.model.ProductComment;

public interface ProductCommentRepository extends CrudRepository<ProductComment, Long>{
	List<ProductComment> findByProduct(Product product);
}
