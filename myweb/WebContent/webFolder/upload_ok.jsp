<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<jsp:useBean id="wf" class="yong.wf.WebFolderDAO" scope="session"/>
<%
	String savePath = wf.USERS_HOME + "/" + wf.getCrpath();
	try{
		MultipartRequest mr = new MultipartRequest(request, savePath, wf.getFreeSize(), "utf-8");	
	}catch(Exception e){
		%>
			<script>
				window.alert("예상치 못한 오류가 발생함!");
				window.self.close();
			</script>
		<%
	}
%>
<script>
	window.alert('파일 올리기 성공!');
	opener.location.href='webFolder.jsp?cp=<%=wf.getCrpath() %>';
	window.self.close();
</script>