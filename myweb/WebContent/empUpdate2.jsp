<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yong.emp.*" %>

<jsp:useBean id="dto" class="yong.emp.EmpDTO"/>
<jsp:setProperty property="*" name="dto"/>
<jsp:useBean id="edao" class="yong.emp.EmpDAO"/>

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
	<form name="empUpdate2" action="empUpdate2_ok.jsp">
	<article>
		<%
			EmpDTO dtos[] = edao.empUpdate(dto);
			
		if(dtos.length == 0)
		{
			%>
			<script>
				window.alert('등록된 사번이 아닙니다!')
				location.href='emp2.jsp'
			</script>
			<%
		}else{
			for(int i = 0; i < dtos.length; i++)
			{
				dtos[i].getIdx();
				dtos[i].getName();
				dtos[i].getEmail();
				dtos[i].getDept();				
		
		 %>
		<h2><%=dto.getIdx() %>번 사원 정보</h2>
		<table>
				<tr>
					<th>사번</th>
					<td>
						<%=dto.getIdx()%> 
						<input type="hidden" name="idx" value="<%=dtos[0].getIdx() %>"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" value="<%=dtos[0].getName() %>"></td>
				</tr>
				<tr>
					<th>E-Mail</th>
					<td><input type="text" name="email" value="<%=dtos[0].getEmail() %>"></td>
				</tr>
				<tr>
					<th>부서명</th>
					<td><input type="text" name="dept" value="<%=dtos[0].getDept() %>"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="수정">
						<input type="button" value="돌아가기" onclick="location.href='http://localhost:9090/myweb/emp2.jsp';">
					</td>
				</tr>
		</table>
			<%}
		}	%>
	</article>
	</form>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>