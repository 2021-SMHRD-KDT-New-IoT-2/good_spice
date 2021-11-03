package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class QuesDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	QuesVO vo = null;
	ArrayList<QuesVO> al = null;
	boolean check = false;
	int cnt = 0;

//	��������
	public void connection() {

		try {
			// 1. ����̹� �����ε�
			Class.forName("oracle.jdbc.driver.OracleDriver");

//			2. �����ͺ��̽� ���� ��ü ����

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "campus_b_2_1025";
			String dbpw = "smhrd2";

			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("�������");
		}

	}

//	���Ӳ���
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

	// ���� �۾��� �޼ҵ�
	public int QuesWrite(String ques_name, String mem_id, String ques_cont) {

		System.out.println(ques_name);
		System.out.println(ques_cont);
		System.out.println(mem_id);

		try {

			connection();

			String sql = "insert into question values(QUES_NUM.NEXTVAL,?,?,sysdate,?)";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, ques_name);
			psmt.setString(2, ques_cont);
			psmt.setString(3, mem_id);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();

		}
		return cnt; // �����ͺ��̽� ����
	}

	// �������
	public ArrayList<QuesVO> QuesList() {
		al = new ArrayList<QuesVO>();

		try {
			connection();

			String sql = "select * from QUESTION";
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {
				int get_ques_num = rs.getInt("ques_num");
				String get_ques_name = rs.getNString("ques_name");
				String get_ques_cont = rs.getNString("ques_cont");
				String get_ques_date = rs.getNString("ques_date");
				String get_mem_id = rs.getNString("mem_id");

				vo = new QuesVO(get_ques_num, get_ques_name, get_ques_cont, get_ques_date, get_mem_id);

				al.add(vo);

			}

		} catch (Exception e) {
			System.out.println("�Խñ� ��ȸ ����");
			e.printStackTrace();

		} finally {
			close();
		}
		return al;
	}

	// �ϳ��� ������ ���� �޼ҵ�
	public QuesVO getQuesPost(int ques_num) {
		String sql = "select * from QUESTION where ques_num = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ques_num);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				vo.setQues_num(rs.getInt(1));
				vo.setQues_name(rs.getString(2));
				vo.setQues_cont(rs.getString(3));
				vo.setQues_date(rs.getString(4));
				vo.setMem_id(rs.getString(5));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}

}
