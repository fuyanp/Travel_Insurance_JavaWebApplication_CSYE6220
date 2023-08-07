package com.me.pojo;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
@Qualifier("insurances")
public class Insurance {
	private String Id;
	private String type;
	private int clientId;
	private int eid;
	private String nameofinsured;
	private String startDate;
	private String endDate;
	private int deductible;
	private String address;
	private String status;
	private String covered;



	public Insurance() {}
	
	
	
	

	public int getClientId() {
		return clientId;
	}
	public void setClientId(int clientId) {
		this.clientId = clientId;
	}
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public String getNameofinsured() {
		return nameofinsured;
	}
	public void setNameofinsured(String nameofinsured) {
		this.nameofinsured = nameofinsured;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCovered() {
		return covered;
	}
	public void setCovered(String covered) {
		this.covered = covered;
	}
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getDeductible() {
		return deductible;
	}
	public void setDeductible(int deductible) {
		this.deductible = deductible;
	}
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}
