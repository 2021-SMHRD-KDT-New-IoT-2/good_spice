package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class valueDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	MemberVO vo = null;
	ArrayList<MemberVO> al =null;
	boolean check= false;
	int cnt = 0;
	
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
	
	public valueVO update(int mysensor) {
		valueVO vo = null;
		connection();
		String sql = "update uservalue set mysensor = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, mysensor);
			psmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		vo = getvalue();
		return vo;
	}

	public valueVO getvalue() {
		valueVO vo = null;
		connection();
		
		String sql = "select * from uservalue";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if (rs.next()) {
				int mysensor = rs.getInt(1);
				vo = new valueVO(mysensor);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return vo;
	}
}
