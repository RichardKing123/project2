package com.spring.project2.domain;

public class Api {

	private String name;
	private String add1;
	private String add2;
	private int phone;
	private String id;
	private String images;
	private String parking;
	private String animal;
	private String gender;
	private int deposit;
	private int rent;
	private int read_count;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAdd1() {
		return add1;
	}
	public void setAdd1(String add1) {
		this.add1 = add1;
	}
	public String getAdd2() {
		return add2;
	}
	public void setAdd2(String add2) {
		this.add2 = add2;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getImages() {
		return images;
	}
	public void setImages(String images) {
		this.images = images;
	}
	public String getParking() {
		return parking;
	}
	public void setParking(String parking) {
		this.parking = parking;
	}
	public String getAnimal() {
		return animal;
	}
	public void setAnimal(String animal) {
		this.animal = animal;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getDeposit() {
		return deposit;
	}
	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}
	public int getRent() {
		return rent;
	}
	public void setRent(int rent) {
		this.rent = rent;
	}
	public int getRead_count() {
		return read_count;
	}
	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}

	
	public Api() {}
	public Api(String name, String add1, String add2, int phone,
						String id, String images,String parking, String animal, String gender, int deposit,
						int rent, int read_count) {
		this.name=name;
		this.add1=add1;
		this.add2=add2;
		this.phone=phone;
		this.id=id;
		this.images=images;
		this.parking=parking;
		this.animal=animal;
		this.gender=gender;
		this.deposit=deposit;
		this.rent=rent;
		this.read_count=read_count;
	}
}
