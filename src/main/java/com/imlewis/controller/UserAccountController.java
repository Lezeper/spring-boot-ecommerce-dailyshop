package com.imlewis.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.imlewis.model.Customer;
import com.imlewis.model.CustomerOrder;
import com.imlewis.model.ShippingAddress;
import com.imlewis.repository.CustomerOrderRepository;
import com.imlewis.service.CustomerAddressService;
import com.imlewis.service.CustomerOrderService;
import com.imlewis.service.CustomerService;
import com.imlewis.service.EmailSenderService;

@Controller
@RequestMapping("/customer/account")
public class UserAccountController {

    @Autowired
    private CustomerService customerService;
    @Autowired
    private CustomerOrderRepository customerOrderRepository;
    @Autowired
    private CustomerAddressService customerAddressService;
    @Autowired
    private CustomerOrderService customerOrderService;
	@Autowired
	private EmailSenderService emailSenderService;

    @RequestMapping
    public String account(HttpServletRequest request, Model model) {

        Long customerId = (Long) request.getSession().getAttribute("customerId_");
        Customer customer = customerService.findOne(customerId);
        model.addAttribute("customer",customer);

//        List<ShippingAddress> customerBillingAddresses = customerAddressRepository.findByIsShippingAndCustomer(false, customer);
        List<ShippingAddress> customerShippingAddresses = customerAddressService.getAllShippingAddressByCustomerId(customerId);
/*
        for(ShippingAddress defaultBillingAddress : customerBillingAddresses){
        	if(defaultBillingAddress.getIsDefault()){
                model.addAttribute("billingAddress",customerBillingAddresses);
        	}
        }*/
        for(ShippingAddress defaultShippingAddress : customerShippingAddresses){
        	if(defaultShippingAddress.getIsDefault()){
                model.addAttribute("shippingAddress",defaultShippingAddress);
                break;
        	}
        }
        
        if(customerService.hasRole("ROLE_UNAUTH", customer)){
        	model.addAttribute("unAuth", "unAuth");
        }
        
        // Get Customer Orders
        List<CustomerOrder> customerOrders = customerOrderService.getAllCustomerOrderByCustomer(customer);
        model.addAttribute("customerOrders", customerOrders);
		

        return "myAccount";
    }
    
    @RequestMapping(value = "/rsac", method = RequestMethod.GET)
	public void resendActiveCode(HttpServletRequest request){
    	Long customerId = (Long) request.getSession().getAttribute("customerId_");
        Customer customer = customerService.findOne(customerId);
		if(customer != null){
			if(!customerService.hasRole("ROLE_USER", customer))
				emailSenderService.sendActiveCode(customer);
		}
	}
    /*
    @RequestMapping(value = "/address", method = RequestMethod.GET)
    public String address(Model model, HttpServletRequest request){
        String customerName = (String) request.getSession().getAttribute("customer_name");
        int customerId = customerService.getCustomerByUsername(customerName).getCustomerId();

        List<CustomerAddress> customerBillingAddresses = customerAddressService.getAllBillingAddressByCustomerId(customerId);
        List<CustomerAddress> customerShippingAddresses = customerAddressService.getAllShippingAddressByCustomerId(customerId);
        model.addAttribute("customerBillingAddresses", customerBillingAddresses);
        model.addAttribute("customerShippingAddresses", customerShippingAddresses);

        return "addressManagement";
    }

    @RequestMapping(value = "/address", method = RequestMethod.POST)
    public String addAddress(@Valid @ModelAttribute("customerAddress") CustomerAddress customerAddress,
                             @RequestParam("customerId") int customerId, BindingResult result){
        if(result.hasErrors()){
            return "myAccount";
        }
        Customer customer = customerService.getCustomerById(customerId);
        customerAddress.setCustomer(customer);
        if (customerAddress.getAddressType() == 0){
            customerAddressService.addShippingAddress(customerAddress);
        }
        if (customerAddress.getAddressType() == 1){
            customerAddressService.addBillingAddress(customerAddress);
        }

        return "redirect:/customer/account";
    }

    @RequestMapping("/order")
    public String orderOperation(@RequestParam("d") int orderId, Model model){

        if(orderId !=  0){
            customerOrderService.deleteCustomerOrderById(orderId);
        }

        return "redirect:/customer/account";
    }*/
}
