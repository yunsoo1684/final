<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<jsp:useBean id="wf" class="yong.wf.WebFolderDAO" scope="session"/>
<%
	String cp = request.getParameter("cp");

	String savePath = wf.USERS_HOME + "/" + wf.getCrpath();
	
	File f = new File(savePath+"/"+cp);
	
	wf.delete(f);
	f.delete();
%>

<script>
	window.alert('파일 삭제 성공!');
	location.href='webFolder.jsp?cp=<%=wf.getCrpath() %>';
</script>