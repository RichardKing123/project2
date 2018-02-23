package com.spring.project2.domain;

import java.util.List;

public class PolygonArea {
	private String name;
	private List<PolygonPoint> pointList;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<PolygonPoint> getPointList() {
		return pointList;
	}
	public void setPointList(List<PolygonPoint> pointList) {
		this.pointList = pointList;
	}
}
