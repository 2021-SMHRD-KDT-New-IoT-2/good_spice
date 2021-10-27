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
						<option value="#KOREA">�ѽ�</option>
						<option value="#CHINA">�߽�</option>
						<option value="#USA">���</option>
						<option value="#JAPAN">�Ͻ�</option>
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
				<h2 class="major">��ǰ�Ұ�</h2>
								  
				<span class="image main">
					<video controls muted poster="images/pic1.jpg">
					<source src="/images/KakaoTalk_20211018_161606410.mp4" type="video/mp4">
				  </video></span>
										
				<P>���� "����Ʈ �����"�� �丮�� ���� ���ְ� ����� ���� ����� ��ǰ�Դϴ�.
					�丮�� ���� ����� �� ���ߴ� ���� ���� �����ϰ�, ���� �Ϻ��ϰ� �� �� �ֵ��� ���� ��� �� ���Դϴ�.</P>
					<br>
					<p>����� ��Ź�� �ູ�� �����ϱ⸦ �ٶ��ϴ�.</p>
					<p><a href="https://www.smhrd.or.kr/">����ó</a></p>
			</article>

			<!-- �ѽ�-->
		<article id="KOREA" >
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


		

		<!-- �߽� -->
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

		<!-- ���-->
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

		<!-- �Ͻ� -->
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

		<!-- �Խ��� -->
		<article id="POST">
			<a href="list.html"><h1 class="major">�Խ���</h1></a>
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
					<tr>
						<td>1</td>
						<td>�����</td>
						<td>����</td>
						<td>11111</td>
					</tr>
					<tr>
						<td>1</td>
						<td>�����</td>
						<td>����</td>
						<td>11111</td>
					</tr>
					<tr>
						<td>1</td>
						<td>�����</td>
						<td>����</td>
						<td>11111</td>
					</tr>
					<tr>
						<td>1</td>
						<td>�����</td>
						<td>����</td>
						<td>11111</td>
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

		<article id="QNA">
			<h1 class="major">Q&A</h1>
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
							<input type="submit" value="�α���" >
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
							<input type="submit" value="ȸ������" >
						</div>	
				 	</form>	
				</article>
					
			
			</span>				
		</article>

		
		</div>

		

		<!-- Footer -->
		<footer id="footer">
			<p class="copyright">&copy; Untitled. Design: <a href="https://www.smhrd.or.kr/">������</a>.</p>
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