<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>cookieTest.jsp</h2>

<%
	//1. 쿠키들을 가져오기
	Cookie cks[] = request.getCookies();
	if(cks != null){
		
		for(int i = 0; i < cks.length; i++){
			//2. 키값
			String key = cks[i].getName();	
			//3. 벨류
			String value = URLDecoder.decode(cks[i].getValue());
			out.println("<h4>KEY : " + key + "/VALUE : " + value + "</h4>");
		}
	}
%>
<!-- ---------------------------------------------- -->
<%
	//1. 객체 생성
	Cookie ck1 = new Cookie("id", "hong");
	//2. 나이 지정
	ck1.setMaxAge(60 * 3);
	//3. 사용자에게 심기
	response.addCookie(ck1);
	
	String name=URLEncoder.encode("홍길동");
	Cookie ck2 = new Cookie("name", name);
	ck2.setMaxAge(180);
	response.addCookie(ck2);
%>
</body>
</html> 