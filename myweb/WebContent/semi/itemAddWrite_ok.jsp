<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bdto" class="admin.bbs.BbsDTO" scope="page"/>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="admin.bbs.BbsDAO" scope="session"/>
<%
	int result = bdao.bbsWrite(bdto);
	
	String msg = result > 0? "상품 추가 성공!" : "상품 추가 실패!"; 
%>
<script>
	window.alert('<%=msg %>');
	location.href='itemAdd.jsp';
</script>