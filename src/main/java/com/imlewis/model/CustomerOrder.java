package com.imlewis.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class CustomerOrder implements Serializable{

    private static final long serialVersionUID = 584092333516618686L;

    @Id
    @GeneratedValue
    private Long customerOrderId;

    private double orderTotalPrice;
    
    @Column(columnDefinition="DATETIME")
    private Date orderDate;
    
    @OneToOne
    @JoinColumn(name = "addressId")
    @JsonIgnore
    private CustomerOrderShippingAddress customerOrderShippingAddress;

    @ManyToOne
    @JoinColumn(name = "customerId")
    private Customer customer;

    @OneToMany(mappedBy = "customerOrder", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private List<CustomerOrderItem> customerOrderItems;

    public Long getCustomerOrderId() {
        return customerOrderId;
    }

    public void setCustomerOrderId(Long customerOrderId) {
        this.customerOrderId = customerOrderId;
    }

    public double getOrderTotalPrice() {
        return orderTotalPrice;
    }

    public void setOrderTotalPrice(double orderTotalPrice) {
        this.orderTotalPrice = orderTotalPrice;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

	public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public List<CustomerOrderItem> getCustomerOrderItems() {
        return customerOrderItems;
    }

    public void setCustomerOrderItems(List<CustomerOrderItem> customerOrderItems) {
        this.customerOrderItems = customerOrderItems;
    }

	public CustomerOrderShippingAddress getCustomerOrderShippingAddress() {
		return customerOrderShippingAddress;
	}

	public void setCustomerOrderShippingAddress(CustomerOrderShippingAddress customerOrderShippingAddress) {
		this.customerOrderShippingAddress = customerOrderShippingAddress;
	}
}
