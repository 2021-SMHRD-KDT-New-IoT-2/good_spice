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
			
			String sql = "insert into SPICE_DATA values (?, ?, ?, ?)";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, product);
			psmt.setString(2, spice);
			psmt.setString(3, "0");
			psmt.setString(4, id);
			
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("제품등록실패");
			e.printStackTrace();
			
		}finally {
			close();
		}
		return cnt;
	}
	
	
//	제품 중복체크
	public boolean prodCheck(String id) {
		try {
			connection();
			
			String sql = "select PRODOUCT from spice_data where PRODOUCT=?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			
			if(rs.next()){
				check=true;
			}else {
				check=false;
			}	
		} catch (Exception e) {
			System.out.println("중복확인 실패");
			e.printStackTrace();
			
		}finally {
			close();
		}
		return check;
	}
	
	
//	제품 목록
	public ArrayList<ProductVO> selectAll(String mem_id){
		al = new ArrayList<ProductVO>();
		
		try {
			connection();

			String sql = "select prodouct, spice from spice_data where MEM_ID=?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, mem_id); 
			
			rs = psmt.executeQuery();

			
			while (rs.next()) {
				String get_product = rs.getString("prodouct");
				String get_spice = rs.getNString("spice");

				vo = new ProductVO(get_product, get_spice);
				
				al.add(vo);

			}

		} catch (Exception e) {
			System.out.println("조회 실패");
			e.printStackTrace();

		} finally {
			close();
		}
		return al;
	}
	
	
//	제품삭제
	public int delete(String product) {

		try {
			connection();
			
				String sql = "DELETE from SPICE_DATA where PRODOUCT=?";
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, product);

				cnt = psmt.executeUpdate();
				
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();	
		}
		return cnt;
	}
	// 사용자의 소스 정보 가져오기
	public String user_spice(String id) {
		String spice = null;
		try {
			connection();

			String sql = "select spice from spice_data where mem_id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

			rs = psmt.executeQuery();
			
			if(rs.next()) {
				spice = rs.getString("spice");
				System.out.println(spice);
			}
			
		} catch (Exception e) {

			System.out.println("spice 값 출력 실패");
			e.printStackTrace();

		} finally {
			close();
		}
		return spice;
	}
	// test value
	public String user_value(String id) {
		String spice = null;
		try {
			connection();

			String sql = "select value from spice_data where mem_id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

			rs = psmt.executeQuery();
			
			if(rs.next()) {
				spice = rs.getString(1);
				System.out.println(spice);
			}
			
		} catch (Exception e) {

			System.out.println("spice 값 출력 실패");
			e.printStackTrace();

		} finally {
			close();
		}
		return spice;
	}
}
