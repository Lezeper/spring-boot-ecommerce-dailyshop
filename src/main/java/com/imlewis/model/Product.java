package com.imlewis.model;

import java.io.Serializable;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Transient;
import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;


@Entity
public class Product implements Serializable, Comparable<Product>{

    private static final long serialVersionUID = -6989243970039135205L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long productId; // MySQL only accept Long or integer ID, can't be String type

    @NotEmpty(message = "The name must not be null")
    @Length(max = 255, message = "The field must be less than 255 characters")
    private String productName;
    
    @Length(max = 255, message = "The field must be less than 255 characters")
    private String productSummary;
    
    @Length(max = 255, message = "The field must be less than 255 characters")
    private String productTagsW;
    
    @Column(columnDefinition = "TEXT")
    private String productDescription;
    
    @Column(columnDefinition="DATETIME")
    private Date productDate;
    
    @Column(name = "productViews", nullable = false, columnDefinition = "bigint(20) default 0")
    private long productViews = 0;

    @Min(value = 0, message = "Product price must no be less then zero.")
    private double productPrice;
    
    @NotEmpty(message = "Condition must not be null")
    private String productCondition;

    @Min(value = 0, message = "Product unit must no be less then zero.")
    private int unitInStock;

    @Transient
    private MultipartFile productImage;

    @OneToMany(mappedBy = "product")
    @JsonIgnore
    private List<CartItem> cartItemList;

    @OneToMany(mappedBy = "product")
    @JsonIgnore
    private List<ProductComment> productCommentList;
    
    @ManyToOne
    @JoinColumn(name = "categoryId")
    private Category productCategory;
    
    @OneToMany(mappedBy = "product")
    @JsonIgnore
    private List<ProductTag> productTags;

    /******************* Comparator ************************/
    @Override
	public int compareTo(Product product){
		return new Double(this.getProductPrice()).compareTo(product.getProductPrice());
	}
    
    public static class Comparators {
    	public static Comparator<Product> PRICE = new Comparator<Product>(){
    		@Override
    		public int compare(Product p1, Product p2){
    			return new Double(p1.getProductPrice()).compareTo(p2.getProductPrice());
    		}
    	};
    	public static Comparator<Product> VIEWS = new Comparator<Product>(){
    		@Override
    		public int compare(Product p1, Product p2){
    			return new Long(p1.getProductViews()).compareTo(p2.getProductViews());
    		}
    	};
    	public static Comparator<Product> DATE = new Comparator<Product>(){
    		@Override
    		public int compare(Product p1, Product p2){
    			return (p1.getProductDate().after(p2.getProductDate())) ? 0:1;
    		}
    	};
    }
    /******************* Getter/Setter ************************/
	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductTagsW() {
		return productTagsW;
	}

	public void setProductTagsW(String productTagsW) {
		this.productTagsW = productTagsW;
	}

	public String getProductSummary() {
		return productSummary;
	}

	public void setProductSummary(String productSummary) {
		this.productSummary = productSummary;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public Date getProductDate() {
		return productDate;
	}

	public void setProductDate(Date productDate) {
		this.productDate = productDate;
	}

	public long getProductViews() {
		return productViews;
	}

	public void setProductViews(long productViews) {
		this.productViews = productViews;
	}

	public double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductCondition() {
		return productCondition;
	}

	public void setProductCondition(String productCondition) {
		this.productCondition = productCondition;
	}

	public int getUnitInStock() {
		return unitInStock;
	}

	public void setUnitInStock(int unitInStock) {
		this.unitInStock = unitInStock;
	}

	public MultipartFile getProductImage() {
		return productImage;
	}

	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}

	public List<CartItem> getCartItemList() {
		return cartItemList;
	}

	public void setCartItemList(List<CartItem> cartItemList) {
		this.cartItemList = cartItemList;
	}

	public List<ProductComment> getProductCommentList() {
		return productCommentList;
	}

	public void setProductCommentList(List<ProductComment> productCommentList) {
		this.productCommentList = productCommentList;
	}

	public Category getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(Category productCategory) {
		this.productCategory = productCategory;
	}

	public List<ProductTag> getProductTags() {
		return productTags;
	}

	public void setProductTags(List<ProductTag> productTags) {
		this.productTags = productTags;
	}
}
