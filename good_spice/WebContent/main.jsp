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
	<!-- ��� -->
	<%	
	MemberVO vo = (MemberVO) session.getAttribute("member");
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberVO> al = dao.selectAll();
	
	//<!-- ��ǰ -->

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
						<h2>�����ڴ� ȯ���մϴ�</h2>
						<%} else {%>
						<h2><%=vo.getid() %>�� ȯ���մϴ�</h2>
						<%} %>
					<%} %>
				</div>
			</div>
			<nav>
				<ul class>
					<li><a href="#intro">Intro</a></li>

					<li><select onchange="if(this.value) location.href=(this.value);" id="select" onclick="menu()">

							<option disabled selected>Recipe</option>
							<option value="#KOREA">�ѽ�</option>
							<option value="#CHINA">�߽�</option>
							<option value="#USA">���</option>
							<option value="#JAPAN">�Ͻ�</option>
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
								<option value="#recipepost">������</option>
								<option value="#MemberInfo">ȸ������</option>
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
								<option value="#ChangeInfo">��������</option>
								<option value="#Product">������</option>
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
		<!-- header �� -->

		<!-- Main -->
		<div id="main">

			<!-- Intro ��ǰ�Ұ� -->
			<article id="intro">
				<h2 class="major">��ǰ�Ұ�</h2>

				<span class="image main"> <video controls muted
						poster="images/pic1.jpg">
						<source src="images/KakaoTalk_20211018_161606410.mp4"
							type="video/mp4">
					</video></span>
				<P>���� "����Ʈ �����"�� �丮�� ���� ���ְ� ����� ���� ����� ��ǰ�Դϴ�. �丮�� ���� ����� �� ���ߴ�
					���� ���� �����ϰ�, ���� �Ϻ��ϰ� �� �� �ֵ��� ���� ��� �� ���Դϴ�.</P>
				<br>
				<p>����� ��Ź�� �ູ�� �����ϱ⸦ �ٶ��ϴ�.</p>
				<p>
					<a href="https://www.smhrd.or.kr/">����ó</a>
				</p>

			</article>

			<!-- Recipe �ѽ� -->
			<article id="KOREA">
				<h2 class="major">�ѽ�</h2>

				<div style="text-align: right;">
					<a href="#CHINA">�߽�&ensp;</a> <a href="#USA">���&ensp;</a> <a
						href="#JAPAN">�Ͻ�</a>
				</div>
				<span class="image main"> ��ġ� <a href="#kimchi"><img
						src="images/KOREA.jfif"></a>
				</span> <span class="image main"> ����� <a href="#beensoup"><img
						src="images/been.jpg"></a>
				</span> <span class="image main"> ��ġ������ <a href="#kimbok"><img
						src="images/bokk.jpg"></a>
				</span>
			</article>

			<!-- Recipe �߽� -->
			<article id="CHINA">
				<h2 class="major">�߽�</h2>

				<div style="text-align: right;">
					<a href="#KOREA">�ѽ�&ensp;</a> <a href="#USA">���&ensp;</a> <a
						href="#JAPAN">�Ͻ�</a>
				</div>
				<span class="image main"> ¥��� <a href=#jja><img
						src="images/CHINA.jfif"></a>
				</span> <span class="image main"> «�� <a href=#bbong><img
						src="images/jjam.jfif"></a>
				</span> <span class="image main"> ������ <a href=#tangsu><img
						src="images/tang.jfif"></a>
				</span>
			</article>

			<!-- Recipe ��� -->
			<article id="USA">
				<h2 class="major">���</h2>

				<div style="text-align: right;">
					<a href="#CHINA">�߽�&ensp;</a> <a href="#KOREA">�ѽ�&ensp;</a> <a
						href="#JAPAN">�Ͻ�</a>
				</div>
				<span class="image main"> ������ũ <a href=#steak><img
						src="images/USA.jfif"></a>
				</span> <span class="image main"> ��ī�δϾ�ġ�� <a href=#cheese><img
						src="images/mac.jpg"></a>
				</span> <span class="image main"> ���İ�Ƽ <a href=#pasta><img
						src="images/spaghetti.jfif"></a>
				</span>
			</article>

			<!-- Recipe �Ͻ� -->
			<article id="JAPAN">
				<h2 class="major">�Ͻ�</h2>

				<div style="text-align: right;">
					<a href="#CHINA">�߽�&ensp;</a> <a href="#USA">���&ensp;</a> <a
						href="#KOREA">�ѽ�</a>
				</div>
				<span class="image main"> �ʹ� <a href=#sushi><img
						src="images/JAPAN.jfif"></a>
				</span> <span class="image main"> �쵿 <a href=#udon><img
						src="images/udon.png"></a>
				</span> <span class="image main"> ���ڳ�̾߳� <a href=#oko><img
						src="images/oko.jpg"></a>
				</span>
			</article>

			<!-- �ѽ� ������ ������ -->
			<article id=kimchi>
				<a href=#KOREA><h2 class="major">�ѽ�</h2></a>
				<div style="text-align: right;">
					<a href="#KOREA">�ѽ�&ensp;</a> <a href="#CHINA">�߽�&ensp;</a> <a
						href="#USA">���&ensp;</a> <a href="#JAPAN">�Ͻ�</a>
				</div>
				<h3>��ġ�</h3>
				<span class="image main"> <a><img src="images/KOREA.jfif"></a>
				</span>
				<div>
					<ul>
						<li>�ұ� 10g</li>
						<li>���� 10g</li>
						<li>���� 10g</li>
					</ul>
				</div>
				<div>
					<p align="center">
						<input type="button" href="#" value="����">
					</p>
				</div>
			</article>

			<article id=beensoup>
				<h2 class="major">
					<a href=#KOREA>�ѽ�</a>
				</h2>
				<div style="text-align: right;">
					<a href="#KOREA">�ѽ�&ensp;</a> <a href="#CHINA">�߽�&ensp;</a> <a
						href="#USA">���&ensp;</a> <a href="#JAPAN">�Ͻ�</a>
				</div>
				<h3>�����</h3>
				<span class="image main"> <a><img src="images/been.jpg"></a>
				</span>
				<div>
					<ul>
						<li>�ұ� 10g</li>
						<li>���� 10g</li>
						<li>���� 10g</li>
					</ul>
				</div>
				<div>
					<p align="center">
						<input type="button" href="#" value="����">
					</p>
				</div>
			</article>

			<article id=kimbok>
				<a href=#KOREA><h2 class="major">�ѽ�</h2></a>
				<div style="text-align: right;">
					<a href="#KOREA">�ѽ�&ensp;</a> <a href="#CHINA">�߽�&ensp;</a> <a
						href="#USA">���&ensp;</a> <a href="#JAPAN">�Ͻ�</a>
				</div>
				<h>��ġ������
				</h3>
				<span class="image main"> <a><img src="images/bokk.jpg"></a>
				</span>
				<div>
					<ul>
						<li>�ұ� 10g</li>
						<li>���� 10g</li>
						<li>���� 10g</li>
					</ul>
				</div>
				<div>
					<p align="center">
						<input type="button" href="#" value="����">
					</p>
				</div>
			</article>

			<!-- �߽� ������ ������ -->
			<article id=jja>
				<a href=#CHINA><h2 class="major">�߽�</h2></a>
				<div style="text-align: right;">
					<a href="#KOREA">�ѽ�&ensp;</a> <a href="#CHINA">�߽�&ensp;</a> <a
						href="#USA">���&ensp;</a> <a href="#JAPAN">�Ͻ�</a>
				</div>
				<h>¥���
				</h3>
				<span class="image main"> <a><img src="images/CHINA.jfif"></a>
				</span>
				<div>
					<ul>
						<li>�ұ� 10g</li>
						<li>���� 10g</li>
						<li>���� 10g</li>
					</ul>
				</div>
				<div>
					<p align="center">
						<input type="button" href="#" value="����">
					</p>
				</div>
			</article>

			<article id=bbong>
				<a href=#CHINA><h2 class="major">�߽�</h2></a>
				<div style="text-align: right;">
					<a href="#KOREA">�ѽ�&ensp;</a> <a href="#CHINA">�߽�&ensp;</a> <a
						href="#USA">���&ensp;</a> <a href="#JAPAN">�Ͻ�</a>
				</div>
				<h>«��
				</h3>
				<span class="image main"> <a><img src="images/jjam.jfif"></a>
				</span>
				<div>
					<ul>
						<li>�ұ� 10g</li>
						<li>���� 10g</li>
						<li>���� 10g</li>
					</ul>
				</div>
				<div>
					<p align="center">
						<input type="button" href="#" value="����">
					</p>
				</div>
			</article>

			<article id=tangsu>
				<a href=#CHINA><h2 class="major">�߽�</h2></a>
				<div style="text-align: right;">
					<a href="#KOREA">�ѽ�&ensp;</a> <a href="#CHINA">�߽�&ensp;</a> <a
						href="#USA">���&ensp;</a> <a href="#JAPAN">�Ͻ�</a>
				</div>
				<h3>������</h3>
				<span class="image main"> <a><img src="images/tang.jfif"></a>
				</span>
				<div>
					<ul>
						<li>�ұ� 10g</li>
						<li>���� 10g</li>
						<li>���� 10g</li>
					</ul>
				</div>
				<div>
					<p align="center">
						<input type="button" href="#" value="����">
					</p>
				</div>
			</article>

			<!-- ��� ������ ������ -->
			<article id=steak>
				<a href=#USA><h2 class="major">���</h2></a>
				<div style="text-align: right;">
					<a href="#KOREA">�ѽ�&ensp;</a> <a href="#CHINA">�߽�&ensp;</a> <a
						href="#USA">���&ensp;</a> <a href="#JAPAN">�Ͻ�</a>
				</div>
				<h>������ũ
				</h3>
				<span class="image main"> <a><img src="images/USA.jfif"></a>
				</span>
				<div>
					<ul>
						<li>�ұ� 10g</li>
						<li>���� 10g</li>
						<li>���� 10g</li>
					</ul>
				</div>
				<div>
					<p align="center">
						<input type="button" href="#" value="����">
					</p>
				</div>
			</article>

			<article id=cheese>
				<a href=#USA><h2 class="major">���</h2></a>
				<div style="text-align: right;">
					<a href="#KOREA">�ѽ�&ensp;</a> <a href="#CHINA">�߽�&ensp;</a> <a
						href="#USA">���&ensp;</a> <a href="#JAPAN">�Ͻ�</a>
				</div>
				<h>��ī�δϾ�ġ��
				</h3>
				<span class="image main"> <a><img src="images/mac.jpg"></a>
				</span>
				<div>
					<ul>
						<li>�ұ� 10g</li>
						<li>���� 10g</li>
						<li>���� 10g</li>
					</ul>
				</div>
				<div>
					<p align="center">
						<input type="button" href="#" value="����">
					</p>
				</div>
			</article>

			<article id=pasta>
				<a href=#USA><h2 class="major">���</h2></a>
				<div style="text-align: right;">
					<a href="#KOREA">�ѽ�&ensp;</a> <a href="#CHINA">�߽�&ensp;</a> <a
						href="#USA">���&ensp;</a> <a href="#JAPAN">�Ͻ�</a>
				</div>
				<h>���İ�Ƽ
				</h3>
				<span class="image main"> <a><img
						src="images/spaghetti.jfif"></a>
				</span>
				<div>
					<ul>
						<li>�ұ� 10g</li>
						<li>���� 10g</li>
						<li>���� 10g</li>
					</ul>
				</div>
				<div>
					<p align="center">
						<input type="button" href="#" value="����">
					</p>
				</div>
			</article>

			<!-- �Ͻ� ������ ������ -->
			<article id=sushi>
				<a href=#JAPAN><h2 class="major">�Ͻ�</h2></a>
				<div style="text-align: right;">
					<a href="#KOREA">�ѽ�&ensp;</a> <a href="#CHINA">�߽�&ensp;</a> <a
						href="#USA">���&ensp;</a> <a href="#JAPAN">�Ͻ�</a>
				</div>
				<h>�ʹ�
				</h3>
				<span class="image main"> <a><img src="images/JAPAN.jfif"></a>
				</span>
				<div>
					<ul>
						<li>�ұ� 10g</li>
						<li>���� 10g</li>
						<li>���� 10g</li>
					</ul>
				</div>
				<div>
					<p align="center">
						<input type="button" href="#" value="����">
					</p>
				</div>
			</article>

			<article id=udon>
				<a href=#JAPAN><h2 class="major">�Ͻ�</h2></a>
				<div style="text-align: right;">
					<a href="#KOREA">�ѽ�&ensp;</a> <a href="#CHINA">�߽�&ensp;</a> <a
						href="#USA">���&ensp;</a> <a href="#JAPAN">�Ͻ�</a>
				</div>
				<h>�쵿
				</h3>
				<span class="image main"> <a><img src="images/udon.png"></a>
				</span>
				<div>
					<ul>
						<li>�ұ� 10g</li>
						<li>���� 10g</li>
						<li>���� 10g</li>
					</ul>
				</div>
				<div>
					<p align="center">
						<input type="button" href="#" value="����">
					</p>
				</div>
			</article>

			<article id=oko>
				<a href=#JAPAN><h2 class="major">�Ͻ�</h2></a>
				<div style="text-align: right;">
					<a href="#KOREA">�ѽ�&ensp;</a> <a href="#CHINA">�߽�&ensp;</a> <a
						href="#USA">���&ensp;</a> <a href="#JAPAN">�Ͻ�</a>
				</div>
				<h>���ڳ�̾߳�
				</h3>
				<span class="image main"> <a><img src="images/oko.jpg"></a>
				</span>
				<div>
					<ul>
						<li>�ұ� 10g</li>
						<li>���� 10g</li>
						<li>���� 10g</li>
					</ul>
				</div>
				<div>
					<p align="center">
						<input type="button" href="#" value="����">
					</p>
				</div>
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


			<!-- �������� ���� -->
			<article id="ChangeInfo">
				<h2 class="major">�������� ����</h2>
				<form action="UpdateService" method="post">
					<h3>����ID</h3>
					<input name="id" type="text" placeholder="ID�� �Է��ϼ���" required="required"> <br>
					<h3>PW</h3>
					<input name="pw" type="password" placeholder="������ PW�� �Է��ϼ���"> <br>
					<h3>NICK</h3>
					<input name="nick" type="text" placeholder="������ NICK�� �Է��ϼ���"> <br> <input type="submit"
						value="Change" class="button fit">
				</form>
				</span>
			</article>

			<!-- Login �α��� -->
			<article id="Login">
				<h2 class="major">Login</h2>

				<form action="LoginService" method="post">
					<h3>ID</h3>
					<input name="id" type="text" placeholder="ID�� �Է��ϼ���" required="required"> <br>
					<h3>PW</h3>
					<input name="pw" type="password" placeholder="PW�� �Է��ϼ���" required="required"> <br>
					<div style="text-align: center;">
						<input type="submit" value="LogIn">
					</div>
				</form>
			</article>

			<!-- Join ȸ������ -->
			<article id="Join">
				<h2 class="major">Join</h2>

				<form action="JoinService" method="post">
					<input name="id" id="input_id" type="text" placeholder="ID�� �Է��ϼ���" required="required">
					<br> 
					<div style="text-align: center;">
					<input type="button" value="Id�ߺ�üũ" onclick="idcheck()"> 
					</div>
					<br> 
					<input name="pw" type="password" placeholder="PW�� �Է��ϼ���" required="required"> 
					<br> 
					<input name="nick" type="text" placeholder="NICK�� �Է��ϼ���" required="required">
					<br>
					<div style="text-align: center;">
						<input type="submit" value="JoinUs">
					</div>
				</form>
			</article>

			<!-- ������ -->
			<article id="Product">
				<h2 class="major">������</h2>
				<form action="ProductService" method="post">
					<input name="product" id="input_product" type="text" placeholder="��ǰ��ȣ�� �Է��ϼ���" required="required">
					<br>

					<div style="text-align: center;">
					<input type="button" value="��ǰ��ȣ�ߺ�üũ" onclick="prodcheck()"> 
					</div>
					<br> 
					<br> <select name="spice">
						<option value="">����� �����ϼ���.</option>
						<option value="�ұ�">�ұ�</option>
						<option value="����">����</option>
						<option value="����">����</option>
					</select> <br>
					<div style="text-align: center;">
					<input type="submit" value="����" onclick="alert('��ǰ ����� �Ϸ� �ƽ��ϴ�.')"> <br>
					</div>
				</form>
				<br> <br>
				<table>
					<tr>
						<td>��ǰ��ȣ</td>
						<td>���</td>
					</tr>
					<!-- ��ǰ��ȣ ��� -->
					
					<%for(ProductVO pvo:Pal){%>
					
					<tr>
						<td><%= pvo.getProduct() %></td>
						<td><%= pvo.getSpice() %></td>
						<td><a href="DeleteProduct?product=<%=pvo.getProduct()%>" onclick="if(!confirm('���� �Ͻðڽ��ϱ�?')){return false;}">����</a></td>
					</tr>
				
					<%}%>
				</table>
				<br> <br>

				<form action="#" method="post">
					<input name="SpiceGram" id="input_gram" type="text"
						placeholder="����� ���� �Է��ϼ���." required="required"> <br>
					<div style="text-align: center;">
						<input type="submit" value="���">
					</div>
				</form>


			</article>

			<!-- MemberInfo ȸ������ -->
			<article id="MemberInfo">
				<h2 class="major">ȸ������</h2>
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
						<td><a href="DeleteService?id=<%=mvo.getid()%>" onclick="if(!confirm('���� �Ͻðڽ��ϱ�?')){return false;}">����</a></td>
					</tr>
					<% } %>
				</table>
			</article>

		
		<article id="recipepost">
				<h2 class="major">RecipePost</h2>
		
				<form action="RecipePost" method="post">
					<h3>�丮 ��</h3>
					<input name="rec_name" type="text" placeholder="�丮 �̸� �Է�" required="required">
					<br>
					<h3>�ұ�</h3> 
					<input name="salt" type="text" placeholder="�ұ� �� �Է�" required="required"> 
					<br> 
					<h3>����</h3>
					<input name="sugar" type="text" placeholder="���� �� �Է�" required="required">
					<br>
					<h3>����</h3>
					<input name="pepper" type="text" placeholder="���� �� �Է�" required="required">
					<br>
					<div style="text-align: center;">
						<input type="submit" value="�ۼ�">
					</div>
				</form>
			</article>

		</div>
		<!-- Main �� -->


		<!-- Footer -->
		<footer id="footer">

			<p class="copyright">
				&copy; GOOD_SPICE : <a href="https://www.smhrd.or.kr" />����Ʈ���簳�߿�</a>.
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
		/* id �ߺ� üũ */
		function idcheck() {
			let input = document.getElementById("input_id");

			$.ajax({
				type : "post", // ������ ��û ��� get/post
				data : {
					"id" : input.value
				}, // �����ϴ� ������
				url : "IdCheckService", // �����͸� ��û�ϴ� ���������� url
				dataType : "text", //���䵥������ ����
				success : function(data) { // �������� ��, �Լ� ȣ�� function(���� ���� ��)

					if (data == "true") {
						//alert(sp.innerText="��� �Ұ����� ���̵� �Դϴ�.");
						alert("��� �Ұ����� ���̵� �Դϴ�.")
					} else {
						//alert(sp.innerText="��� ���� �� ���̵� �Դϴ�.");
						alert("��� ������ ���̵� �Դϴ�.")
					}
				},
				error : function() { // ����
					alert("��Ž���")
				}
			});
		/* ��ǰ �ߺ� üũ */
		}function prodcheck() {
			let input_prod = document.getElementById("input_product");

			$.ajax({
				type : "post", // ������ ��û ��� get/post
				data : {"id" : input_prod.value}, // �����ϴ� ������
				url : "ProdCheckService", // �����͸� ��û�ϴ� ���������� url
				dataType : "text", //���䵥������ ����
				success : function(data) { // �������� ��, �Լ� ȣ�� function(���� ���� ��)

					if (data == "true") {
						//alert(sp.innerText="��� �Ұ����� ���̵� �Դϴ�.");
						alert("�ߺ��� ��ǰ ��ȣ�� �ֽ��ϴ�. �ٽ� �Է����ּ���")
					} else {
						//alert(sp.innerText="��� ���� �� ���̵� �Դϴ�.");
						alert("��� ������ ��ǰ��ȣ �Դϴ�.")
					}
				},
				error : function() { // ����
					alert("��Ž���")
				}
			});
		}
	</script>
</body>

</html>