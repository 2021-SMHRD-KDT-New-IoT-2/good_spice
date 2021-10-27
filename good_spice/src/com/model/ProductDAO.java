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
		
		if(spice.equals("소금")) {
			setSalt = 0;
		}else if(spice.equals("설탕")) {
			setSugar = 0;
		}else if(spice.equals("후추")) {
			setPepper = 0;
		}
		
		try {
			connection();
			
//			3. 실행할 sql문 정의 (실행할때마다 값이 달라지는 부분은 ? 작성)
			String sql = "insert into SPICE_DATA values (?,?,?,?,?)";
			
			
//			4. sql문 실행객체 (PreparedStatment)생성
			psmt = conn.prepareStatement(sql);
			
			
//			5. 바인드 변수(?) 채우기
			psmt.setNString(1, product);
			
			if(setSalt == 0) {
				psmt.setInt(2, setSalt);
			}else if(setSugar == 0){
				psmt.setInt(3, setSugar);
			}else if(setPepper == 0) {
				psmt.setInt(4, setPepper);
			}
			psmt.setNString(5, id);

			
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
