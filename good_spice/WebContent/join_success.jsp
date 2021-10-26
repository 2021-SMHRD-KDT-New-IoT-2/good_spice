<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
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

	<!-- Wrapper -->
	
	<div id="wrapper">
		
	<%
		String ID = (String)request.getAttribute("ID");
	%>		
		<!-- Menu -->
		<span><h1><%=ID %>���� ȸ�������� ȯ���մϴ�.</h1></span>
		<h3><a href="main.jsp">����������</a>	</h3>					
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