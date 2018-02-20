package com.spring.project2.domain;

public class Bd_Index {

	private String bd_code_name;
	private String district;
	private int bd_code;
	private int bd_date;
	private String business_type;
	private String overcrowding_index_level;
	
	public Bd_Index() {
		// TODO Auto-generated constructor stub
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
	public int getBd_code() {
		return bd_code;
	}
	public void setBd_code(int bd_code) {
		this.bd_code = bd_code;
	}
	
	public int getBd_date() {
		return bd_date;
	}

	public void setBd_date(int bd_date) {
		this.bd_date = bd_date;
	}

	public String getBusiness_type() {
		return business_type;
	}
	public void setBusiness_type(String business_type) {
		this.business_type = business_type;
	}
	public String getOvercrowding_index_level() {
		return overcrowding_index_level;
	}
	public void setOvercrowding_index_level(String overcrowding_index_level) {
		this.overcrowding_index_level = overcrowding_index_level;
	}
	
	
}
