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
<%@include file="header.jsp" %>
<section>
	<article>
		<h2>formTest로부터 넘어온 데이터를..</h2>
		<%
			String name = request.getParameter("name");
			String pwd = request.getParameter("pwd");
			String se = request.getParameter("se");
			String cbs[] = request.getParameterValues("cb");
		%>
		<h4>넘어온 이름 : <%=name %></h4>
		<h4>넘어온 비밀번호 : <%=pwd %></h4>
		<h4>넘어온 성별 : <%=se %></h4>
		<h4>넘어온 취미 : 
		<%
			if(cbs == null || cbs.length == 0)
			{
				out.println("선택한 취미가 없습니다.");
			}else{
				for(int i = 0; i < cbs.length; i++)
				{
					out.println(cbs[i] + " ");
				}
			}
		%>
		</h4>
	</article>
</section>
<%@include file="footer.jsp" %>
</body>
</html>