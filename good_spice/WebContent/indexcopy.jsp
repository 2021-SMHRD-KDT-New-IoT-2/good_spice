<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/css/main.css"/>
	<noscript>
		<link rel="stylesheet" href="assets/css/noscript.css" />
	</noscript>
</head>
<body class="is-preload">

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
					<h1>Smart Spice</h1>
					<p>May your life be happy with this Spice </p>
				</div>
			</div>
			<nav>
				<ul>
					<li><a href="#intro">Intro</a></li>
					<li><select onchange="if(this.value) location.href=(this.value);" class="select">
						<option disabled selected>Recipe</option>
						<option value="#KOREA">한식</option>
						<option value="#CHINA">중식</option>
						<option value="#USA">양식</option>
						<option value="#JAPAN">일식</option>
					  </select></li>
					<li><a href="#POST">Board</a></li>
					<li><a href="#QNA">Q&A</a></li>
					<li><a href="#Login">Login</a></li>
					<li><a href="#Join">Join</a></li>
					<!--<li><a href="#elements">Elements</a></li>-->
				</ul>
			</nav>
		</header>
		
		<!-- Main -->
		<div id="main">

			<!-- Intro -->
			<article id="intro">
				<h2 class="major">제품소개</h2>
								  
				<span class="image main">
					<video controls muted poster="images/pic1.jpg">
					<source src="/images/KakaoTalk_20211018_161606410.mp4" type="video/mp4">
				  </video></span>
										
				<P>저희 "스마트 양념통"은 요리를 보다 맛있게 만들기 위해 구상된 제품입니다.
					요리시 가장 어려운 간 맞추는 일을 보다 간편하게, 보다 완벽하게 할 수 있도록 돕는 기능 할 것입니다.</P>
					<br>
					<p>당신의 식탁에 행복이 가득하기를 바랍니다.</p>
					<p><a href="https://www.smhrd.or.kr/">구매처</a></p>
			</article>

			<!-- 한식-->
		<article id="KOREA" >
			<h2 class="major">한식</h2>
			<span id="move" >
				<a href="#CHINA">중식</a>
				<a href="#USA">양식</a>
				<a href="#JAPAN">일식</a>
			</span>
			<span class="image main">
				김치찌개
				<a href="http://127.0.0.1:5502/list.html"target="_blank"><img src="images/KOREA.jfif"></a>
			</span>	
			<span class="image main">
				된장찌개
				<img src="images/been.jpg">
			</span>	
			<span class="image main">
				김치볶음밥
				<img src="images/bokk.jpg">
			</span>				
		</article>


		

		<!-- 중식 -->
		<article id="CHINA">
			<h2 class="major">중식</h2>
			<span id="move">
				<a href="#KOREA">한식</a>
				<a href="#USA">양식</a>
				<a href="#JAPAN">일식</a>
			</span>
			<span class="image main">
				짜장면
				<img src="images/CHINA.jfif">
			</span>	
			<span class="image main">
				짬뽕
				<img src="images/jjam.jfif">
			</span>	
			<span class="image main">
				탕수육
				<img src="images/tang.jfif">
			</span>				
		</article>

		<!-- 양식-->
		<article id="USA">
			<h2 class="major">양식</h2>
			<span id="move">
				<a href="#CHINA">중식</a>
				<a href="#KOREA">한식</a>
				<a href="#JAPAN">일식</a>
			</span>
			<span class="image main">
				스테이크
				<img src="images/USA.jfif">
			</span>
			<span class="image main">
				맥앤치즈
				<img src="images/mac.jpg">
			</span>	
			<span class="image main">
				스파게티
				<img src="images/spaghetti.jfif">
			</span>					
		</article>

		<!-- 일식 -->
		<article id="JAPAN">
			<h2 class="major">일식</h2>
			<span id="move">
				<a href="#CHINA">중식</a>
				<a href="#USA">양식</a>
				<a href="#KOREA">한식</a>
			</span>
			<span class="image main">
				스시
				<img src="images/JAPAN.jfif">				
			</span>
			<span class="image main">
				우동
				<img src="images/udon.png">
			</span>	
			<span class="image main">
				오코노미야끼
				<img src="images/oko.jpg">

			</span>					
		</article>

		<!-- 게시판 -->
		<article id="POST">
			<a href="list.html"><h1 class="major">게시판</h1></a>
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
					<tr>
						<td>1</td>
						<td>힘들어</td>
						<td>성민</td>
						<td>11111</td>
					</tr>
					<tr>
						<td>1</td>
						<td>힘들어</td>
						<td>성민</td>
						<td>11111</td>
					</tr>
					<tr>
						<td>1</td>
						<td>힘들어</td>
						<td>성민</td>
						<td>11111</td>
					</tr>
					<tr>
						<td>1</td>
						<td>힘들어</td>
						<td>성민</td>
						<td>11111</td>
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

		<article id="QNA">
			<h1 class="major">Q&A</h1>
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
		</article>
				
				
				<article id="Login">
					<form>
						<h2 class="major">Login</h2>
						<h3>ID</h3>
						<input type="text">
						<br>
						<h3>PW</h3>
						<input type="password">	
						<br>		
						<div style="text-align: center;">
							<input type="submit" value="로그인" >
						</div>
					</form>
				</article>

				<article id="Join">
					<form  >
						<h2 class="major">Join</h2>
						<h3>ID</h3>
						<input type="text">
						<br>
						<h3>PW</h3>
						<input type="password">	
						<br>
						<h3>Nick</h3>	
						<input type="text">
						<br>
						<div style="text-align: center;">
							<input type="submit" value="회원가입" >
						</div>	
				 	</form>	
				</article>
					
			
			</span>				
		</article>

		
		</div>

		

		<!-- Footer -->
		<footer id="footer">
			<p class="copyright">&copy; Untitled. Design: <a href="https://www.smhrd.or.kr/">스인재</a>.</p>
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