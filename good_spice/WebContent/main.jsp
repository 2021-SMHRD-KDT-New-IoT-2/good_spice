<%@page import="com.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<html>
<head>
	<title>Best Moment</title>
	<meta charset="EUC-kr" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css"/>
	<noscript>
		<link rel="stylesheet" href="assets/css/noscript.css" />
	</noscript>
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
					<h1>Smart Spice</h1>
					<p> May your life be happy with this Spice </p>
				</div>
			</div>
			<nav>
				<ul class>
					<li><a href="#intro">Intro</a></li>
						<li><select onchange="if(this.value) location.href=(this.value);" id="select" onclick="menu()">
							<option disabled selected>Recipe</option>
							<option value="#KOREA">한식</option>
							<option value="#CHINA">중식</option>
							<option value="#USA">양식</option>
							<option value="#JAPAN">일식</option>
						</select></li>
						
						<script>
						function menu(){
							$("#select").val("Recipe");							
									}
						</script>
					<li><a href="#POST">Board</a></li>
					<li><a href="#QNA">Q&A</a></li>
					
					
					<%if(vo==null){%>
						<li><a href="#Login">Login</a></li>
						<li><a href="#Join">Join</a></li>
					<%}else { %>
						<script>
							alert("<%=vo.getnick() %> 님 환영합니다.");
						</script>
						
						<li><select onchange="if(this.value) location.href=(this.value);" id="selMypage" onclick="info()">
							<option disabled selected>Mypage</option>
							<option value="#ChangeInfo">정보수정</option>
							<option value="#CHINA">기기관리</option>
							
						</select></li>
						<script>
						function info(){
							$("#selMypage").val("Mypage");							
									}
						</script>
						
						
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
					<video controls muted poster="images/pic1.jpg">
					<source src="images/KakaoTalk_20211018_161606410.mp4" type="video/mp4">
				  </video></span>
					<P>저희 "스마트 양념통"은 요리를 보다 맛있게 만들기 위해 구상된 제품입니다.
					요리시 가장 어려운 간 맞추는 일을 보다 간편하게, 보다 완벽하게 할 수 있도록 돕는 기능 할 것입니다.</P>
					<br>
					<p>당신의 식탁에 행복이 가득하기를 바랍니다.</p>
					<p><a href="https://www.smhrd.or.kr/">구매처</a></p>
			</article>

			<!-- Recipe 한식 -->
			<article id="KOREA">
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

			<!-- Recipe 중식 -->
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

			<!-- Recipe 양식 -->
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

			<!-- Recipe 일식 -->
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
				
			<!-- 개인정보 수정 -->	
			<article id="ChangeInfo">
				<h2 class="major">개인정보 수정</h2>
				<form action="UpdateService" method="post">
					<h3>현재ID</h3><input name="id" type="text" placeholder="ID를 입력하세요" required="required">
							<br>
					<h3>PW</h3><input name="pw" type="password" placeholder="변경할 PW를 입력하세요" required="required">
					<br>
					<h3>NICK</h3><input name="nick" type="text" placeholder="변경할 NICK을 입력하세요" required="required">
					<br>
					<input type="submit" value="Change" class="button fit">
					</form>
				</span>				
			</article>
				
				
			<!-- Login 로그인 -->
			<article id="Login">
				<h2 class="major">Login</h2>
					<form action="LoginService" method="post">
						<h3>ID</h3><input name="id" type="text" placeholder="ID를 입력하세요" required="required">
						<br>
						<h3>PW</h3><input name="pw" type="password" placeholder="PW를 입력하세요" required="required">
						<br>
						<div style="text-align: center;">
							<input type="submit" value="LogIn" >
						</div>
					</form>
			</article>



			<!-- Join 회원가입 -->
			<article id="Join">
				<h2 class="major">Join</h2>
					<form action="JoinService" method="post">
						<input name="id" id="input_id" type="text" placeholder="ID를 입력하세요" required="required">
						<br>
						<input type="button" value="Id중복체크" onclick="idcheck()">									
						<br><br>
						<input name="pw" type="password" placeholder="PW를 입력하세요" required="required">
						<br>
						<input name="nick" type="text" placeholder="NICK를 입력하세요" required="required">
						<br>
						<div style="text-align: center;">
							<input type="submit" value="JoinUs" >
						</div>	
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
	<script>
	function idcheck(){
		let input = document.getElementById("input_id");
		
		$.ajax({
			type : "post", // 데이터 요청 방식 get/post
			data : {"id":input.value}, // 전송하는 데이터
			url : "IdCheckService", // 데이터를 요청하는 서버페이지 url
			dataType : "text", //응답데이터의 형식
			success : function(data){ // 성공했을 때, 함수 호출 function(전송 받은 값)
									
				if(data=="true"){
					//alert(sp.innerText="사용 불가능한 아이디 입니다.");
					alert("사용 불가능한 아이디 입니다.")
				}else{
					//alert(sp.innerText="사용 가능 한 아이디 입니다.");
					alert("사용 가능한 아이디 입니다.")
				}
			},
			error : function(){ // 실패
				alert("통신실패")
			}
		});
		
	}
	</script>
</body>

</html>