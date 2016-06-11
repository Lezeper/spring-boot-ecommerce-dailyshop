package com.imlewis.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.imlewis.model.Category;
import com.imlewis.model.ProductTag;

public interface ProductTagRepository extends CrudRepository<ProductTag, Long>{
	
//	@Query(value = "SELECT DISTINCT tag_contents from product_tag" , nativeQuery = true)
//	List<ProductTag> findAllTags();
}
