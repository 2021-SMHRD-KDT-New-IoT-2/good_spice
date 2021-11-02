<%@page import="java.util.ArrayList"%>
<%@page import="com.model.AnswerVO"%>
<%@page import="com.model.AnswerDAO"%>
<%@page import="com.model.QuesDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.model.MemberVO"%>
<%@page import="com.model.QuesVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
		// 현재 세션 상태를 체크한다
		
		request.setCharacterEncoding("euc-kr");

		String id = null;
		AnswerVO vo = new AnswerVO();
		
		QuesDAO Qdao = new QuesDAO();
		ArrayList<QuesVO> Qal = Qdao.QuesList();
		
		MemberVO mvo = (MemberVO)session.getAttribute("member");
	    String ans_cont  = request.getParameter("ans_cont");
	    int ques_num = Qal.get(0).getQues_num();
	
		if(mvo != null){
			id = mvo.getid();
		}
		
		// 로그인을 한 사람만 글을 쓸 수 있도록
		if(id == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href='main.jsp#Login'");
			script.println("</script>");
		}else if(id.equals("admin")){
			// 로그인하고 관리자일 경우
			AnswerDAO dao = new AnswerDAO();
			
			int cnt = dao.AnswerWrite(ans_cont,ques_num);
			// 데이터베이스 오류인 경우
			if(cnt == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패했습니다')");
				script.println("history.back()");
				script.println("</script>");
			// 글쓰기가 정상적으로 실행되면 알림창을 띄우고 게시판 메인으로 이동한다
			}else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기 성공')");
				script.println("location.href='main.jsp#QNA'");
				script.println("</script>");
			}
		}else{
			// 로그인하고 관리자가 아닐경우
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('관리자만 작성할수 있습니다.')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
	
	%>
</body>
</html>