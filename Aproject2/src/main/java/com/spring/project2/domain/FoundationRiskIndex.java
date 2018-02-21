package com.spring.project2.domain;

public class FoundationRiskIndex {

	private int bdDate, bdCode, foundationRiskRate;
	private String district, foundationRiskLevel;
	private double reportOfBusinessCessationRate, reportOfBusinessCessationRateDueToOpeningFor3yrs,
		avgCessationRate, shopIncrementRate, foundationRiskIndexValue;

	
	public int getBdDate() {
		return bdDate;
	}
	public void setBdDate(int bdDate) {
		this.bdDate = bdDate;
	}
	public int getBdCode() {
		return bdCode;
	}
	public void setBdCode(int bdCode) {
		this.bdCode = bdCode;
	}
	public int getFoundationRiskRate() {
		return foundationRiskRate;
	}
	public void setFoundationRiskRate(int foundationRiskRate) {
		this.foundationRiskRate = foundationRiskRate;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
	public String getFoundationRiskLevel() {
		return foundationRiskLevel;
	}
	public void setFoundationRiskLevel(String foundationRiskLevel) {
		this.foundationRiskLevel = foundationRiskLevel;
	}
	public double getReportOfBusinessCessationRate() {
		return reportOfBusinessCessationRate;
	}
	public void setReportOfBusinessCessationRate(double reportOfBusinessCessationRate) {
		this.reportOfBusinessCessationRate = reportOfBusinessCessationRate;
	}
	public double getReportOfBusinessCessationRateDueToOpeningFor3yrs() {
		return reportOfBusinessCessationRateDueToOpeningFor3yrs;
	}
	public void setReportOfBusinessCessationRateDueToOpeningFor3yrs(
			double reportOfBusinessCessationRateDueToOpeningFor3yrs) {
		this.reportOfBusinessCessationRateDueToOpeningFor3yrs = reportOfBusinessCessationRateDueToOpeningFor3yrs;
	}
	public double getAvgCessationRate() {
		return avgCessationRate;
	}
	public void setAvgCessationRate(double avgCessationRate) {
		this.avgCessationRate = avgCessationRate;
	}
	public double getShopIncrementRate() {
		return shopIncrementRate;
	}
	public void setShopIncrementRate(double shopIncrementRate) {
		this.shopIncrementRate = shopIncrementRate;
	}
	public double getFoundationRiskIndexValue() {
		return foundationRiskIndexValue;
	}
	public void setFoundationRiskIndexValue(double foundationRiskIndexValue) {
		this.foundationRiskIndexValue = foundationRiskIndexValue;
	}
	
	
	
}
