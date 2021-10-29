package com.model;

public class ProductVO {
	//필드(속성)
	private String product;
	private String spice;
	private String id;
	
	//생성자
	public ProductVO(String product, String spice) {
		this.product = product;
		this.spice = spice;
		
	}
	//매서드(get)
	public String getProduct() {
		return product;
	}
	public String getSpice() {
		return spice;
	}
	public String getid() {
		return id;
	}
}
