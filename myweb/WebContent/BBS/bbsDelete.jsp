<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bdao" class="yong.bbs.BbsDAO" scope="session"/>
<%
	int ref = Integer.parseInt(request.getParameter("ref"));
	int lev = Integer.parseInt(request.getParameter("lev"));
	int sunbun = Integer.parseInt(request.getParameter("sunbun"));
	String subject = request.getParameter("subject");
	
	int result = bdao.bbsDelete(subject, ref, lev, sunbun);
	
	String msg = result > 0? "삭제 성공!" : "삭제 실패!"; 
%>
<script>
	window.alert('<%=msg %>');
	location.href='bbsList.jsp';
</script>