<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>
<section>
	<article>
		<h2>사칙연산 결과</h2>
		<%
		String num1_s = request.getParameter("num1");
		if(num1_s == null || num1_s.equals("")){
			num1_s = "0";
		}
		int num1 = Integer.parseInt(num1_s);
	
		String num2_s = request.getParameter("num2");
		if(num2_s == null || num2_s.equals("")){
			num2_s = "0";
		}
		int num2 = Integer.parseInt(num2_s);
		
		String oper = request.getParameter("oper");
		char oper_c = oper.charAt(0);
		int result = 0;
		
		switch(oper_c)
		{
		case '+' : result = num1 + num2; break;
		case '-' : result = num1 - num2; break;
		case '*' : result = num1 * num2; break;
		case '/' : result = num1 / num2; 
		}
		%>
		<h3><%=num1 %><%=oper %><%=num2 %>=<%=result %></h3>
	</article>
</section>
<%@include file="footer.jsp" %>
</body>
</html>