<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>RequestTest.jsp</h2>
<h4>사용자 IP번호 : <%=request.getRemoteAddr() %></h4>
<h4>사용자 접속 포트번호 : <%=request.getRemotePort() %></h4>
<h4>사용자 접속 방식 : <%=request.getMethod() %></h4>
<h4>접속 프로토콜 : <%=request.getProtocol() %></h4>
<h4>서버 정보 : <%=request.getServerName() %></h4>
<h4>서비스 제공 포트 : <%=request.getServerPort() %></h4>
<h4>서비스 프로젝트 이름 : <%=request.getContextPath() %></h4>
<h4>접속 페이지 : <%=request.getRequestURI() %></h4>
</body>
</html>