<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	function openLogin(){
		window.open('/myweb/member/login.jsp', 'login','width=280px, height=280px')
	}
</script>
<header>
<%
	String sname = (String)session.getAttribute("sname");
	String sid = (String)session.getAttribute("sid");
	if(sname == null || sname.equals("")){
		%>
			<p><a href="javascript:openLogin()">로그인</a> | <a href="/myweb/member/join.jsp">회원가입</a></p>
		<%
	}else{
		%>
			<p><%=sname %>님 로그인중... | <a href="/myweb/member/logout.jsp">로그아웃</a></p>
		<%
	}
%>
	
	<h1>JSP Study Site</h1>
	<nav>
		<ul>
			<li><a href="/myweb">HOME</a></li>
			<li><a href="/myweb/profile.jsp">Profile</a></li>
			<li><a href="/myweb/BBS/bbsList.jsp">BBS</a></li>
			<li><a href="/myweb/webFolder/webFolder.jsp">WebFolder</a></li>
			<li><a href="#">GuestBook</a></li>
		</ul>
	</nav>
	<hr>
</header>