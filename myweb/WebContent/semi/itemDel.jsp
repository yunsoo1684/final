<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bdto" class="admin.bbs.BbsDTO"/>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="admin.bbs.BbsDAO"/>
<%
	String codes = request.getParameter("code");
	
	int result = bdao.bbsDelete(codes);
	
	String msg = result > 0? "삭제 성공!" : "삭제 실패!"; 
%>
<script>
	window.alert('<%=msg %>');
	location.href='itemAdd.jsp';
</script>