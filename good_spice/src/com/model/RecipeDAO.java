package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class RecipeDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	MemberVO vo = null;
	ArrayList<MemberVO> al =null;
	boolean check= false;
	int cnt = 0;
	
//	��������
	public void connection() {

	
		try {
			//1. ����̹� �����ε�
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
//			2. �����ͺ��̽� ���� ��ü ����

			String url="jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid="campus_b_2_1025";
			String dbpw="smhrd2";
			
			conn = DriverManager.getConnection(url,dbid,dbpw);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("�������");
		}
		
	}
//	���Ӳ���
	public void close() {
		try {
			if(rs!=null) {
				rs.close();
			}
			if(psmt!=null) {
				psmt.close();
			}
			if(conn!=null) {
				conn.close();
			}
			
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}
//	������ ���
	public int RecipePost(String rec_name, String salt,String sugar,String pepper, String id) {
		try {

			connection();
			
			String sql = "insert into RECIPE values (RECIPE_NUM.NEXTVAL,?,?,?,?,?)";
			
//			4. sql�� ���ఴü (PreparedStatment)����
			psmt = conn.prepareStatement(sql);
			
//			5. ���ε� ����(?) ä���
			
			psmt.setNString(1,rec_name);
			psmt.setNString(2,salt);
			psmt.setNString(3,sugar);
			psmt.setNString(4,pepper);
			psmt.setNString(5,id);
			
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
			
		}
		
		return cnt;
	}
}	