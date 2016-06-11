package com.imlewis.service;

import com.imlewis.model.Customer;

public interface EmailSenderService {

	void sendActiveCode(Customer customer);
	
	void sendResetPasswordCode(Customer customer);
}
