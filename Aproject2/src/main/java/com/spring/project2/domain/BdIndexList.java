package com.spring.project2.domain;

import java.util.List;

public class BdIndexList {
	
	private int yearMonth;
	private List<BdIndex> bdIndexList;
	public int getYearMonth() {
		return yearMonth;
	}
	public void setYearMonth(int yearMonth) {
		this.yearMonth = yearMonth;
	}
	public List<BdIndex> getBdIndexList() {
		return bdIndexList;
	}
	public void setBdIndexList(List<BdIndex> bdIndexList) {
		this.bdIndexList = bdIndexList;
	}
	
}
