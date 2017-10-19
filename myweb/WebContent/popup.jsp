<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="border: 2px solid gray; width: 200px; height: 250px">
	<h2 style="text-align:center;">공 지 사 항</h2>
	<h4>1. 지각, 결석을 하지맙시다.</h4> 
	<h4>2. 복습을 철저히 합시다.</h4> 
	<h4>3. 건강관리 합시다.</h4>
</div>
<p>
	<form name="fm" action="popup_ok.jsp">
		<input type="checkbox" name="popupck" value="on">
		24시간동안 보지 않기.
		<input type="submit" value="닫기">
	</form>
</p>
</body>
</html>