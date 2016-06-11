package com.imlewis.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.imlewis.model.Cart;
import com.imlewis.model.Code;
import com.imlewis.model.Customer;
import com.imlewis.model.Role;
import com.imlewis.repository.CartRepository;
import com.imlewis.repository.CustomerRepository;
import com.imlewis.repository.RoleRepository;

@Service
public class CustomerServiceImpl implements CustomerService{
	@Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private CartRepository cartRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private CodeService codeService;

    public void save(Customer customer) {
        customer.setPassword(passwordEncoder.encode(customer.getPassword()));
    	// save or update
    	if(customer.getCustomerId() == null){
    		Cart cart = new Cart();
    		Role role = new Role();
        	role.setEmail(customer.getEmail());
        	role.setAuthority("ROLE_UNAUTH");
        	role.setCustomer(customer);
        	// create customer first
        	customerRepository.save(customer);
        	// save cart
        	cart.setCustomer(customer);
        	cartRepository.save(cart);
        	// update cartId in Customer
        	customer.setCart(cart);
        	customer.setEnabled(true);
        	customerRepository.save(customer);
        	// save role
        	roleRepository.save(role);
        	// generate active code
        	Code code = new Code();
        	code.setCodeDate(new Date());
        	code.setCodeType(0);
        	code.setCustomer(customer);
        	
        	codeService.save(code);
    	}else{
    		customerRepository.save(customer);
    	}
    }
    
    public void activeAccount(String codeStr){
    	Code code = codeService.findByCodeStr(codeStr);
    	if(code != null){
        	Customer customer = code.getCustomer();
        	Role role = new Role();
        	role.setAuthority("ROLE_USER");
        	role.setCustomer(customer);
        	role.setEmail(customer.getEmail());
        	roleRepository.save(role);
        	// delete role UNAUTH
        	roleRepository.delete(roleRepository.findByAuthorityAndCustomer("ROLE_UNAUTH", customer));
        	// delete active code
        	codeService.delete(code);
    	}
    }
    
    public Customer findByEmail(String email){
    	return customerRepository.findByEmail(email);
    }
    
    public Customer findOne(Long customerId){
    	return customerRepository.findOne(customerId);
    }
    
    public boolean hasRole(String role, Customer customer){
    	return (roleRepository.findByAuthorityAndCustomer(role, customer) != null);
    }
    
    public List<Customer> getAllCustomer(){
    	return (List<Customer>) customerRepository.findAll();
    }
    
    public void delete(Long customerId){
    	customerRepository.delete(customerId);
    }
}
