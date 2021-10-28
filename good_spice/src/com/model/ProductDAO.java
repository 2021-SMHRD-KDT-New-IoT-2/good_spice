package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;

public class ProductDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	ProductVO vo = null;
	ArrayList<ProductVO> al = null;
	boolean check = false;
	int cnt = 0;
	
	

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
	
		try {
			
			connection();
			
			String sql = null;
			if(spice.equals("�ұ�")) {
				sql = "insert into SPICE_DATA values (?, 1, 0, 0, ?)";
			}else if(spice.equals("����")) {
				sql = "insert into SPICE_DATA values (?, 0, 1, 0, ?)";
			}else if(spice.equals("����")) {
				sql = "insert into SPICE_DATA values (?, 0, 0, 1, ?)";
			}

//			4. sql�� ���ఴü (PreparedStatment)����
			psmt = conn.prepareStatement(sql);
			
//			5. ���ε� ����(?) ä���
			psmt.setString(1, product);
			psmt.setString(2, id);

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
//	��ǰ �ߺ�üũ
	public boolean prodCheck(String id) {
		try {
			connection();
//			3. ������ sql�� ���� (�����Ҷ����� ���� �޶����� �κ��� ? �ۼ�)
			String sql = "select PRODOUCT from spice_data where PRODOUCT=?";
			
//			4. sql�� ���ఴü (PreparedStatment)����
			psmt = conn.prepareStatement(sql);
			
//			5. ���ε� ����(?) ä���
			psmt.setString(1, id);
			
//			6. sql�� ���� �� ���ó��
			rs = psmt.executeQuery();
			
			if(rs.next()){
				//�Է��� �̸����� ����� �� ������
				check=true;
			}else {
				//�Է��� �̸����� ����� �� ������
				check=false;
			}	
		} catch (Exception e) {
			System.out.println("�ߺ�Ȯ�� ����");
			e.printStackTrace();
			
		}finally {
			close();
		}
		return check;
	}
	
	
	
	public ArrayList<ProductVO> selectAll(){
		al = new ArrayList<ProductVO>();
	
		try {
			connection();

			String sql = "select prodouct, salt, sugar, pepper from spice_data";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			//psmt.setString(1, id);
			
			while (rs.next()) {
				String get_product = rs.getString("prodouct");
				String get_spice = null;
					if(rs.getString(2).equals("1")) {
						get_spice = "�ұ�";
					}else if(rs.getString(3).equals("1")) {
						get_spice = "����";
					}else if(rs.getString(4).equals("1")) {
						get_spice = "����";
					}

				vo = new ProductVO(get_product, get_spice);
				
				al.add(vo);

			}

		} catch (Exception e) {
			System.out.println("��ȸ ����");
			e.printStackTrace();

		} finally {
			close();
		}
		return al;
	}
}
