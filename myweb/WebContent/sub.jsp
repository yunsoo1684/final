<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String str2="JSP";
String str=request.getParameter("str");
String temp=request.getParameter("temp");
%>
<h3 style="color:red;">sub.jsp에서 출력한 문장A</h3>
<h3 style="color:red;">sub.jsp에서 출력한 str의 값 : <%=str2 %></h3>
<h3 style="color:green;">super.jsp로부터 가져온 str : <%=str %></h3>
<h3 style="color:green;">super파라미터 temp의 값 : <%=temp %></h3>
<h3 style="color:red;">sub.jsp에서 출력한 문장B</h3>
</body>
</html>