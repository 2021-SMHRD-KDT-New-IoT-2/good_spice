<%@page import="com.model.MemberVO"%>
<%@page import="com.model.PostDAO"%>
<%@page import="com.model.PostVO"%>
<%@page import="java.io.PrintWriter"%>

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
		PostVO vo = new PostVO();
		
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		String post_name = request.getParameter("post_name");
	    String post_cont  = request.getParameter("post_cont");
	
		if(mvo != null){
			id = mvo.getid();
		}
		
		// 로그인을 한 사람만 글을 쓸 수 있도록 코드를 수정한다
		if(id == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}else{
				// 정상적으로 입력이 되었다면 글쓰기 로직을 수행한다
				PostDAO dao = new PostDAO();
				
				int cnt = dao.write(post_name, id, post_cont);
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
					script.println("location.href='main.jsp#POST'");
					script.println("</script>");
			}
		}
	
	%>
</body>
</html>