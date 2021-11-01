package com.model;

public class QuesVO {

	private int ques_num; //���� ��ȣ
	private String ques_name; //���� ����
	private String ques_cont; //���� ����
	private String ques_date; //���� �ۼ�����
	private String mem_id; //�ۼ��� ���̵�
	
	
	public QuesVO(int ques_num, String ques_name, String ques_cont, String ques_date, String mem_id) {
		super();
		this.ques_num = ques_num;
		this.ques_name = ques_name;
		this.ques_cont = ques_cont;
		this.ques_date = ques_date;
		this.mem_id = mem_id;
	}
	
	public QuesVO() {
		
	}


	public int getQues_num() {
		return ques_num;
	}


	public void setQues_num(int ques_num) {
		this.ques_num = ques_num;
	}


	public String getQues_name() {
		return ques_name;
	}


	public void setQues_name(String ques_name) {
		this.ques_name = ques_name;
	}


	public String getQues_cont() {
		return ques_cont;
	}


	public void setQues_cont(String ques_cont) {
		this.ques_cont = ques_cont;
	}


	public String getQues_date() {
		return ques_date;
	}


	public void setQues_date(String ques_date) {
		this.ques_date = ques_date;
	}


	public String getMem_id() {
		return mem_id;
	}


	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	
	
	
}
