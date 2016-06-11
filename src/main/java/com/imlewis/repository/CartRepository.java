package com.imlewis.repository;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;

import com.imlewis.model.Cart;

@Transactional
public interface CartRepository extends CrudRepository<Cart, Long>{
	
}
