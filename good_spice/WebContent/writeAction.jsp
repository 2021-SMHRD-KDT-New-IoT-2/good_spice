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
		// ���� ���� ���¸� üũ�Ѵ�
		
		request.setCharacterEncoding("euc-kr");

		String id = null;
		PostVO vo = new PostVO();
		
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		String post_name = request.getParameter("post_name");
	    String post_cont  = request.getParameter("post_cont");
	
		if(mvo != null){
			id = mvo.getid();
		}
		
		// �α����� �� ����� ���� �� �� �ֵ��� �ڵ带 �����Ѵ�
		if(id == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�α����� �ϼ���')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}else{
				// ���������� �Է��� �Ǿ��ٸ� �۾��� ������ �����Ѵ�
				PostDAO dao = new PostDAO();
				
				int cnt = dao.write(post_name, id, post_cont);
				// �����ͺ��̽� ������ ���
				if(cnt == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('�۾��⿡ �����߽��ϴ�')");
					script.println("history.back()");
					script.println("</script>");
				// �۾��Ⱑ ���������� ����Ǹ� �˸�â�� ���� �Խ��� �������� �̵��Ѵ�
				}else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('�۾��� ����')");
					script.println("location.href='main.jsp#POST'");
					script.println("</script>");
			}
		}
	
	%>
</body>
</html>