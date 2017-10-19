<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>paramTest2.jsp</h1>
<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>
<form name="param2" action="paramTest3.jsp">
	<input type="hidden" name="name" value="<%=name %>">
	<input type="hidden" name="age" value="<%=age %>">
	전화번호 : <input type="text" name="tel">
	주소 : <input type="text" name="addr">
	<input type="submit" value="전달">
</form>
</body>
</html>