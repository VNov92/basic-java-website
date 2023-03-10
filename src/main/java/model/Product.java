package model;

import java.io.Serializable;

public class Product implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private String des;
	private double price;
	private String src;
	private String type;
	private String brand;
	private int number;

	public Product() {
		super();
	}

	public Product(int id, String name, String des, double price, String src, String type, String brand) {
		super();
		this.id = id;
		this.name = name;
		this.des = des;
		this.price = price;
		this.src = src;
		this.type = type;
		this.brand = brand;
	}

	public Product(int id, String name, String des, double price, String src, String type, String brand, int number) {
		super();
		this.id = id;
		this.name = name;
		this.des = des;
		this.price = price;
		this.src = src;
		this.type = type;
		this.brand = brand;
		this.number = number;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double d) {
		this.price = d;
	}

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}
	
	public boolean isEmpty() {
		return name==null;
	}
}
