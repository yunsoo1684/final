<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yong.emp.*"%>

<jsp:useBean id="dto" class="yong.emp.EmpDTO"/>
<jsp:setProperty property="*" name="dto"/>
<jsp:useBean id="dao" class="yong.emp.EmpDAO"/>

<% 	int result = dao.empAdd(dto);

	String msg = result > 0? "사원 수정 성공(bean)" : "사원 수정 실패(bean)"; 
%>
<script>
	window.alert('<%=msg %>')
	location.href='emp2.jsp'
</script>