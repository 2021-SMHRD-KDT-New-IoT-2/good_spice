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
	
	

	// 동적 연결 하기
	public void connection() {
		try {
			// 1. 드라이버 동적로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 2. 데이터베이스 연결 객체 생성

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "campus_b_2_1025";
			String dbpw = "smhrd2";

			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("연결실패");
		}

	}

    //접속끊기
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

	
	//제품데이터 입력하기
	public int addProduct(String product, String spice, String id) {
	
		try {
			
			connection();
			
			String sql = null;
			if(spice.equals("소금")) {
				sql = "insert into SPICE_DATA values (?, 1, 0, 0, ?)";
			}else if(spice.equals("설탕")) {
				sql = "insert into SPICE_DATA values (?, 0, 1, 0, ?)";
			}else if(spice.equals("후추")) {
				sql = "insert into SPICE_DATA values (?, 0, 0, 1, ?)";
			}

//			4. sql문 실행객체 (PreparedStatment)생성
			psmt = conn.prepareStatement(sql);
			
//			5. 바인드 변수(?) 채우기
			psmt.setString(1, product);
			psmt.setString(2, id);

//			6. sql문 실행 후 결과처리
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("제품등록실패");
			e.printStackTrace();
			
		}finally {
			close();
		}
		return cnt;
	}
	
}
