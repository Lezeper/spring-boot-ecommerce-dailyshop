package com.imlewis.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.imlewis.model.Code;
import com.imlewis.model.Customer;
import com.imlewis.repository.CodeRepository;
import com.imlewis.repository.RoleRepository;
import com.imlewis.service.CustomerService;
import com.imlewis.service.EmailSenderService;

/*
 *	Login/Logout/Register/Retrieve password 
 */
@Controller
public class UserController {
	
	@Autowired
	private CustomerService customerService;
	@Autowired
	private EmailSenderService emailSenderService;
	@Autowired
	private CodeRepository codeRepository;
	@Autowired
	private RoleRepository roleRepository;
	
	public void setToSession(HttpServletRequest request, Customer customer){
		request.getSession().setAttribute("customerName_", customer.getCustomerName());
        request.getSession().setAttribute("customerId_", customer.getCustomerId());
        request.getSession().setAttribute("cartId_", customer.getCart().getCartId());
	}
	
	@RequestMapping(value = "/rp", method = RequestMethod.POST)
	public String resetPasswordPost(@Valid @ModelAttribute("user") Customer user, HttpServletRequest request, Model model) {
        
        Customer customer = customerService.findByEmail(user.getEmail());
        customer.setPassword(user.getPassword());
        
        Authentication authentication = new UsernamePasswordAuthenticationToken(customer.getEmail(), customer.getPassword());
        SecurityContextHolder.getContext().setAuthentication(authentication);
        
        setToSession(request, customer);
        
        customerService.save(customer);
        // delete reset password code in DB
        List<Code> codes = codeRepository.findByCodeTypeAndCustomer(1, customer);
        codeRepository.delete(codes);
        
        model.addAttribute("title", "Password Reset");
        model.addAttribute("msg", "Your password has been reset!");
        return "processSuccess";
    }
	
	@RequestMapping(value = "/rp/{codeStr}", method = RequestMethod.GET)
	public String resetPassword(@PathVariable String codeStr, Model model){
		Code code = codeRepository.findByCodeStr(codeStr);
		if(code != null){
			Customer customer = code.getCustomer();
			customer.setPassword("");
			model.addAttribute("user",customer);

			return "resetPW";
		}
		return "404";
	}
	
	@RequestMapping(value = "/fp", method = RequestMethod.GET)
	public String findPasswordGet(@RequestParam(value = "email", required = false) String email, Model model){
		if(email != null){
			Customer customer = customerService.findByEmail(email);
			
			if(customer != null && roleRepository.findByAuthorityAndCustomer("ROLE_UNAUTH", customer) == null){
				emailSenderService.sendResetPasswordCode(customer);
			}
		}
		return "findPassword";
	}
	
	@RequestMapping(value = "/rg/{codeStr}", method = RequestMethod.GET)
	public String activeAccount(@PathVariable String codeStr, Model model){
		
		customerService.activeAccount(codeStr);
		
		model.addAttribute("title", "Congratulation!");
		model.addAttribute("msg", "Your Account has been actived!<strong>Please Logout and Login again!</strong>");
		
		return "processSuccess";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerCustomerPost(@Valid @ModelAttribute("user") Customer user, BindingResult result,
			HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		// if user already login, then redirect to home page.
		if(session.getAttribute("customerName_") != null){
			return "redirect:/";
		}
		
        if(result.hasErrors()){
            return "registerCustomer";
        }
        if(customerService.findByEmail(user.getEmail())!= null){
        	model.addAttribute("email_exists", "Email already exist!");
        	return "registerCustomer";
        }

        customerService.save(user);
        Customer customer = customerService.findByEmail(user.getEmail());
        
        Authentication authentication = new UsernamePasswordAuthenticationToken(user.getEmail(), user.getPassword());
        SecurityContextHolder.getContext().setAuthentication(authentication);
        
        setToSession(request, customer);
        
        emailSenderService.sendActiveCode(customer);
        
        model.addAttribute("title", "Register Successful!");
        model.addAttribute("msg", "The active code has been sent to your Email box. Please check it out.");
        return "processSuccess";
    }
	
	@RequestMapping("/register")
    public String register(HttpServletRequest request, Model model){
		HttpSession session = request.getSession();
		// if user already login, then redirect to home page.
		if(session.getAttribute("customerName_") != null){
			return "redirect:/";
		}
		
        Customer user = new Customer();
        model.addAttribute("user", user);

        return "registerCustomer";
    }
	
	@RequestMapping("/login")
	public String login(@RequestParam(value = "error", required = false) String error,
			HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		// if user already login, then redirect to home page.
		if(session.getAttribute("customerName_") != null){
			return "redirect:/";
		}
    	if (error != null) {
			model.addAttribute("error", "* Invalid username or password");
		}
    	return "login";
	}
	
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
	    return "redirect:/login";
	}
}
