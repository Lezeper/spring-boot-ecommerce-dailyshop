package com.imlewis.service;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imlewis.model.Cart;
import com.imlewis.model.CartItem;
import com.imlewis.model.Customer;
import com.imlewis.model.CustomerOrder;
import com.imlewis.model.CustomerOrderItem;
import com.imlewis.model.CustomerOrderShippingAddress;
import com.imlewis.model.ShippingAddress;
import com.imlewis.repository.CartItemRepository;
import com.imlewis.repository.CustomerOrderItemRepository;
import com.imlewis.repository.CustomerOrderRepository;
import com.imlewis.repository.CustomerOrderShippingAddressRepository;
import com.imlewis.repository.ShippingAddressRepository;

@Service
public class CustomerOrderServiceImpl implements CustomerOrderService{
	
	@Autowired
    private CartService cartService;
    @Autowired
    private CustomerOrderRepository customerOrderRepository;
    @Autowired
    private CustomerOrderShippingAddressRepository customerOrderShippingAddressRepository;
    @Autowired
    private ShippingAddressRepository shippingAddressRepository;
    @Autowired
    private CustomerOrderItemRepository customerOrderItemRepository;
    @Autowired
    private CartItemRepository cartItemRepository;
	
	public double getCustomerOrderGrandTotalByCart(Cart cart) {
        double grandTotal = 0;
        List<CartItem> cartItems = cart.getCartItems();

        for (CartItem item : cartItems) {
            grandTotal += item.getTotalPriceDouble();
        }

        return grandTotal;
    }
	
	public void addOrderDumpCart(CustomerOrderShippingAddress customerOrderShippingAddress,
									CustomerOrder customerOrder, Cart cart) throws IOException{
		
		if(customerOrderShippingAddress == null || customerOrder == null || cart == null){
			throw new IOException();
		}
		// initiate customerOrderShippingAddress
		ShippingAddress shippingAddress = shippingAddressRepository.findOne(customerOrderShippingAddress.getOriginalShippingAddressId());
		customerOrderShippingAddress.setAddress(shippingAddress.getAddress());
		customerOrderShippingAddress.setCity(shippingAddress.getCity());
		customerOrderShippingAddress.setCountry(shippingAddress.getCountry());
		customerOrderShippingAddress.setFullName(shippingAddress.getFullName());
		customerOrderShippingAddress.setPhoneNumber(shippingAddress.getPhoneNumber());
		customerOrderShippingAddress.setState(shippingAddress.getState());
		customerOrderShippingAddress.setZipCode(shippingAddress.getZipCode());
		
		// initiate customer order
		customerOrder.setCustomer(cart.getCustomer());
		customerOrder.setOrderDate(new Date());
		customerOrder.setOrderTotalPrice(cart.getGrandTotal());
		// for mapping orderItem table
		customerOrderRepository.save(customerOrder);
		cart.setGrandTotal(0);
		cartService.save(cart);
		// dump cartItem to orderItem, empty cart
		for(CartItem cartItem : cart.getCartItems()){
			CustomerOrderItem customerOrderItem = new CustomerOrderItem();
			customerOrderItem.setCustomerOrder(customerOrder);
			customerOrderItem.setProductId(cartItem.getProduct().getProductId());
			customerOrderItem.setProductName(cartItem.getProduct().getProductName());
			customerOrderItem.setProductPrice(cartItem.getProduct().getProductPrice());
			customerOrderItem.setProductQuantity(cartItem.getQuantity());
			customerOrderItemRepository.save(customerOrderItem);
			cartItemRepository.delete(cartItem);
		}
		// for mapping customerOrder table
		customerOrderShippingAddressRepository.save(customerOrderShippingAddress);
		
		customerOrder.setCustomerOrderShippingAddress(customerOrderShippingAddress);
		customerOrderRepository.save(customerOrder);
		
		customerOrderShippingAddress.setCustomerOrder(customerOrder);
		customerOrderShippingAddressRepository.save(customerOrderShippingAddress);
	}
	
	public List<CustomerOrder> getAllCustomerOrderByCustomer(Customer customer){
		return customerOrderRepository.findAllByCustomer(customer);
	}
}
