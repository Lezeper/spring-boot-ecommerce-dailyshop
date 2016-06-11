package com.imlewis.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Code {
	
	@Id
    @GeneratedValue
    private Long codeId;
	
	private String codeStr;
	private int codeType; // 0:active, 1: reset PW
	
	@Column(columnDefinition="DATETIME")
	private Date codeDate;
	
	@ManyToOne
    @JoinColumn(name = "customerId")
    private Customer customer;

	public Long getCodeId() {
		return codeId;
	}

	public void setCodeId(Long codeId) {
		this.codeId = codeId;
	}

	public String getCodeStr() {
		return codeStr;
	}

	public void setCodeStr(String codeStr) {
		this.codeStr = codeStr;
	}

	public int getCodeType() {
		return codeType;
	}

	public void setCodeType(int codeType) {
		this.codeType = codeType;
	}

	public Date getCodeDate() {
		return codeDate;
	}

	public void setCodeDate(Date codeDate) {
		this.codeDate = codeDate;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	
}
