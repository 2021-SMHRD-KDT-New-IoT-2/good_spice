package com.model;

public class ProductVO {
	//鞘靛(加己)
	private String product;
	private String spice;
	private String id;
	
	//积己磊
	public ProductVO(String product, String spice) {
		this.product = product;
		this.spice = spice;
	}
	
	public ProductVO(String id) {
		this.id = id;
		this.product = product;
		this.spice = spice;
	}
	
	public void setSpice(String spice) {
		this.spice = spice;
	}
	
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
