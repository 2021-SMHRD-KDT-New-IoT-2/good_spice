<%@page import="com.model.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Dimension by HTML5 UP</title>
	<meta charset="EUC-kr" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css"/>
	<noscript>
		<link rel="stylesheet" href="assets/css/noscript.css" />
	</noscript>
</head>
<body class="is-preload">
	<%
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberVO> al = dao.selectAll();
		System.out.print(al.size());
	%>
	<!-- Wrapper -->
	
	<div id="wrapper">
			<h3><a href="main.jsp">WantS</a></h3>
				<h2 class="major">회원관리</h2>
				<table>
					<tr>
						<td>ID</td>
						<td>PW</td>
						<td>NICK</td>
						<td>Delete</td>
					</tr>
				<%for(MemberVO vo:al){%>
					<tr>
						<td><%=vo.getid() %></td>
						<td><%=vo.getpw() %></td>
						<td><%=vo.getnick() %></td>
						<td><a href="DeleteService?id=<%=vo.getid()%>" onclick="if(!confirm('삭제 하시겠습니까?')){return false;}">삭제</a></td>
					</tr>
				<%}%>
				</table>	
</div>
<!-- BG -->
	<div id="bg"></div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>