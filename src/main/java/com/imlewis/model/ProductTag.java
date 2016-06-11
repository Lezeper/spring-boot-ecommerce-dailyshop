package com.imlewis.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class ProductTag implements Serializable{
	
	private static final long serialVersionUID = 6771981048033259765L;

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long tagId;

    @NotEmpty(message = "Can not be null")
    private String tagContents;
    
    @ManyToOne
    @JoinColumn(name = "productId")
    private Product product;

	public Long getTagId() {
		return tagId;
	}

	public void setTagId(Long tagId) {
		this.tagId = tagId;
	}

	public String getTagContents() {
		return tagContents;
	}

	public void setTagContents(String tagContents) {
		this.tagContents = tagContents;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
}
