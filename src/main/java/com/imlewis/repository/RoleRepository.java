package com.imlewis.repository;

import org.springframework.data.repository.CrudRepository;

import com.imlewis.model.Customer;
import com.imlewis.model.Role;

public interface RoleRepository extends CrudRepository<Role, Long>{
	Role findByAuthorityAndCustomer(String auth, Customer customer);
}
