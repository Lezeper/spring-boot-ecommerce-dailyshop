package com.imlewis.repository;

import javax.transaction.Transactional;

import org.springframework.data.repository.CrudRepository;

import com.imlewis.model.CartItem;

@Transactional
public interface CartItemRepository extends CrudRepository<CartItem, Long>{

}
