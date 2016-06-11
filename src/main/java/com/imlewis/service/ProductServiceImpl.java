package com.imlewis.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imlewis.model.Category;
import com.imlewis.model.Product;
import com.imlewis.repository.CategoryRepository;
import com.imlewis.repository.ProductRepository;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductRepository productRepository;
	@Autowired
	private CategoryRepository categoryRepository;
	
	public void getVisited(Long productId){
		Product product = productRepository.findOne(productId);
		product.setProductViews(product.getProductViews()+1);
		productRepository.save(product);
	}
	
	public List<Product> getProductsByMainCategory(String mainCategoryName){
		List<Category> categoryList = categoryRepository.findAllByMainCategoryName(mainCategoryName); 
		List<Product> products = new ArrayList<Product>();
		for(Category category: categoryList){
			for(Product product : category.getProducts()){
				products.add(product);
			}
		}
		return products;
	}
	
	public List<Product> sort(List<Product> products, String sortType){
		// 0: Price ASC, 1: Price DESC
		if(sortType.equals("0")){
			Collections.sort(products, Product.Comparators.PRICE);
		}
		if(sortType.equals("1")){
			Collections.sort(products, Product.Comparators.PRICE);
			Collections.reverse(products);
		}
		return products;
	}
	
	public List<Product> getProductsByCategory(Category category){
		return productRepository.findAllByProductCategory(category);
	}
	
	public List<Product> getAllProducts(){
		return (List<Product>) productRepository.findAll();
	}
	
	public Product getProductById(Long productId){
		return productRepository.findOne(productId);
	}
	public void save(Product product){
		productRepository.save(product);
	}
	
	public void delete(Long productId){
		productRepository.delete(productId);
	}
}
