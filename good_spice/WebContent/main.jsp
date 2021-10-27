<%@page import="com.model.MemberVO"%>
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

<style>
.Recipe
</style>

</head>

<body class="is-preload">
		<%
			//���� �α��� �������� �Ǻ� (vo == null => �α������� ���� ����)
			MemberVO vo =(MemberVO)session.getAttribute("member");
		%>

	<!-- Wrapper -->
	
	<div id="wrapper">
		
		<!-- Header -->
		<header id="header">
			<div class="logo">
				<span class="icon fa-gem"></span>
				<nav>
					
				</nav>
			</div>
			<div class="content">
				<div class="inner">
					<h1>Best-Moment</h1>
					<p>May your life be happy with this food </p>
				</div>
			</div>
			<nav>
				<ul>
					<li><a href="#intro">Intro</a></li>
					<select onchange="if(this.value) location.href=(this.value);" class="select">
						<option disabled selected>Recipe</option>
						<option value="#KOREA">�ѽ�</option>
						<option value="#CHINA">�߽�</option>
						<option value="#USA">���</option>
						<option value="#JAPAN">�Ͻ�</option>
					  </select>
					<li><a href="#POST">Board</a></li>
					<li><a href="#QNA">Q&A</a></li>

					<%if(vo==null){%>
						<li><a href="#Login">Login</a></li>
						<li><a href="#Join">Join</a></li>
						<%}else{ %>
						<li><a href="#Mypage">Mypage</a></li>
						<li><a href="LogoutService">Logout</a></li>
						<%}%>
					
				</ul>
			</nav>
			
		</header>
		
		<!-- Main -->
		<div id="main">
		
			<article id="Mypage">
				<h2 class="major">Mypage</h2>
					
			</article>

			<!-- Intro ��ǰ�Ұ� -->
			<article id="intro">
				<h2 class="major">��ǰ�Ұ�</h2>
				<span class="image main">
					<video controls muted poster="/images/pic1.jpg">
					<source src="/images/KakaoTalk_20211018_161606410.mp4" type="video/mp4">
				  </video></span>
										
				<P>��ǰ�Ұ�.</P>
			</article>



			<!-- Recipe �ѽ� -->
			<article id="KOREA">
				<h2 class="major">�ѽ�</h2>
				<span class="image main">
					��ġ
					<img src="/images/KOREA.jfif">
				</span>				
			</article>

			<!-- Recipe �߽� -->
			<article id="CHINA">
				<h2 class="major">�߽�</h2>
				<span class="image main">
					¥���
					<img src="/images/CHINA.jfif">
				</span>				
			</article>

			<!-- Recipe ��� -->
			<article id="USA">
				<h2 class="major">���</h2>
				<span class="image main">
					������ũ
					<img src="/images/USA.jfif">
				</span>				
			</article>

			<!-- Recipe �Ͻ� -->
			<article id="JAPAN">
				<h2 class="major">�Ͻ�</h2>
				<span class="image main">
					<img src="/images/JAPAN.jfif">
					����
				</span>				
			</article>



			<!-- Board �Խ��� -->
			<article id="POST">
				<h1 class="major">�Խ���</h1>
				<span class="image main">
					<table>
						<tr>
							<th>��ȣ</th>
							<th>����</th>
							<th>�ۼ���</th>
							<th>��ȸ��</th>
						</tr>
	
						<tr>
							<td>1</td>
							<td>�����</td>
							<td>����</td>
							<td>11111</td>
						</tr>
					</table>
	
				</span>				
			</article>



			<!-- Q&A -->
			<article id="QNA">
				<h1 class="major">Q&A</h1>
					<table>
						<tr>
							<th>��ȣ</th>
							<th>����</th>
							<th>�ۼ���</th>
							<th>��ȸ��</th>
						</tr>
	
						<tr>
							<td>1</td>
							<td>�����</td>
							<td>����</td>
							<td>11111</td>
						</tr>
					</table>
			</article>
				
				
				
			<!-- Login �α��� -->
			<article id="Login">
				<h2 class="major">Login</h2>
					<form action="LoginService" method="post">
						<h3>ID</h3><input name="id" type="text" placeholder="ID�� �Է��ϼ���">
						<br>
						<h3>PW</h3><input name="pw" type="password" placeholder="PW�� �Է��ϼ���">
						<br>
						<input type="submit" value="LogIn" class="button fit">
					</form>
			</article>



			<!-- Join ȸ������ -->
			<article id="Join">
				<h2 class="major">Join</h2>
					<form action="JoinService" method="post">
						<input name="id" id="input_email" type="text" placeholder="ID�� �Է��ϼ���">
						<br>
						<input type="button" value="Email�ߺ�üũ" onclick="emailcheck()">									
						<br><br>
						<input name="pw" type="password" placeholder="PW�� �Է��ϼ���">
						<br>
						<input name="nick" type="text" placeholder="NICK�� �Է��ϼ���">
						<br>
						<input type="submit" value="JoinUs" class="button fit">
					</form>			
			</article>	
		</div> 
		<!-- Main �� -->




		<!-- Footer -->
		<footer id="footer">
			<p class="copyright">&copy; Untitled. Design: <a href="https://naver.com">���̹�</a>.</p>
		</footer>
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