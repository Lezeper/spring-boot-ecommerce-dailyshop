package com.imlewis.repository;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;

import com.imlewis.model.Customer;

@Transactional
public interface CustomerRepository extends CrudRepository<Customer, Long>{
	
	Customer findByEmail(String email);
	
}
