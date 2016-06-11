package com.imlewis.repository;

import org.springframework.data.repository.CrudRepository;

import com.imlewis.model.CustomerOrderShippingAddress;

public interface CustomerOrderShippingAddressRepository 
					extends CrudRepository <CustomerOrderShippingAddress, Long> {

}
