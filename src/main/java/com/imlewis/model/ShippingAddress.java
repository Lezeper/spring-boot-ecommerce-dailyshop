package com.imlewis.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
public class ShippingAddress implements Serializable {

    private static final long serialVersionUID = 921227846105947776L;

    @Id
    @GeneratedValue
    private Long addressId;
    @NotEmpty(message="Please fill in your name")
    private String fullName;
    @NotEmpty(message="Please fill in your phone number")
    private String phoneNumber;
    @NotEmpty(message="Address can not be null")
    private String address;
    @NotEmpty(message="City can not be null")
    private String city;
    @NotEmpty(message="State can not be null")
    private String state;
    @NotEmpty(message="Country can not be null")
    private String country;
    @NotEmpty(message="ZipCode can not be null")
    private String zipCode;
    private boolean isDefault;

    @ManyToOne
    @JoinColumn(name = "customerId")
    private Customer customer;

    public Long getAddressId() {
        return addressId;
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

	public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public boolean getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(boolean isDefault) {
        this.isDefault = isDefault;
    }

	public void setDefault(boolean isDefault) {
		this.isDefault = isDefault;
	}

	public String toString(boolean isShipping) {
        if (isShipping){
            return "shippingAddress{" +
                    "fullName='" + fullName + '\'' +
                    ", address='" + address + '\'' +
                    ", city='" + city + '\'' +
                    ", state='" + state + '\'' +
                    ", country='" + country + '\'' +
                    ", zipCode='" + zipCode + '\'' +
                    ", phoneNumber='" + phoneNumber + '\'' +
                    '}';
        }else{
            return "billingAddress{" +
                    "fullName='" + fullName + '\'' +
                    ", address='" + address + '\'' +
                    ", city='" + city + '\'' +
                    ", state='" + state + '\'' +
                    ", country='" + country + '\'' +
                    ", zipCode='" + zipCode + '\'' +
                    ", phoneNumber='" + phoneNumber + '\'' +
                    '}';
        }
    }
}
