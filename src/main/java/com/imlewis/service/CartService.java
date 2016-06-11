package com.imlewis.service;

import java.io.IOException;

import com.imlewis.model.Cart;

public interface CartService {
	
	Cart validate(Object customerId) throws IOException;
	
	void emptyCart(Cart cart);
	
	void save(Cart cart);
}
