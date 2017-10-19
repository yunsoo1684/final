<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
</head>
<body>
<%@include file="/header.jsp" %>
<section>
	<select name="fkey">
		<option value="name">이름</option>
		<option value="id">아이디</option>
	</select>
	<input type="text" name="fvalue">
	<input type="button" value="검색" onclick="">
	<hr>
	<p>dd</p>
<jsp:include page="result.jsp">
<jsp:param value="" name=""/>
</jsp:include>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>