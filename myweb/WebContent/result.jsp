<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yong.member.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="mdto" class="yong.member.MemberDTO"/>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="yong.member.MemberDAO"/>
<%
	String key = request.getParameter("fkey");
	String value = request.getParameter("fvalue");
	ArrayList<MemberDTO> al = mdao.memberFind(key, value);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<thead>
	<tr>
		<th>idx</th>
		<th>이름</th>
		<th>ID</th>
		<th>주소</th>
	</tr>
</thead>
<tbody>
	<%
		
	%>
</tbody>
</table>
</body>
</html>