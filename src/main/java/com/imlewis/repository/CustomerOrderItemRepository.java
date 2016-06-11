package com.imlewis.repository;

import org.springframework.data.repository.CrudRepository;

import com.imlewis.model.CustomerOrderItem;

public interface CustomerOrderItemRepository extends CrudRepository <CustomerOrderItem, Long>{

}
