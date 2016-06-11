package com.imlewis.service;

import java.util.List;

import com.imlewis.model.Category;
import com.imlewis.model.Product;

public interface ProductService {
	
	void getVisited(Long productId);
	
	List<Product> getProductsByMainCategory(String mainCategoryName);
	
	List<Product> getProductsByCategory(Category category);
	
	List<Product> getAllProducts();
	
	Product getProductById(Long productId);
	
	void save(Product product);
	
	void delete(Long productId);
	
	List<Product> sort(List<Product> products, String sortType);
}
