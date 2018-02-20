package com.spring.project2.domain;

public class Bd_Shop {

	private int bd_date, bd_code, no_of_shop, open_rate, no_of_open, close_rate, no_of_close;
	private String bd_code_name, district, business_type;
	public Bd_Shop() {
		// TODO Auto-generated constructor stub
	}
	public int getBd_date() {
		return bd_date;
	}
	public void setBd_date(int bd_date) {
		this.bd_date = bd_date;
	}
	public int getBd_code() {
		return bd_code;
	}
	public void setBd_code(int bd_code) {
		this.bd_code = bd_code;
	}
	public int getNo_of_shop() {
		return no_of_shop;
	}
	public void setNo_of_shop(int no_of_shop) {
		this.no_of_shop = no_of_shop;
	}
	public int getOpen_rate() {
		return open_rate;
	}
	public void setOpen_rate(int open_rate) {
		this.open_rate = open_rate;
	}
	public int getNo_of_open() {
		return no_of_open;
	}
	public void setNo_of_open(int no_of_open) {
		this.no_of_open = no_of_open;
	}
	public int getClose_rate() {
		return close_rate;
	}
	public void setClose_rate(int close_rate) {
		this.close_rate = close_rate;
	}
	public int getNo_of_close() {
		return no_of_close;
	}
	public void setNo_of_close(int no_of_close) {
		this.no_of_close = no_of_close;
	}
	public String getBd_code_name() {
		return bd_code_name;
	}
	public void setBd_code_name(String bd_code_name) {
		this.bd_code_name = bd_code_name;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getBusiness_type() {
		return business_type;
	}
	public void setBusiness_type(String business_type) {
		this.business_type = business_type;
	}
	
}
