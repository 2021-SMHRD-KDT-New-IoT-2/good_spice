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
		// ���� ���� ���¸� üũ�Ѵ�
		
		request.setCharacterEncoding("euc-kr");

		String id = null;
		QuesVO vo = new QuesVO();
		
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		String ques_name = request.getParameter("ques_name");
	    String ques_cont  = request.getParameter("ques_cont");
	
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
				QuesDAO dao = new QuesDAO();
				
				int cnt = dao.QuesWrite(ques_name, id, ques_cont);
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
					script.println("location.href='main.jsp#QNA'");
					script.println("</script>");
			}
		}
	
	%>
</body>
</html>