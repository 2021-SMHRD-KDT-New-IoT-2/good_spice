package com.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class PostDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	PostVO vo = null;
	ArrayList<PostVO> al =null;
	boolean check= false;
	int cnt = 0;
	
//	동적연결
	public void connection() {
	
		try {
			//1. 드라이버 동적로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
//			2. 데이터베이스 연결 객체 생성

			String url="jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid="campus_b_2_1025";
			String dbpw="smhrd2";
			
			conn = DriverManager.getConnection(url,dbid,dbpw);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("연결실패");
		}
		
	}
	
//	접속끊기
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
	

	//글쓰기 메소드
	public int write(String post_name, String mem_id, String post_cont) {
		
	     
	     System.out.println(post_name);
	     System.out.println(post_cont);
	     System.out.println(mem_id);

		try {
				
				connection();
				
				String sql = "insert into post values(POST_SEQ.NEXTVAL,?,?,sysdate,?)";
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, post_name);
				psmt.setString(2, post_cont);
				psmt.setString(3, mem_id);
				
				
				cnt = psmt.executeUpdate();
				
			
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
				
			}
			return cnt; //데이터베이스 오류
		}
		
	
	//게시글 목록
	public ArrayList<PostVO> PostList(){
		al = new ArrayList<PostVO>();
		
		try {
			connection();

			String sql = "select * from post";
			psmt = conn.prepareStatement(sql);
			
			rs = psmt.executeQuery();

			while (rs.next()) {
				int get_post_num = rs.getInt("post_num");
				String get_post_name = rs.getNString("post_name");
				String get_post_cont = rs.getNString("post_cont");
				String get_post_date = rs.getNString("post_date");
				String get_mem_id = rs.getNString("mem_id");
				

				vo = new PostVO(get_post_num, get_post_name, get_post_cont, get_post_date, get_mem_id);
				
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
	
	
	// 하나의 게시들을 보는 메소드
	public PostVO getPost(int post_num) {
		String sql = "select * from POST where POST_NUM = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setPost_num(rs.getInt(1));
				vo.setPost_name(rs.getString(2));
				vo.setPost_cont(rs.getString(3));
				vo.setPost_date(rs.getString(4));
				vo.setMem_id(rs.getString(5));	
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	
	
	
	
	
	
	
}
