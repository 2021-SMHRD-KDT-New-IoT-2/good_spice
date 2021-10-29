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

	ArrayList<MemberVO> al = null;

	boolean check = false;
	int cnt = 0;

//	동적연결
	public void connection() {

		try {
			// 1. 드라이버 동적로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");

//			2. 데이터베이스 연결 객체 생성

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid = "campus_b_2_1025";
			String dbpw = "smhrd2";

			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("연결실패");
		}

	}

//	접속끊기
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

//	레시피 등록
	public int RecipePost(String rec_name, String salt, String sugar, String pepper, String id) {
		try {

			connection();

			String sql = "insert into RECIPE values (RECIPE_NUM.NEXTVAL,?,?,?,?,?)";

//			4. sql문 실행객체 (PreparedStatment)생성
			psmt = conn.prepareStatement(sql);


//			5. 바인드 변수(?) 채우기

			psmt.setNString(1, rec_name);
			psmt.setNString(2, salt);
			psmt.setNString(3, sugar);
			psmt.setNString(4, pepper);
			psmt.setNString(5, id);

			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();

		}

		return cnt;
	}
}
