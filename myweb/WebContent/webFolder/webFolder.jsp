<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<jsp:useBean id="wf" class="yong.wf.WebFolderDAO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
<style>
	h2{
		text-align: center;
		color: orange;
		text-shadow: 3px 3px 3px darkblue;
	}
	
	fieldset{
		width: 550px;
		margin: 0px auto;
	}
	
	fieldset li{
		list-style-type: none;
	}
	
	fieldset label{
		width: 90px;
		float: left;
	}
	
	fieldset meter{
		width: 200px;
	}
	
	article table{
		top-border: 3px double darkblue;
		bottom-border: 3px double darkblue;
		border-spacing: 0px;
		margin: 0px auto;
		width: 550px;
	}
	
	article table th{
		background: skyblue;
	}
</style>
<script>
	function uploadOpen(){
		window.open('upload.jsp', 'upload', 'width=400, height=150');
	}
	
	function newFolder(){
		window.open('newFolder.jsp', 'newFolder', 'width=400, height=150');
	}
</script>
</head>
<body>
<%@include file="/header.jsp" %>
<%
	if(sid == null || sid.equals("")){
	%>
		<script>
			window.alert('로그인후 이용가능하십니다.');
			location.href='/myweb';
		</script>
	<%
		return;
	}
%>
<%
	wf.setUserid(sid);
	wf.userFolderExcists();
	
	String cp = request.getParameter("cp");
	if(cp == null || cp.equals("")){
		cp = wf.getUserid();
	}
	
	wf.setCrpath(cp);
%>
<section>
	<article>
		<h2><%=sname %> Y드라이브</h2>
		<fieldset>
			<legend>기본 정보</legend>
			<ul>
				<li><label>총용량</label><meter value="<%=wf.getTotalSize() %>" min="0" max="<%=wf.getTotalSize()%>" ></meter>(<%=wf.getTotalSize()/1024  %>)KByte</li>
				<li><label>사용용량</label><meter value="<%=wf.getUsedSize() %>" min="0" max="<%=wf.getTotalSize()%>"></meter>(<%=wf.getUsedSize()/1024 %>)KByte</li>
				<li><label>남은용량</label><meter value="<%=wf.getFreeSize() %>" min="0" max="<%=wf.getTotalSize()%>"></meter>(<%=wf.getFreeSize()/1024 %>)KByte</li>
			</ul>
		</fieldset>
	</article>
	<article>
		<fieldset>
			<legend>메뉴</legend>
			<input type="button" value="파일 올리기" onclick="uploadOpen()">
			<input type="button" value="폴더 만들기" onclick="newFolder()">
		</fieldset>
	</article>
	<article>
		<table>
			<thead>
				<tr>
					<th>TYPE</th>
					<th>File or Folder Name</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
			<%
				if(!wf.getCrpath().equals(wf.getUserid())){
					int pos = wf.getCrpath().lastIndexOf("/");
					String upcp = wf.getCrpath().substring(0, pos);
					%>
						<tr>
							<td colspan="3" align="left"><a href="webFolder.jsp?cp=<%=upcp%>">[상위로..]</a></td>
						</tr>
					<%				
				}
			%>
			<%
				File f = new File(wf.USERS_HOME + "/" + wf.getCrpath());
					
				File files[] = f.listFiles();
				if(files == null || files.length == 0){
					%>
						<tr>
							<td colspan="3" align="center">
							파일 또는 폴더가 존재하지 않습니다.
							</td>
						</tr>
					<%
				}else{
					for(int i = 0; i < files.length; i++){	
						%>
							<tr>
								<td><%=files[i].isFile() ? "[File]" : "[DIR]" %></td>
								<td>
								<%
									if(files[i].isFile()){
										%>
											<a href="/myweb/webFolder/upload/<%=wf.getCrpath()%>/<%=files[i].getName()%>"><%=files[i].getName() %></a>
										<% 
									}else{
										%>
											<a href="webFolder.jsp?cp=<%=wf.getCrpath() %>/<%=files[i].getName() %>"><%=files[i].getName() %></a>
										<%
									}%>
								</td>
								<td><a href="delete.jsp?cp=<%=files[i].getName()%>">삭제</a></td>
							</tr>
						<%
					}
				}
			%>
			</tbody>
		</table>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>