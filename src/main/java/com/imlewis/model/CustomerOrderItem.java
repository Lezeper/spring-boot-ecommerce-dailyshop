package com.imlewis.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class CustomerOrderItem implements Serializable{

    private static final long serialVersionUID = 8892553931694642183L;

    @Id
    @GeneratedValue
    private Long customerOrderItemId;

    private Long productId;
    private int productQuantity;
    private double productPrice;
    private String productName;

    @ManyToOne
    @JoinColumn(name = "customerOrderId")
    private CustomerOrder customerOrder;

    public Long getCustomerOrderItemId() {
        return customerOrderItemId;
    }

    public void setCustomerOrderItemId(Long customerOrderItemId) {
        this.customerOrderItemId = customerOrderItemId;
    }

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(double productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public CustomerOrder getCustomerOrder() {
        return customerOrder;
    }

    public void setCustomerOrder(CustomerOrder customerOrder) {
        this.customerOrder = customerOrder;
    }
}
