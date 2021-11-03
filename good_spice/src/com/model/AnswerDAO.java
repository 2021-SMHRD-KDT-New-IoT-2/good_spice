package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AnswerDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	AnswerVO vo = null;
	ArrayList<AnswerVO> al = null;
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
	
	// 댓글 글쓰기 메소드
	public int AnswerWrite(String ans_cont, int ques_num) {

		
		System.out.println(ans_cont);
		System.out.println(ques_num);

		try {

			connection();

			String sql = "insert into answer values(ANSWER_NUM.NEXTVAL,'admin',?,sysdate,?)";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, ans_cont);
			psmt.setInt(2, ques_num);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();

		}
		return cnt; // 데이터베이스 오류
	}
	
	// 댓글목록
		public ArrayList<AnswerVO> AnswerList() {
			al = new ArrayList<AnswerVO>();

			try {
				connection();

				String sql = "select * from Answer";
				psmt = conn.prepareStatement(sql);

				rs = psmt.executeQuery();

				while (rs.next()) {
					int get_ans_num = rs.getInt("ans_num");
					String get_mem_id = rs.getString("mem_id");
					String get_ans_cont = rs.getString("ans_cont");
					String get_ans_date = rs.getString("ans_date");
					int get_ques_num = rs.getInt("ques_num");

					vo = new AnswerVO(get_ans_num, get_mem_id, get_ans_cont, get_ans_date, get_ques_num);

					al.add(vo);

				}

			} catch (Exception e) {
				System.out.println("게시글 조회 실패");
				e.printStackTrace();

			} finally {
				close();
			}
			return al;
		}
	
}
