package com.model;

public class MemberVO {
//	�ʵ�(��)
	private String id;
	private String pw;
	private String nick;
//	������
	public MemberVO(String id, String pw ,String nick) {
		this.id = id;
		this.pw = pw;
		this.nick = nick;
	}
	
	
//	�޼���(get)
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
