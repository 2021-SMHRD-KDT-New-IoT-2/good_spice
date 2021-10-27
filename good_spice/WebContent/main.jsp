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
					<h1>Smart Spice</h1>
					<p> May your life be happy with this Spice </p>
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
						
					<li><a href="#POST">Board</a></li>
					<li><a href="#QNA">Q&A</a></li>

					<%if(vo==null){%>
						<li><a href="#Login">Login</a></li>
						<li><a href="#Join">Join</a></li>
						<%}else{ %>
						<script>
							alert("<%=vo.getnick() %> �� ȯ���մϴ�.");
						</script>
						
						<li><select onchange="if(this.value) location.href=(this.value);" id="selMypage" onclick="info()">
							<option disabled selected>Mypage</option>
							<option value="#ChangeInfo">��������</option>
							<option value="#Product">������</option>
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
		<!-- header �� -->
		
		
		
		
		
		<!-- Main -->
		<div id="main">

			<!-- Intro ��ǰ�Ұ� -->
			<article id="intro">
				<h2 class="major">��ǰ�Ұ�</h2>
				<span class="image main">
					<video controls muted poster="images/pic1.jpg">
					<source src="images/KakaoTalk_20211018_161606410.mp4" type="video/mp4">
				  </video></span>
					<P>���� "����Ʈ �����"�� �丮�� ���� ���ְ� ����� ���� ����� ��ǰ�Դϴ�.
					�丮�� ���� ����� �� ���ߴ� ���� ���� �����ϰ�, ���� �Ϻ��ϰ� �� �� �ֵ��� ���� ��� �� ���Դϴ�.</P>
					<br>
					<p>����� ��Ź�� �ູ�� �����ϱ⸦ �ٶ��ϴ�.</p>
					<p><a href="https://www.smhrd.or.kr/">����ó</a></p>
			</article>

			<!-- Recipe �ѽ� -->
			<article id="KOREA">
				<h2 class="major">�ѽ�</h2>
				<span id="move" >
				<a href="#CHINA">�߽�</a>
				<a href="#USA">���</a>
				<a href="#JAPAN">�Ͻ�</a>
			</span>
			<span class="image main">
				��ġ�
				<a href="http://127.0.0.1:5502/list.html"target="_blank"><img src="images/KOREA.jfif"></a>
			</span>	
			<span class="image main">
				�����
				<img src="images/been.jpg">
			</span>	
			<span class="image main">
				��ġ������
				<img src="images/bokk.jpg">
				</span>				
			</article>

			<!-- Recipe �߽� -->
			<article id="CHINA">
				<h2 class="major">�߽�</h2>
				<span id="move">
				<a href="#KOREA">�ѽ�</a>
				<a href="#USA">���</a>
				<a href="#JAPAN">�Ͻ�</a>
			</span>
			<span class="image main">
				¥���
				<img src="images/CHINA.jfif">
			</span>	
			<span class="image main">
				«��
				<img src="images/jjam.jfif">
			</span>	
			<span class="image main">
				������
				<img src="images/tang.jfif">
				</span>				
			</article>

			<!-- Recipe ��� -->
			<article id="USA">
				<h2 class="major">���</h2>
				<span id="move">
				<a href="#CHINA">�߽�</a>
				<a href="#KOREA">�ѽ�</a>
				<a href="#JAPAN">�Ͻ�</a>
			</span>
			<span class="image main">
				������ũ
				<img src="images/USA.jfif">
			</span>
			<span class="image main">
				�ƾ�ġ��
				<img src="images/mac.jpg">
			</span>	
			<span class="image main">
				���İ�Ƽ
				<img src="images/spaghetti.jfif">
			</span>					
			</article>

			<!-- Recipe �Ͻ� -->
			<article id="JAPAN">
				<h2 class="major">�Ͻ�</h2>
				<span id="move">
				<a href="#CHINA">�߽�</a>
				<a href="#USA">���</a>
				<a href="#KOREA">�ѽ�</a>
			</span>
			<span class="image main">
				����
				<img src="images/JAPAN.jfif">				
			</span>
			<span class="image main">
				�쵿
				<img src="images/udon.png">
			</span>	
			<span class="image main">
				���ڳ�̾߳�
				<img src="images/oko.jpg">

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
				
			<!-- �������� ���� -->	
			<article id="ChangeInfo">
				<h2 class="major">�������� ����</h2>
				<form action="UpdateService" method="post">
					<h3>����ID</h3><input name="id" type="text" placeholder="ID�� �Է��ϼ���" required="required">
							<br>
					<h3>PW</h3><input name="pw" type="password" placeholder="������ PW�� �Է��ϼ���" required="required">
					<br>
					<h3>NICK</h3><input name="nick" type="text" placeholder="������ NICK�� �Է��ϼ���" required="required">
					<br>
					<input type="submit" value="Change" class="button fit">
					</form>
				</span>				
			</article>
				
				
			<!-- Login �α��� -->
			<article id="Login">
				<h2 class="major">Login</h2>
					<form action="LoginService" method="post">
						<h3>ID</h3><input name="id" type="text" placeholder="ID�� �Է��ϼ���" required="required">
						<br>
						<h3>PW</h3><input name="pw" type="password" placeholder="PW�� �Է��ϼ���" required="required">
						<br>
						<div style="text-align: center;">
							<input type="submit" value="LogIn" >
						</div>
					</form>
			</article>



			<!-- Join ȸ������ -->
			<article id="Join">
				<h2 class="major">Join</h2>
					<form action="JoinService" method="post">
						<input name="id" id="input_id" type="text" placeholder="ID�� �Է��ϼ���" required="required">
						<br>
						<input type="button" value="Id�ߺ�üũ" onclick="idcheck()">									
						<br><br>
						<input name="pw" type="password" placeholder="PW�� �Է��ϼ���" required="required">
						<br>
						<input name="nick" type="text" placeholder="NICK�� �Է��ϼ���" required="required">
						<br>
						<div style="text-align: center;">
							<input type="submit" value="JoinUs" >
						</div>	
					</form>			
			</article>	
			
			
			<!-- ������ -->
			<article id="Product">
				<h2 class="major">������</h2>
					<form action="ProductService" method="post">
						<input name = "id" type = "text" placeholder = "���̵� �Է��ϼ���" required = "required">
						<br>
						<input name="product" id="input_product" type="text" placeholder="��ǰ��ȣ�� �Է��ϼ���" required="required">
						<br>
						<select name="spice">
							<option value = "">����� �����ϼ���.</option>
							<option value = "�ұ�">�ұ�</option>
							<option value = "����">����</option>
							<option value = "����">����</option>
						</select>
						<br>
						<div style="text-align: center;">
							<input type="submit" value="����">
							<br>
						</div>
					</form>
						<br><br>						
						<table>
							<tr>
								<td>��ǰ��ȣ</td>
								<td>���</td>
							</tr>
						</table>
						<br><br>
						
					<form action = "#" method = "post">
						<input name="SpiceGram" id="input_gram" type="text" placeholder="����� ���� �Է��ϼ���." required="required">
						<br>
						<div style="text-align: center;">
							<input type="submit" value="���">
						</div>
					</form>
							
			</article>
			
			
			
			
			
		</div> 
		<!-- Main �� -->




		<!-- Footer -->
		<footer id="footer">
			<p class="copyright">&copy; GOOD_SPICE : <a href="https://www.smhrd.or.kr"/>����Ʈ���簳�߿�</a>.</p>
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
			type : "post", // ������ ��û ��� get/post
			data : {"id":input.value}, // �����ϴ� ������
			url : "IdCheckService", // �����͸� ��û�ϴ� ���������� url
			dataType : "text", //���䵥������ ����
			success : function(data){ // �������� ��, �Լ� ȣ�� function(���� ���� ��)
									
				if(data=="true"){
					//alert(sp.innerText="��� �Ұ����� ���̵� �Դϴ�.");
					alert("��� �Ұ����� ���̵� �Դϴ�.")
				}else{
					//alert(sp.innerText="��� ���� �� ���̵� �Դϴ�.");
					alert("��� ������ ���̵� �Դϴ�.")
				}
			},
			error : function(){ // ����
				alert("��Ž���")
			}
		});
		
	}
	</script>
</body>

</html>