<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<jsp:useBean id="wf" class="yong.wf.WebFolderDAO" scope="session"/>
<%
	String name = request.getParameter("name");
	
	String savePath = wf.USERS_HOME + "/" + wf.getCrpath();
	
	File f = new File(savePath);
	
	File files[] = f.listFiles();
	
	if(name == null || name.equals("")){
		%>
			<script>
				window.alert('폴더 이름을 입력해주세요!');
				location.href="newFolder.jsp";
			</script>
		<%
		
		return;
	}
	
	for(int i = 0; i < files.length; i++){
		if(files[i].getName().equals(name)){
			%>
				<script>
					window.alert('중복된 이름입니다!');
					location.href="newFolder.jsp";	
				</script>
			<%
			
			return;
		}
	}
	
	File f2 = new File(savePath + "/" + name);
	
	f2.mkdir();
	%>
		<script>
			window.alert('폴더 생성 성공!');
			window.self.close();
			opener.location.href="webFolder.jsp?cp=<%=wf.getCrpath() %>";
		</script>
	<%
%>