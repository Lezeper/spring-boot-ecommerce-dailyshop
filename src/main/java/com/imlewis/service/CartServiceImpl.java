package com.imlewis.service;

import java.io.IOException;
import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imlewis.model.Cart;
import com.imlewis.model.CartItem;
import com.imlewis.repository.CartItemRepository;
import com.imlewis.repository.CartRepository;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartRepository cartRepository;
	@Autowired
	private CustomerOrderService customerOrderService;
	@Autowired
	private CartItemRepository cartItemRepository;
	
	public Cart getCartByCartId(Long cartId){
		return cartRepository.findOne(cartId);
	}
	
	public void update(Cart cart){
        double grandTotal = customerOrderService.getCustomerOrderGrandTotalByCart(cart);
        Double truncatedDouble = new BigDecimal(grandTotal)
                .setScale(3, BigDecimal.ROUND_HALF_UP)
                .doubleValue();
        cart.setGrandTotal(truncatedDouble);

        cartRepository.save(cart);
    }
	
	public Cart validate(Object cartId) throws IOException{
		if(cartId == null){
			throw new IOException("Please Login.");
		}

		Cart cart = cartRepository.findOne((Long) cartId);
		if(cart == null || cart.getCartItems().size() == 0){
			throw new IOException("cart null or cartItem size == 0.c");
		}
		update(cart);
		return cart;
	}
	
	public void emptyCart(Cart cart){
		for(CartItem cartItem : cart.getCartItems()){
			cartItemRepository.delete(cartItem);
		}
		cart.setGrandTotal(0);
		cartRepository.save(cart);
	}
	
	public void save(Cart cart){
		cartRepository.save(cart);
	}

}
