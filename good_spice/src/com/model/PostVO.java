package com.model;

public class PostVO {

	private int post_num; //게시글 번호
	private String post_name; //게시글 제목
	private String post_cont; //게시글 내용
	private String post_date; //게시글 작성일자
	private String mem_id; //작성자 아이디
	

	public PostVO(int post_num, String post_name, String post_cont, String post_date, String mem_id) {
		super();
		this.post_num = post_num;
		this.post_name = post_name;
		this.post_cont = post_cont;
		this.post_date = post_date;
		this.mem_id = mem_id;
	}
	
	public PostVO() {
		
	}
	
	public int getPost_num() {
		return post_num;
	}
	public void setPost_num(int post_num) {
		this.post_num = post_num;
	}
	public String getPost_name() {
		return post_name;
	}
	public void setPost_name(String post_name) {
		this.post_name = post_name;
	}
	public String getPost_cont() {
		return post_cont;
	}
	public void setPost_cont(String post_cont) {
		this.post_cont = post_cont;
	}
	public String getPost_date() {
		return post_date;
	}
	public void setPost_date(String post_date) {
		this.post_date = post_date;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	

}
