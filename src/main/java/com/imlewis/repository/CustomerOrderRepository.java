package com.imlewis.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.imlewis.model.Customer;
import com.imlewis.model.CustomerOrder;

public interface CustomerOrderRepository extends CrudRepository<CustomerOrder, Long>{

	List<CustomerOrder> findAllByCustomer(Customer customer);
}
