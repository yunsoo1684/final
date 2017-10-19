<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>sessionTest.jsp</h2>
<%
	String id = (String)session.getAttribute("id");
	String name = (String)session.getAttribute("name");
%>
<h4>아이디 : <%=id %></h4>
<h4>이름 : <%=name %></h4>
<!-- ------------------ -->

<%
	session.setAttribute("id", "hong");
	session.setAttribute("name", "홍길동");
%>
</body>
</html>