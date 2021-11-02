package com.model;

public class AnswerVO {

	private int ans_num; //´ñ±Û ¹øÈ£
	private String ans_name; //´ñ±Û ÀÛ¼ºÀÚ
	private String ans_cont; //´ñ±Û ³»¿ë
	private String ans_date; //´ñ±Û ÀÛ¼ºÀÏÀÚ
	private int ques_num; //Áú¹® ¹øÈ£
	
	public AnswerVO(int ans_num, String ans_name, String ans_cont, String ans_date, int ques_num) {
		this.ans_num = ans_num;
		this.ans_name = ans_name;
		this.ans_cont = ans_cont;
		this.ans_date = ans_date;
		this.ques_num = ques_num;
	}
	public AnswerVO() {
		
	}

	public int getAns_num() {
		return ans_num;
	}

	public void setAns_num(int ans_num) {
		this.ans_num = ans_num;
	}

	public String getAns_name() {
		return ans_name;
	}

	public void setAns_name(String ans_name) {
		this.ans_name = ans_name;
	}

	public String getAns_cont() {
		return ans_cont;
	}

	public void setAns_cont(String ans_cont) {
		this.ans_cont = ans_cont;
	}

	public String getAns_date() {
		return ans_date;
	}

	public void setAns_date(String ans_date) {
		this.ans_date = ans_date;
	}

	public int getQues_num() {
		return ques_num;
	}

	public void setQues_num(int ques_num) {
		this.ques_num = ques_num;
	}
}
