package com.imlewis.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Customer implements Serializable {

    private static final long serialVersionUID = -1836726872479056197L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long customerId;

    @NotEmpty (message = "Email can not be blank")
    private String email;

    @NotEmpty (message = "Password can not be blank")
    private String password;

    @NotEmpty (message = "Name can not be blank")
    private String customerName;
    
    @Column(columnDefinition="DATETIME")
    private Date registerDate;

    private boolean enabled;

    @OneToOne
    @JoinColumn(name = "cartId")
    @JsonIgnore
    private Cart cart;
    
    @OneToMany(mappedBy = "customer")
    private List<Role> roles;
    
    @OneToMany(mappedBy = "customer")
    private List<ProductComment> productComments;
    
    @OneToMany(mappedBy = "customer", cascade = CascadeType.REMOVE, fetch = FetchType.LAZY)
    private List<ShippingAddress> shippingAddresses;
    
    @OneToMany(mappedBy = "customer")
    private List<Code> codes;

	public Long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public List<ProductComment> getProductComments() {
		return productComments;
	}

	public void setProductComments(List<ProductComment> productComments) {
		this.productComments = productComments;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Cart getCart() {
		return cart;
	}

	public Date getRegisterDate() {
		return registerDate;
	}

	public void setRegisterDate(Date registerDate) {
		this.registerDate = registerDate;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public List<ShippingAddress> getShippingAddresses() {
		return shippingAddresses;
	}

	public void setShippingAddresses(List<ShippingAddress> shippingAddresses) {
		this.shippingAddresses = shippingAddresses;
	}

	public List<Code> getCodes() {
		return codes;
	}

	public void setCodes(List<Code> codes) {
		this.codes = codes;
	}

}
