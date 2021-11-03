package com.model;

public class valueVO {
	private int mysensor;

	public valueVO() {

	}

	public valueVO(int mysensor) {
		this.mysensor = mysensor;
	}

	public int getValue() {
		return mysensor;
	}

	public void setValue(int mysensor) {
		this.mysensor = mysensor;
	}
	@Override
	public String toString() {
		return "valueVO [mysensor=" + mysensor + "]";
	}
}
