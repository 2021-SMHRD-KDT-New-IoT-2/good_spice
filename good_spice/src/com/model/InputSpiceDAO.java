package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class InputSpiceDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	MemberVO vo = null;
	ArrayList<MemberVO> al =null;
	boolean check= false;
	int cnt = 0;
	
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
	
	
	public String productNum(String id) {
		
		String product = null;
		try {
			connection();

			String sql = "select prodouct from spice_data where mem_id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

			rs = psmt.executeQuery();
			
			while(rs.next()) {
				product = rs.getString("prodouct");
				System.out.println(product);
			}
			
		} catch (Exception e) {

			System.out.println("product �� ��� ����");
			e.printStackTrace();

		} finally {
			close();
		}
		return product;
	}
	
	
	public int inputSpice(String product, String value) {
		try {

			connection();

			String sql = "UPDATE spice_data set value = ? where prodouct = ?";

			psmt = conn.prepareStatement(sql);

		
			psmt.setString(1, value);
			psmt.setString(2, product);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {

			System.out.println("Value�Է½���");
			e.printStackTrace();

		} finally {
			close();
		}
		return cnt;
	}
	

}
