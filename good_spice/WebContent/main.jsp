<%@page import="com.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Best Moment</title>
<meta charset="EUC-kr" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
</head>

<body class="is-preload">
	<%
		//현재 로그인 상태인지 판별 (vo == null => 로그인하지 않은 상태)
	MemberVO vo = (MemberVO) session.getAttribute("member");
	%>

	<!-- Wrapper -->

	<div id="wrapper">

		<!-- Header -->
		<!-- Header -->
		<header id="header">
			<div class="logo">
				<span class="icon fa-gem"></span>
				<nav></nav>
			</div>
			<div class="content">
				<div class="inner">
					<h1>Smart Spice</h1>
					<p>May your life be happy with this Spice</p>
				</div>
			</div>
			<nav>
				<ul class>
					<li><a href="#intro">Intro</a></li>

					<li><select
						onchange="if(this.value) location.href=(this.value);" id="select"
						onclick="test()">
							<option disabled selected>Recipe</option>
							<option value="#KOREA">한식</option>
							<option value="#CHINA">중식</option>
							<option value="#USA">양식</option>
							<option value="#JAPAN">일식</option>
					</select></li>

					<script>
                  function test(){
                     $("#select").val("Recipe");                     
                           }
                  </script>

					<li><a href="#POST">Board</a></li>
					<li><a href="#QNA">Q&A</a></li>

					<%
						if (vo == null) {
					%>
					<li><a href="#Login">Login</a></li>
					<li><a href="#Join">Join</a></li>
					<%
						} else {
					%>
					<script>
                     alert("<%=vo.getid()%>
						님 환영합니다.");
					</script>

					<li><select
						onchange="if(this.value) location.href=(this.value);"
						id="selMypage" onclick="test()">
							<option disabled selected>Mypage</option>
							<option value="#KOREA">정보수정</option>
							<option value="#Product">기기관리</option>

					</select></li>
					<script>
						function test() {
							$("#selMypage").val("Mypage");
						}
					</script>


					<li><a href="LogoutService">Logout</a></li>
					<%}%>
				</ul>
			</nav>

		</header>
		<!-- 기기관리 -->
		

		<!-- Main -->
		<div id="main">
			<article id="Product">
			<h2 class="major">기기관리</h2>
			<form action="ProductService" method="post">
				<input name="Product" id="input_product" type="text"
					placeholder="제품번호를 입력하세요" required="required"> <br>
				<p align="center">양념을 선택하세요.</p>
				소금<input type="radio" name="asd" id="radio">
				설탕<input type="radio" name="asd" id="radio">
				후추<input type="radio" name="asd" id="radio">
				<style>
					#radio{
					
					}
				</style>
				<br> <br>
				<div style="text-align: center;">
					<input type="submit" value="저장"> <br>
				</div>
				<br>
				<br>
				<table>
					<tr>
						<td>제품번호</td>
						<td>양념</td>
					</tr>
				</table>
			</form>
			</article>
			<article id="Mypage">
				<h2 class="major">Mypage</h2>

			</article>

			<!-- Intro 제품소개 -->
			<article id="intro">
				<h2 class="major">제품소개</h2>
				<span class="image main"> <video controls muted
						poster="/images/pic1.jpg">
						<source src="/images/KakaoTalk_20211018_161606410.mp4"
							type="video/mp4">
					</video></span>

				<P>제품소개.</P>
			</article>



			<!-- Recipe 한식 -->
			<article id="KOREA">
				<h2 class="major">한식</h2>
				<span class="image main"> 김치 <img src="/images/KOREA.jfif">
				</span>
			</article>

			<!-- Recipe 중식 -->
			<article id="CHINA">
				<h2 class="major">중식</h2>
				<span class="image main"> 짜장면 <img src="/images/CHINA.jfif">
				</span>
			</article>

			<!-- Recipe 양식 -->
			<article id="USA">
				<h2 class="major">양식</h2>
				<span class="image main"> 스테이크 <img src="/images/USA.jfif">
				</span>
			</article>

			<!-- Recipe 일식 -->
			<article id="JAPAN">
				<h2 class="major">일식</h2>
				<span class="image main"> <img src="/images/JAPAN.jfif">
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
					<h3>ID</h3>
					<input name="id" type="text" placeholder="ID를 입력하세요"
						required="required"> <br>
					<h3>PW</h3>
					<input name="pw" type="password" placeholder="PW를 입력하세요"
						required="required"> <br> <input type="submit"
						value="LogIn" class="button fit">
				</form>
			</article>



			<!-- Join 회원가입 -->
			<article id="Join">
				<h2 class="major">Join</h2>
				<form action="JoinService" method="post">
					<input name="id" id="input_id" type="text" placeholder="ID를 입력하세요"
						required="required"> <br> <input type="button"
						value="Id중복체크" onclick="idcheck()"> <br>
					<br> <input name="pw" type="password" placeholder="PW를 입력하세요"
						required="required"> <br> <input name="nick"
						type="text" placeholder="NICK를 입력하세요" required="required">
					<br> <input type="submit" value="JoinUs" class="button fit">
				</form>
			</article>
		</div>
		<!-- Main 끝 -->




		<!-- Footer -->
		<footer id="footer">
			<p class="copyright">
				&copy; Untitled. Design: <a href="https://naver.com">네이버</a>.
			</p>
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
	<script>
		function idcheck() {
			let input = document.getElementById("input_id");

			$.ajax({
				type : "post", // 데이터 요청 방식 get/post
				data : {
					"id" : input.value
				}, // 전송하는 데이터
				url : "IdCheckService", // 데이터를 요청하는 서버페이지 url
				dataType : "text", //응답데이터의 형식
				success : function(data) { // 성공했을 때, 함수 호출 function(전송 받은 값)

					if (data == "true") {
						//alert(sp.innerText="사용 불가능한 아이디 입니다.");
						alert("사용 불가능한 아이디 입니다.")
					} else {
						//alert(sp.innerText="사용 가능 한 아이디 입니다.");
						alert("사용 가능한 아이디 입니다.")
					}
				},
				error : function() { // 실패
					alert("통신실패")
				}
			});

		}
	</script>
</body>

</html>