<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>구구단</h2>
<table border='1' bordercolor='red' width='700'>
	<% 
		for(int i = 1; i <= 9; i++){
			out.println("<tr>");
			
			for(int j = 2; j <= 9; j++){
				out.println("<td>");
				out.println(j + " * " + i + " = " + (j * i));	
				out.println("</td>");
			}
			
			out.println("</tr>");
		}
	%>
</table>
<hr>
//이렇게 짜는것이 효율적
<table border="1" bordercolor="blue" width="700">
	<%for(int i = 1; i <= 9; i++){ %>
	<tr>
		<%for(int j = 2; j <= 9; j++){ %>
		<td><%=j %> * <%=i %> = <%=j * i %></td>
		<%} %>
	</tr>
	<%} %>
</table>
</body>
</html>