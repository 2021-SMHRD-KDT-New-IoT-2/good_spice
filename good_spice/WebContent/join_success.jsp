<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<body style="text-align: center;">
	<%
		String ID = (String)request.getAttribute("ID");
	%>		
		<!-- Menu -->
	
						<article id="Join_Success">		
							<h2 class="major">ȸ������ �Ϸ�</h2>
							<ul class="actions vertical">
							<li><h1>ȯ���մϴ�!</h1></li>
							<li><%=ID %>�� ȸ�������� �����մϴ�.</li>
							<li><a href="main.jsp">����������.</a></li>		
							</ul>
						</article>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>
	</body>
</html>

