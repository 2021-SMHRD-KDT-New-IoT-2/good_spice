package com.model;

public class ProductVO {
	//�ʵ�(�Ӽ�)
	private String product;
	private String spice;
	private String id;
	
	//������
	public ProductVO(String product, String spice) {
		this.product = product;
		this.spice = spice;
		
	}
	//�ż���(get)
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
