<%@page import="com.model.ProductVO"%>
<%@page import="com.model.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.MemberDAO"%>
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
	<!-- 멤버 -->
	<%	
	MemberVO vo = (MemberVO) session.getAttribute("member");
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberVO> al = dao.selectAll();
	
	//<!-- 제품 -->

	ProductDAO Pdao = new ProductDAO();
	ArrayList<ProductVO> Pal =new ArrayList<ProductVO>();
	if(vo!=null){
	Pal = Pdao.selectAll(vo.getid());
	}
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
					<%if (vo != null) {%>
					<%String GetId = vo.getid();%>
						<%if (GetId.equals("admin")) {%>
						<h2>관리자님 환영합니다</h2>
						<%} else {%>
						<h2><%=vo.getid() %>님 환영합니다</h2>
						<%} %>
						<%} %>
				</div>
			</div>
			<nav>
				<ul class>
					<li><a href="#intro">Intro</a></li>


					<li><select onchange="if(this.value) location.href=(this.value);" id="select"

						onclick="menu()">

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
					<li><a href="#POST">Post</a></li>
					<li><a href="#QNA">Q&A</a></li>


					<%if (vo == null) {%>
					
					<li><a href="#Login">Login</a></li>
					<li><a href="#Join">Join</a></li>
					
					<%} else {%>

					<%String GetIdd = vo.getid();%>
						<%if (GetIdd.equals("admin")) {%>
						
						<li><select
							onchange="if(this.value) location.href=(this.value);"
							id="Adminpage" onclick="admin()">
								<option disabled selected>Admin</option>
								<option value="#recipepost">레시피</option>
								<option value="#MemberInfo">회원정보</option>
						</select></li>
	
						<script>
									function admin(){
										$("#Adminpage").val("Admin");					
												}
									</script>
	
						<li><a href="LogoutService">Logout</a></li>

					<%} else {%>


					<li><select
						onchange="if(this.value) location.href=(this.value);"
						id="selMypage" onclick="info()">
							<option disabled selected>Mypage</option>
							<option value="#ChangeInfo">정보수정</option>
							<option value="#Product">기기관리</option>
					</select></li>

					<script>
						function info() {
							$("#selMypage").val("Mypage");
						}
					</script>

					<li><a href="LogoutService">Logout</a></li>
					<%}%>
					<%}%>

				</ul>
			</nav>

		</header>
		<!-- header 끝 -->

		<!-- Main -->
		<div id="main">

			<!-- Intro 제품소개 -->
			<article id="intro">
				<h2 class="major">제품소개</h2>

				<span class="image main"> <video controls muted
						poster="images/pic1.jpg">
						<source src="images/KakaoTalk_20211018_161606410.mp4"
							type="video/mp4">
					</video></span>
				<P>저희 "스마트 양념통"은 요리를 보다 맛있게 만들기 위해 구상된 제품입니다. 요리시 가장 어려운 간 맞추는
					일을 보다 간편하게, 보다 완벽하게 할 수 있도록 돕는 기능 할 것입니다.</P>
				<br>
				<p>당신의 식탁에 행복이 가득하기를 바랍니다.</p>
				<p>
					<a href="https://www.smhrd.or.kr/">구매처</a>
				</p>

			</article>

			<!-- Recipe 한식 -->
			<article id="KOREA">
				<h2 class="major">한식</h2>

				<div style="text-align: right;">
					<a href="#CHINA">중식&ensp;</a> <a href="#USA">양식&ensp;</a> <a
						href="#JAPAN">일식</a>
				</div>
				<span class="image main"> 김치찌개 <a href="#kimchi"><img
						src="images/KOREA.jfif"></a>
				</span> <span class="image main"> 된장찌개 <a href="#beensoup"><img
						src="images/been.jpg"></a>
				</span> <span class="image main"> 김치볶음밥 <a href="#kimbok"><img
						src="images/bokk.jpg"></a>
				</span>
			</article>

			<!-- Recipe 중식 -->
			<article id="CHINA">
				<h2 class="major">중식</h2>

				<div style="text-align: right;">
					<a href="#KOREA">한식&ensp;</a> <a href="#USA">양식&ensp;</a> <a
						href="#JAPAN">일식</a>
				</div>
				<span class="image main"> 짜장면 <a href=#jja><img
						src="images/CHINA.jfif"></a>
				</span> <span class="image main"> 짬뽕 <a href=#bbong><img
						src="images/jjam.jfif"></a>
				</span> <span class="image main"> 탕수육 <a href=#tangsu><img
						src="images/tang.jfif"></a>
				</span>
			</article>

			<!-- Recipe 양식 -->
			<article id="USA">
				<h2 class="major">양식</h2>

				<div style="text-align: right;">
					<a href="#CHINA">중식&ensp;</a> <a href="#KOREA">한식&ensp;</a> <a
						href="#JAPAN">일식</a>
				</div>
				<span class="image main"> 스테이크 <a href=#steak><img
						src="images/USA.jfif"></a>
				</span> <span class="image main"> 마카로니앤치즈 <a href=#cheese><img
						src="images/mac.jpg"></a>
				</span> <span class="image main"> 스파게티 <a href=#pasta><img
						src="images/spaghetti.jfif"></a>
				</span>
			</article>

			<!-- Recipe 일식 -->
			<article id="JAPAN">
				<h2 class="major">일식</h2>

				<div style="text-align: right;">
					<a href="#CHINA">중식&ensp;</a> <a href="#USA">양식&ensp;</a> <a
						href="#KOREA">한식</a>
				</div>
				<span class="image main"> 초밥 <a href=#sushi><img
						src="images/JAPAN.jfif"></a>
				</span> <span class="image main"> 우동 <a href=#udon><img
						src="images/udon.png"></a>
				</span> <span class="image main"> 오코노미야끼 <a href=#oko><img
						src="images/oko.jpg"></a>
				</span>
			</article>

			<!-- 한식 레시피 페이지 -->
			<article id=kimchi>
				<a href=#KOREA><h2 class="major">한식</h2></a>
				<div style="text-align: right;">
					<a href="#KOREA">한식&ensp;</a> <a href="#CHINA">중식&ensp;</a> <a
						href="#USA">양식&ensp;</a> <a href="#JAPAN">일식</a>
				</div>
				<h3>김치찌개</h3>
				<span class="image main"> <a><img src="images/KOREA.jfif"></a>
				</span>
				<div>
					<ul>
						<li>소금 10g</li>
						<li>설탕 10g</li>
						<li>설탕 10g</li>
					</ul>
				</div>
				<div>
					<p align="center">
						<input type="button" href="#" value="전송">
					</p>
				</div>
			</article>

			<article id=beensoup>
				<h2 class="major">
					<a href=#KOREA>한식</a>
				</h2>
				<div style="text-align: right;">
					<a href="#KOREA">한식&ensp;</a> <a href="#CHINA">중식&ensp;</a> <a
						href="#USA">양식&ensp;</a> <a href="#JAPAN">일식</a>
				</div>
				<h3>된장찌개</h3>
				<span class="image main"> <a><img src="images/been.jpg"></a>
				</span>
				<div>
					<ul>
						<li>소금 10g</li>
						<li>설탕 10g</li>
						<li>설탕 10g</li>
					</ul>
				</div>
				<div>
					<p align="center">
						<input type="button" href="#" value="전송">
					</p>
				</div>
			</article>

			<article id=kimbok>
				<a href=#KOREA><h2 class="major">한식</h2></a>
				<div style="text-align: right;">
					<a href="#KOREA">한식&ensp;</a> <a href="#CHINA">중식&ensp;</a> <a
						href="#USA">양식&ensp;</a> <a href="#JAPAN">일식</a>
				</div>
				<h>김치볶음밥
				</h3>
				<span class="image main"> <a><img src="images/bokk.jpg"></a>
				</span>
				<div>
					<ul>
						<li>소금 10g</li>
						<li>설탕 10g</li>
						<li>설탕 10g</li>
					</ul>
				</div>
				<div>
					<p align="center">
						<input type="button" href="#" value="전송">
					</p>
				</div>
			</article>

			<!-- 중식 레시피 페이지 -->
			<article id=jja>
				<a href=#CHINA><h2 class="major">중식</h2></a>
				<div style="text-align: right;">
					<a href="#KOREA">한식&ensp;</a> <a href="#CHINA">중식&ensp;</a> <a
						href="#USA">양식&ensp;</a> <a href="#JAPAN">일식</a>
				</div>
				<h>짜장면
				</h3>
				<span class="image main"> <a><img src="images/CHINA.jfif"></a>
				</span>
				<div>
					<ul>
						<li>소금 10g</li>
						<li>설탕 10g</li>
						<li>설탕 10g</li>
					</ul>
				</div>
				<div>
					<p align="center">
						<input type="button" href="#" value="전송">
					</p>
				</div>
			</article>

			<article id=bbong>
				<a href=#CHINA><h2 class="major">중식</h2></a>
				<div style="text-align: right;">
					<a href="#KOREA">한식&ensp;</a> <a href="#CHINA">중식&ensp;</a> <a
						href="#USA">양식&ensp;</a> <a href="#JAPAN">일식</a>
				</div>
				<h>짬뽕
				</h3>
				<span class="image main"> <a><img src="images/jjam.jfif"></a>
				</span>
				<div>
					<ul>
						<li>소금 10g</li>
						<li>설탕 10g</li>
						<li>설탕 10g</li>
					</ul>
				</div>
				<div>
					<p align="center">
						<input type="button" href="#" value="전송">
					</p>
				</div>
			</article>

			<article id=tangsu>
				<a href=#CHINA><h2 class="major">중식</h2></a>
				<div style="text-align: right;">
					<a href="#KOREA">한식&ensp;</a> <a href="#CHINA">중식&ensp;</a> <a
						href="#USA">양식&ensp;</a> <a href="#JAPAN">일식</a>
				</div>
				<h3>탕수육</h3>
				<span class="image main"> <a><img src="images/tang.jfif"></a>
				</span>
				<div>
					<ul>
						<li>소금 10g</li>
						<li>설탕 10g</li>
						<li>설탕 10g</li>
					</ul>
				</div>
				<div>
					<p align="center">
						<input type="button" href="#" value="전송">
					</p>
				</div>
			</article>

			<!-- 양식 레시피 페이지 -->
			<article id=steak>
				<a href=#USA><h2 class="major">양식</h2></a>
				<div style="text-align: right;">
					<a href="#KOREA">한식&ensp;</a> <a href="#CHINA">중식&ensp;</a> <a
						href="#USA">양식&ensp;</a> <a href="#JAPAN">일식</a>
				</div>
				<h>스테이크
				</h3>
				<span class="image main"> <a><img src="images/USA.jfif"></a>
				</span>
				<div>
					<ul>
						<li>소금 10g</li>
						<li>설탕 10g</li>
						<li>설탕 10g</li>
					</ul>
				</div>
				<div>
					<p align="center">
						<input type="button" href="#" value="전송">
					</p>
				</div>
			</article>

			<article id=cheese>
				<a href=#USA><h2 class="major">양식</h2></a>
				<div style="text-align: right;">
					<a href="#KOREA">한식&ensp;</a> <a href="#CHINA">중식&ensp;</a> <a
						href="#USA">양식&ensp;</a> <a href="#JAPAN">일식</a>
				</div>
				<h>마카로니앤치즈
				</h3>
				<span class="image main"> <a><img src="images/mac.jpg"></a>
				</span>
				<div>
					<ul>
						<li>소금 10g</li>
						<li>설탕 10g</li>
						<li>설탕 10g</li>
					</ul>
				</div>
				<div>
					<p align="center">
						<input type="button" href="#" value="전송">
					</p>
				</div>
			</article>

			<article id=pasta>
				<a href=#USA><h2 class="major">양식</h2></a>
				<div style="text-align: right;">
					<a href="#KOREA">한식&ensp;</a> <a href="#CHINA">중식&ensp;</a> <a
						href="#USA">양식&ensp;</a> <a href="#JAPAN">일식</a>
				</div>
				<h>스파게티
				</h3>
				<span class="image main"> <a><img
						src="images/spaghetti.jfif"></a>
				</span>
				<div>
					<ul>
						<li>소금 10g</li>
						<li>설탕 10g</li>
						<li>설탕 10g</li>
					</ul>
				</div>
				<div>
					<p align="center">
						<input type="button" href="#" value="전송">
					</p>
				</div>
			</article>

			<!-- 일식 레시피 페이지 -->
			<article id=sushi>
				<a href=#JAPAN><h2 class="major">일식</h2></a>
				<div style="text-align: right;">
					<a href="#KOREA">한식&ensp;</a> <a href="#CHINA">중식&ensp;</a> <a
						href="#USA">양식&ensp;</a> <a href="#JAPAN">일식</a>
				</div>
				<h>초밥
				</h3>
				<span class="image main"> <a><img src="images/JAPAN.jfif"></a>
				</span>
				<div>
					<ul>
						<li>소금 10g</li>
						<li>설탕 10g</li>
						<li>설탕 10g</li>
					</ul>
				</div>
				<div>
					<p align="center">
						<input type="button" href="#" value="전송">
					</p>
				</div>
			</article>

			<article id=udon>
				<a href=#JAPAN><h2 class="major">일식</h2></a>
				<div style="text-align: right;">
					<a href="#KOREA">한식&ensp;</a> <a href="#CHINA">중식&ensp;</a> <a
						href="#USA">양식&ensp;</a> <a href="#JAPAN">일식</a>
				</div>
				<h>우동
				</h3>
				<span class="image main"> <a><img src="images/udon.png"></a>
				</span>
				<div>
					<ul>
						<li>소금 10g</li>
						<li>설탕 10g</li>
						<li>설탕 10g</li>
					</ul>
				</div>
				<div>
					<p align="center">
						<input type="button" href="#" value="전송">
					</p>
				</div>
			</article>

			<article id=oko>
				<a href=#JAPAN><h2 class="major">일식</h2></a>
				<div style="text-align: right;">
					<a href="#KOREA">한식&ensp;</a> <a href="#CHINA">중식&ensp;</a> <a
						href="#USA">양식&ensp;</a> <a href="#JAPAN">일식</a>
				</div>
				<h>오코노미야끼
				</h3>
				<span class="image main"> <a><img src="images/oko.jpg"></a>
				</span>
				<div>
					<ul>
						<li>소금 10g</li>
						<li>설탕 10g</li>
						<li>설탕 10g</li>
					</ul>
				</div>
				<div>
					<p align="center">
						<input type="button" href="#" value="전송">
					</p>
				</div>
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
							<th>작성일자</th>
						</tr>

						<tr>
							<td>1</td>
							<td>힘들어</td>
							<td>성민</td>
							<td></td>
						</tr>
					</table>

						<div>
							<p align="center"><input type="button" href="write.html" value="글쓰기"> </p>
						</div>
						
	
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
					<h3>현재ID</h3>
					<input name="id" type="text" placeholder="ID를 입력하세요" required="required"> <br>
					<h3>PW</h3>
					<input name="pw" type="password" placeholder="변경할 PW를 입력하세요"> <br>
					<h3>NICK</h3>
					<input name="nick" type="text" placeholder="변경할 NICK을 입력하세요"> <br> <input type="submit"
						value="Change" class="button fit">
				</form>
				</span>
			</article>


			<!-- Login 로그인 -->
			<article id="Login">
				<h2 class="major">Login</h2>

				<form action="LoginService" method="post">
					<h3>ID</h3>
					<input name="id" type="text" placeholder="ID를 입력하세요" required="required"> <br>
					<h3>PW</h3>
					<input name="pw" type="password" placeholder="PW를 입력하세요" required="required"> <br>
					<div style="text-align: center;">
						<input type="submit" value="LogIn">
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
						<input type="submit" value="JoinUs">
					</div>
				</form>
			</article>

			<!-- 기기관리 -->
			<article id="Product">
				<h2 class="major">기기관리</h2>
				<form action="ProductService" method="post">
					<input name="product" id="input_product" type="text" placeholder="제품번호를 입력하세요" required="required">
					<br>
					<div style="text-align: center;">
					<input type="button" value="제품번호중복체크" onclick="prodcheck()"> 
					</div>
					<br> 
					<br> <select name="spice">
						<option value="">양념을 선택하세요.</option>
						<option value="소금">소금</option>
						<option value="설탕">설탕</option>
						<option value="후추">후추</option>
					</select> <br>
					<div style="text-align: center;">
					<input type="submit" value="저장" onclick="alert('제품 등록이 완료 됐습니다.')"> <br>
					</div>
				</form>
				<br> <br>
				<table>
					<tr>
						<td>제품번호</td>
						<td>양념</td>
					</tr>
					<!-- 제품번호 출력 -->
					
					<%for(ProductVO pvo:Pal){%>
					
					<tr>
						<td><%= pvo.getProduct() %></td>
						<td><%= pvo.getSpice() %></td>
						<td><a href="DeleteProduct?product=<%=pvo.getProduct()%>" onclick="if(!confirm('삭제 하시겠습니까?')){return false;}">삭제</a></td>
					</tr>
				
					<%}%>
				</table>
				<br> <br>

				<form action="#" method="post">
					<input name="SpiceGram" id="input_gram" type="text"
						placeholder="양념의 양을 입력하세요." required="required"> <br>
					<div style="text-align: center;">
						<input type="submit" value="출력">
					</div>
				</form>


			</article>

			<!-- MemberInfo 회원정보 -->
			<article id="MemberInfo">
				<h2 class="major">회원관리</h2>
				<table>
					<tr>
						<td>ID</td>
						<td>PW</td>
						<td>NICK</td>
						<td>Delete</td>
					</tr>
					<%for(MemberVO mvo:al){%>
					<tr>
						<td><%=mvo.getid() %></td>
						<td><%=mvo.getpw() %></td>
						<td><%=mvo.getnick() %></td>
						<td><a href="DeleteService?id=<%=mvo.getid()%>" onclick="if(!confirm('삭제 하시겠습니까?')){return false;}">삭제</a></td>
					</tr>
					<%}%>
				</table>
			</article>

		
		<article id="recipepost">
				<h2 class="major">RecipePost</h2>
		
				<form action="RecipePost" method="post">
					<h3>요리 명</h3>
					<input name="rec_name" type="text" placeholder="요리 이름 입력" required="required">
					<br>
					<h3>소금</h3> 
					<input name="salt" type="text" placeholder="소금 양 입력" required="required"> 
					<br> 
					<h3>설탕</h3>
					<input name="sugar" type="text" placeholder="설탕 양 입력" required="required">
					<br>
					<h3>후추</h3>
					<input name="pepper" type="text" placeholder="후추 양 입력" required="required">
					<br>
					<div style="text-align: center;">
						<input type="submit" value="작성">
					</div>
				</form>
			</article>

		</div>
		<!-- Main 끝 -->


		<!-- Footer -->
		<footer id="footer">

			<p class="copyright">
				&copy; GOOD_SPICE : <a href="https://www.smhrd.or.kr" />스마트인재개발원</a>.
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
		/* id 중복 체크 */
		function idcheck() {
			let input = document.getElementById("input_id");

			$.ajax({
				type : "post", // 데이터 요청 방식 get/post
				data : {"id" : input.value}, // 전송하는 데이터
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
		
		/* 제품 중복 체크 */
		}function prodcheck() {
			let input_prod = document.getElementById("input_product");

			$.ajax({
				type : "post", // 데이터 요청 방식 get/post
				data : {"id" : input_prod.value}, // 전송하는 데이터
				url : "ProdCheckService", // 데이터를 요청하는 서버페이지 url
				dataType : "text", //응답데이터의 형식
				success : function(data) { // 성공했을 때, 함수 호출 function(전송 받은 값)

					if (data == "true") {
						//alert(sp.innerText="사용 불가능한 아이디 입니다.");
						alert("중복된 제품 번호가 있습니다. 다시 입력해주세요")
					} else {
						//alert(sp.innerText="사용 가능 한 아이디 입니다.");
						alert("사용 가능한 제품번호 입니다.")
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