package com.imlewis.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.imlewis.model.Category;

public interface CategoryRepository extends CrudRepository<Category, Long>{
	
	List<Category> findAllByMainCategoryName(String mainCategoryName);
	
	List<Category> findAllBySubCategoryName(String subCategoryName);
	
	@Query(value = "SELECT DISTINCT sub_category_name from category" , nativeQuery = true)
	List<String> findAllSubCategoryName();
	
	@Query(value = "SELECT DISTINCT main_category_name from category" , nativeQuery = true)
	List<String> findAllMainCategoryName();
}
