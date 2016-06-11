package com.imlewis.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.imlewis.model.Customer;
import com.imlewis.service.CustomerService;

@Controller
@RequestMapping("/admin/cu")
public class AdminCustomerController {

    @Autowired
    private CustomerService customerService;

    @RequestMapping("/m")
    public String customerManagement(Model model){
        List<Customer> customerList = customerService.getAllCustomer();
        model.addAttribute("customerList", customerList);

        return "admin/customerManagement";
    }
    
    @RequestMapping("/d")
    public String removeCustomer(@RequestParam(value="id", required=true) Long customerId){
    	customerService.delete(customerId);
    	return "redirect:/admin/cu/m";
    }
    
    @RequestMapping("/e")
    public String enableCustomer(@RequestParam(value="id", required=true) Long customerId){
    	Customer customer = customerService.findOne(customerId);
    	customer.setEnabled(true);
    	customerService.save(customer);
    	return "redirect:/admin/cu/m";
    }
    
    @RequestMapping("/ds")
    public String disableCustomer(@RequestParam(value="id", required=true) Long customerId){
    	Customer customer = customerService.findOne(customerId);
    	customer.setEnabled(false);
    	customerService.save(customer);
    	return "redirect:/admin/cu/m";
    }
}
