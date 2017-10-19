<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
</head>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<h2>자유게시판 답변글쓰기</h2>
		<%
			String subject = request.getParameter("subject");
			String ref = request.getParameter("ref");
			String lev = request.getParameter("lev");
			String sunbun = request.getParameter("sunbun");
		%>
			<form name="bbsReWrite" action="bbsReWrite_ok.jsp">
			<input type="hidden" name="ref" value="<%=ref %>">
			<input type="hidden" name="lev" value="<%=lev %>">
			<input type="hidden" name="sunbun" value="<%=sunbun %>">
				<table border="1" cellspacing="0" width="550">
					<tr>
						<th>작성자</th>
						<td><input type="text" name="writer"></td>
						<th>비밀번호</th>
						<td><input type="password" name="pwd"></td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3"><input type="text" name="subject" size="45" value="Re:)<%=subject %>"></td>
					</tr>
					<tr>
						<td colspan="4"><textarea rows="10" cols="45" name="content">   </textarea></td>
					</tr>
					<tr>
						<td colspan="4" align="center">
							<input type="submit" value="글쓰기">
							<input type="reset" value="다시작성">
						</td>
					</tr>
				</table>
		</form>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>