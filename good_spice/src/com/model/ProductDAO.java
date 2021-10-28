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
//	제품 중복체크
	public boolean prodCheck(String id) {
		try {
			connection();
//			3. 실행할 sql문 정의 (실행할때마다 값이 달라지는 부분은 ? 작성)
			String sql = "select PRODOUCT from spice_data where PRODOUCT=?";
			
//			4. sql문 실행객체 (PreparedStatment)생성
			psmt = conn.prepareStatement(sql);
			
//			5. 바인드 변수(?) 채우기
			psmt.setString(1, id);
			
//			6. sql문 실행 후 결과처리
			rs = psmt.executeQuery();
			
			if(rs.next()){
				//입력한 이메일을 사용할 수 없을때
				check=true;
			}else {
				//입력한 이메일을 사용할 수 있을때
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

			String sql = "select prodouct, salt, sugar, pepper from spice_data where MEM_ID=?";
			psmt = conn.prepareStatement(sql);
			
			 psmt.setString(1, mem_id); 
			
			rs = psmt.executeQuery();
			//psmt.setString(1, id);
			
			while (rs.next()) {
				String get_product = rs.getString("prodouct");
				String get_spice = null;
					if(rs.getString(2).equals("1")) {
						get_spice = "소금";
					}else if(rs.getString(3).equals("1")) {
						get_spice = "설탕";
					}else if(rs.getString(4).equals("1")) {
						get_spice = "후추";
					}

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
						
			
	//			4. sql문 실행객체 (PreparedStatment)생성
				psmt = conn.prepareStatement(sql);

				psmt.setString(1, product);
	//			6. sql문 실행 후 결과처리
				cnt = psmt.executeUpdate();
				
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();	
		}
		return cnt;
	}
}
