<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%
	String name = request.getParameter("name");

	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "scott";
	String pwd = "1234";
	Connection conn = DriverManager.getConnection(url, user, pwd);
	String sql = "Delete from employee where name = ?";
	PreparedStatement ps = conn.prepareStatement(sql);
	ps.setString(1, name);
	int count = ps.executeUpdate();
	ps.close();
	conn.close();
	
	String msg = count > 0 ? "사원 삭제 성공!" : "사원 삭제 실패!";
%>
<script>
	window.alert('<%=msg%>');
	location.href='emp.jsp';
</script>