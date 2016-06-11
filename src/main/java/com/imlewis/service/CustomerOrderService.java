package com.imlewis.service;

import java.io.IOException;
import java.util.List;

import com.imlewis.model.Cart;
import com.imlewis.model.Customer;
import com.imlewis.model.CustomerOrder;
import com.imlewis.model.CustomerOrderShippingAddress;

public interface CustomerOrderService {
	
	double getCustomerOrderGrandTotalByCart(Cart cart);
	
	void addOrderDumpCart(CustomerOrderShippingAddress customerOrderShippingAddress, CustomerOrder customerOrder, Cart cart) throws IOException;
	
	List<CustomerOrder> getAllCustomerOrderByCustomer(Customer customer);
}
