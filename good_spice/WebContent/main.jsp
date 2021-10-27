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
			//현재 로그인 상태인지 판별 (vo == null => 로그인하지 않은 상태)
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
						<option value="#KOREA">한식</option>
						<option value="#CHINA">중식</option>
						<option value="#USA">양식</option>
						<option value="#JAPAN">일식</option>
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

			<!-- Intro 제품소개 -->
			<article id="intro">
				<h2 class="major">제품소개</h2>
				<span class="image main">
					<video controls muted poster="/images/pic1.jpg">
					<source src="/images/KakaoTalk_20211018_161606410.mp4" type="video/mp4">
				  </video></span>
										
				<P>제품소개.</P>
			</article>



			<!-- Recipe 한식 -->
			<article id="KOREA">
				<h2 class="major">한식</h2>
				<span class="image main">
					김치
					<img src="/images/KOREA.jfif">
				</span>				
			</article>

			<!-- Recipe 중식 -->
			<article id="CHINA">
				<h2 class="major">중식</h2>
				<span class="image main">
					짜장면
					<img src="/images/CHINA.jfif">
				</span>				
			</article>

			<!-- Recipe 양식 -->
			<article id="USA">
				<h2 class="major">양식</h2>
				<span class="image main">
					스테이크
					<img src="/images/USA.jfif">
				</span>				
			</article>

			<!-- Recipe 일식 -->
			<article id="JAPAN">
				<h2 class="major">일식</h2>
				<span class="image main">
					<img src="/images/JAPAN.jfif">
					쑤시
				</span>				
			</article>



			<!-- Board 게시판 -->
			<article id="POST">
				<h1 class="major">게시판</h1>
				<span class="image main">
					<table>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
						</tr>
	
						<tr>
							<td>1</td>
							<td>힘들어</td>
							<td>성민</td>
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
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
						</tr>
	
						<tr>
							<td>1</td>
							<td>힘들어</td>
							<td>성민</td>
							<td>11111</td>
						</tr>
					</table>
			</article>
				
				
				
			<!-- Login 로그인 -->
			<article id="Login">
				<h2 class="major">Login</h2>
					<form action="LoginService" method="post">
						<h3>ID</h3><input name="id" type="text" placeholder="ID를 입력하세요">
						<br>
						<h3>PW</h3><input name="pw" type="password" placeholder="PW를 입력하세요">
						<br>
						<input type="submit" value="LogIn" class="button fit">
					</form>
			</article>



			<!-- Join 회원가입 -->
			<article id="Join">
				<h2 class="major">Join</h2>
					<form action="JoinService" method="post">
						<input name="id" id="input_email" type="text" placeholder="ID를 입력하세요">
						<br>
						<input type="button" value="Email중복체크" onclick="emailcheck()">									
						<br><br>
						<input name="pw" type="password" placeholder="PW를 입력하세요">
						<br>
						<input name="nick" type="text" placeholder="NICK를 입력하세요">
						<br>
						<input type="submit" value="JoinUs" class="button fit">
					</form>			
			</article>	
		</div> 
		<!-- Main 끝 -->




		<!-- Footer -->
		<footer id="footer">
			<p class="copyright">&copy; Untitled. Design: <a href="https://naver.com">네이버</a>.</p>
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