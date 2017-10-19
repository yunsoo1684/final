<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String idx_s = request.getParameter("idx");
	if(idx_s==null || idx_s.equals("")){
		idx_s="0";
	}
	int idx = Integer.parseInt(idx_s);
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String dept = request.getParameter("dept");

	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String pwd = "1234";
	Connection conn = DriverManager.getConnection(url, user, pwd);
	String sql = "select * from employee where idx = ?";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setInt(1, idx);
	ResultSet rs = ps.executeQuery();
%>
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
	<form name="empUpdate" action="empUpdate_ok.jsp">
	<article>
		<h2><%=idx %>번 사원 정보</h2>
		<table>
		<%
			if(rs.next())
			{
				do{
				%>
				<tr>
					<th>사번</th>
					<td><%=rs.getInt("idx") %>
						<input type="hidden" name="idx" value="<%=idx %>">	</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" value="<%=rs.getString("name") %>"></td>
				</tr>
				<tr>
					<th>E-Mail</th>
					<td><input type="text" name="email" value="<%=rs.getString("email") %>"></td>
				</tr>
				<tr>
					<th>부서명</th>
					<td><input type="text" name="dept" value="<%=rs.getString("dept") %>"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="수정">
						<input type="button" value="돌아가기" onclick="location.href='http://localhost:9090/myweb/emp.jsp';">
					</td>
				</tr>
			<%
				}while(rs.next());
			}else{
				%>
				<script>
					window.alert('등록된 사원번호가 없습니다.');
					location.href='emp.jsp';
				</script>
				<%
			}
		%>
		</table>
		<%
			rs.close();
			ps.close();
			conn.close();
		%>
	</article>
	</form>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>