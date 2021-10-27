package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	MemberVO vo = null;
	ArrayList<MemberVO> al = null;
	boolean check = false;
	int cnt = 0;
	int setSalt;
	int setSugar;
	int setPepper;
	

	// ���� ���� �ϱ�
	public void connection() {
		try {
			// 1. ����̹� �����ε�
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 2. �����ͺ��̽� ���� ��ü ����

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "campus_b_2_1025";
			String dbpw = "smhrd2";

			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("�������");
		}

	}

    //���Ӳ���
	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}

		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}

	
	//��ǰ������ �Է��ϱ�
	public int addProduct(String product, String spice, String id) {
		
		if(spice.equals("�ұ�")) {
			setSalt = 0;
		}else if(spice.equals("����")) {
			setSugar = 0;
		}else if(spice.equals("����")) {
			setPepper = 0;
		}
		
		try {
			connection();
			
//			3. ������ sql�� ���� (�����Ҷ����� ���� �޶����� �κ��� ? �ۼ�)
			String sql = "insert into SPICE_DATA values (?,?,?,?,?)";
			
			
//			4. sql�� ���ఴü (PreparedStatment)����
			psmt = conn.prepareStatement(sql);
			
			
//			5. ���ε� ����(?) ä���
			psmt.setNString(1, product);
			
			if(setSalt == 0) {
				psmt.setInt(2, setSalt);
			}else if(setSugar == 0){
				psmt.setInt(3, setSugar);
			}else if(setPepper == 0) {
				psmt.setInt(4, setPepper);
			}
			psmt.setNString(5, id);

			
//			6. sql�� ���� �� ���ó��
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("��ǰ��Ͻ���");
			e.printStackTrace();
			
		}finally {
			close();
		}
		return cnt;
	}
	
}
