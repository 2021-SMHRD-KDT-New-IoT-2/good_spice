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
		// ���� ���� ���¸� üũ�Ѵ�
		
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
		
		// �α����� �� ����� ���� �� �� �ֵ���
		if(id == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�α����� �ϼ���')");
			script.println("location.href='main.jsp#Login'");
			script.println("</script>");
		}else if(id.equals("admin")){
			// �α����ϰ� �������� ���
			AnswerDAO dao = new AnswerDAO();
			
			int cnt = dao.AnswerWrite(ans_cont,ques_num);
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
		}else{
			// �α����ϰ� �����ڰ� �ƴҰ��
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�����ڸ� �ۼ��Ҽ� �ֽ��ϴ�.')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
	
	%>
</body>
</html>