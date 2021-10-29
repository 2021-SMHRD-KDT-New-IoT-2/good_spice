package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

public class MemberDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	MemberVO vo = null;
	ArrayList<MemberVO> al =null;
	boolean check= false;
	int cnt = 0;
//	��������
	public void connection() {
	
		try {
			//1. ����̹� �����ε�
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
//			2. �����ͺ��̽� ���� ��ü ����

			String url="jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String dbid="campus_b_2_1025";
			String dbpw="smhrd2";
			
			conn = DriverManager.getConnection(url,dbid,dbpw);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("�������");
		}
		
	}
//	���Ӳ���
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
// 	����
	public int join(String id,String pw,String nick) {
		
		try {
			
			connection();
			
//			3. ������ sql�� ���� (�����Ҷ����� ���� �޶����� �κ��� ? �ۼ�)
			String sql = "insert into MEMBER values (?,?,?)";
			
//			4. sql�� ���ఴü (PreparedStatment)����
			psmt = conn.prepareStatement(sql);
			
//			5. ���ε� ����(?) ä���
			psmt.setString(1,id);
			psmt.setString(2,pw);
			psmt.setString(3,nick);
			
			
//			6. sql�� ���� �� ���ó��
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			
			System.out.println("���Խ���");
			e.printStackTrace();
			
		}finally {
			close();
		}
		return cnt;
	}
//	�α���
	public MemberVO login(String id, String pw) {

		try {
			connection();
//			3. ������ sql�� ���� (�����Ҷ����� ���� �޶����� �κ��� ? �ۼ�)
			String sql = "select * from MEMBER where MEM_ID=? and MEM_PW=?";
			
//			4. sql�� ���ఴü (PreparedStatment)����
			psmt = conn.prepareStatement(sql);
			
//			5. ���ε� ����(?) ä���
			psmt.setString(1,id);
			psmt.setString(2,pw);
			
//			6. sql�� ���� �� ���ó��
			rs = psmt.executeQuery();
			
			if(rs.next()){
				System.out.println("�α��μ���!");	
				
				String get_id = rs.getString("MEM_ID");
				String get_pw = rs.getString("MEM_PW");
				String get_nick = rs.getString("MEM_NICK");
				
				vo = new MemberVO(get_id,get_pw,get_nick);
//				
			}else {
				System.out.println("�α��ν���!");
			}	
		} catch (Exception e) {
			System.out.println("�α��ν���");
			e.printStackTrace();
			
		}finally {
			close();
		}
		return vo;
	}
//	���� = ����ڰ� �Է��� pw,tel,address�� ���̺��� ���� ����
	public int update(String id ,String pw,String nick) {
		try {
			connection();
			
//			3. ������ sql�� ���� (�����Ҷ����� ���� �޶����� �κ��� ? �ۼ�)
			String sql = "UPDATE MEMBER SET MEM_PW = ?, MEM_NICK=? WHERE MEM_ID = ?";
			
//			4. sql�� ���ఴü (PreparedStatment)����
			psmt = conn.prepareStatement(sql);
			
//			5. ���ε� ����(?) ä���
			
			psmt.setString(1,pw);
			psmt.setString(2,nick);
			psmt.setString(3,id);
			
//			6. sql�� ���� �� ���ó��
			cnt = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("��������");
			e.printStackTrace();
			
		}finally {
			close();
		}
		return cnt;
	}
//  ȸ������ ����
	public ArrayList<MemberVO> selectAll() {
		try {
//			ȸ�������� ������ ArrayList
			al = new ArrayList<MemberVO>();
			
			connection();
//			3. ������ sql�� ���� (�����Ҷ����� ���� �޶����� �κ��� ? �ۼ�)
			String sql = "select MEM_ID,MEM_PW,MEM_NICK from MEMBER ";
			
//			4. sql�� ���ఴü (PreparedStatment)����
			psmt = conn.prepareStatement(sql);

//			6. sql�� ���� �� ���ó��
			rs = psmt.executeQuery();
			
			while(rs.next()){
				
				String get_id = rs.getString("MEM_ID");
				String get_pw = rs.getString("MEM_PW");
				String get_nick = rs.getString("MEM_NICK");
				
				vo = new MemberVO(get_id,get_pw,get_nick);	
//				vo���� al�� add
				al.add(vo);
			}
				
		} catch (Exception e) {
			System.out.println("��ȸ����");
			e.printStackTrace();
			
		}finally {
			close();
		}
		return al;
	}
//	ȸ�� ����
	public int delete(String id) {
//		�����Ϸ� => �����Ϸ�!
//		�����̿Ϸ� => ��������!
		try {
			connection();
			
				String sql = "DELETE from MEMBER where MEM_ID=?";
						
			
	//			4. sql�� ���ఴü (PreparedStatment)����
				psmt = conn.prepareStatement(sql);

				psmt.setString(1, id);
	//			6. sql�� ���� �� ���ó��
				cnt = psmt.executeUpdate();
				
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();	
		}
		return cnt;
	}
//	���̵� �ߺ�üũ
	public boolean idCheck(String id) {
		try {
			connection();
//			3. ������ sql�� ���� (�����Ҷ����� ���� �޶����� �κ��� ? �ۼ�)
			String sql = "select * from MEMBER where MEM_ID=?";
			
//			4. sql�� ���ఴü (PreparedStatment)����
			psmt = conn.prepareStatement(sql);
			
//			5. ���ε� ����(?) ä���
			psmt.setString(1,id);
			
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


}

	