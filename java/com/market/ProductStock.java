package com.market;

public class ProductStock {
	private Integer code;
	private String name;
	private Integer price;
	private Integer stock;
	
	public ProductStock() {
		this.code = 0;
		this.name = "";
		this.price = 0;
		this.stock = 0;
	}
	
	public ProductStock(int code, String name, int price, int stock) {
		this.code = code;
		this.name = name;
		this.price = price;
		this.stock = stock;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}
}
