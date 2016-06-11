package com.imlewis.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.imlewis.model.Code;
import com.imlewis.model.Customer;

public interface CodeRepository extends CrudRepository<Code, Long>{
	
	List<Code> findByCodeTypeAndCustomer(int codeType, Customer customer);
	
	Code findByCodeStr(String codeStr);
}
