<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<script>
	function popupOpen(){
		window.open('popup.jsp','popup','width=300px, height=350px');
	}
</script>
</head>
<%
	Cookie cks[] = request.getCookies();
			
	String lastDate = "첫 방문이시군요!";
	
	String popupck = null;
			
	if(cks != null){
		for(int i = 0; i < cks.length; i++){
			if(cks[i].getName().equals("lastDate")){
				lastDate = URLDecoder.decode(cks[i].getValue());
			}
			
			if(cks[i].getName().equals("popupck")){
				popupck = cks[i].getValue();
			}
		}
	}
%>
<body <%=popupck == null ? "onload = 'popupOpen()'" : "" %>>
<%@include file="header.jsp" %>
<section>
	<article id="mainImg">
		<img src="img/main.jpg">
	</article>
	<article id="mainSubMenu">
		<h2>안녕하세요</h2>
		
		<h3 style="color:blue;"><%=lastDate %></h3>
		<!-- 날짜 쿠기 -->
		<%
			Calendar now = Calendar.getInstance();
			int year = now.get(Calendar.YEAR);
			int month = now.get(Calendar.MONTH) + 1;
			int day = now.get(Calendar.DATE);
			
			String str = "마지막 접속일 : " + year + "년 " + month + "월 " + day + "일";
			str = URLEncoder.encode(str);
			
			Cookie ck1 = new Cookie("lastDate", str);
			ck1.setMaxAge(60 * 60 * 24 * 30);
			response.addCookie(ck1);
		%>
		
		<ul>
			<li>앞으로 여기에 계속 추가..</li>
			<li><a href="formTest.jsp">Form 테스트</a></li>
			<li><a href="cal.jsp">사칙 계산기</a></li>
			<li><a href="emp.jsp">사원 관리 프로그램(Model1방식)</a></li>
			<li><a href="emp2.jsp">사원 관리 프로그램(Beans방식)</a></li>
			<li><a href="member/memberFind.jsp">회원 검색</a></li>
		</ul>
	</article>
</section>
<%@include file="footer.jsp" %>
</body>
</html>