package com.imlewis.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class CustomerOrderShippingAddress implements Serializable {
	
	private static final long serialVersionUID = 9001223266668134199L;

	@Id
    @GeneratedValue
    private Long addressId;
    private String fullName;
    private String phoneNumber;
    private String address;
    private String city;
    private String state;
    private String country;
    private String zipCode;
    private Long originalShippingAddressId;

    @OneToOne
    @JoinColumn(name = "customerOrderId")
    @JsonIgnore
    private CustomerOrder customerOrder;

	public Long getAddressId() {
		return addressId;
	}

	public Long getOriginalShippingAddressId() {
		return originalShippingAddressId;
	}

	public void setOriginalShippingAddressId(Long originalShippingAddressId) {
		this.originalShippingAddressId = originalShippingAddressId;
	}

	public void setAddressId(Long addressId) {
		this.addressId = addressId;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public CustomerOrder getCustomerOrder() {
		return customerOrder;
	}

	public void setCustomerOrder(CustomerOrder customerOrder) {
		this.customerOrder = customerOrder;
	}
    
    
}
