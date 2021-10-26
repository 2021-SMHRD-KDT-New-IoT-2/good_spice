package com.model;

public class MemberVO {
//	필드(속)
	private String id;
	private String pw;
	private String nick;
//	생성자
	public MemberVO(String id,String pw ,String nick) {
		this.id = id;
		this.pw = pw;
		this.nick = nick;
	}
//	메서드(get)
	public String getid() {
		return id;
	}
	public String getpw() {
		return pw;
	}
	public String getnick() {
		return nick;
	}
}
