<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="btest" class="yong.bean.BeanTest"/>

<jsp:setProperty property="*" name="btest"/>

<h3>이름 : <jsp:getProperty property="name" name="btest"/></h3>
<h3>나이 : <jsp:getProperty property="age" name="btest"/></h3>
<h3>주소 : <jsp:getProperty property="addr" name="btest"/></h3>
<h3>번호 : <jsp:getProperty property="tel" name="btest"/></h3>

<!-- 1. db 스키마 설계
	 2. 디자인 설계(컨텐츠 뼈대)
	 3. DTO * DAO 클래스 설계
	 4. 컨트롤러의 작성(_ok)-->
</body>
</html>