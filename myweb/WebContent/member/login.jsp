<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	fieldset li{
		list-style-type : none;
	}
	
	fieldset label{
		width : 90px;
		float : left;
	}
	
	fieldset p{
		text-align : right;
	}
</style>
</head>
<%
	Cookie cks[] = request.getCookies();
	String saveid = "";
	if(cks != null){
		for(int i = 0; i < cks.length; i++){
			if(cks[i].getName().equals("saveid")){
				saveid = URLDecoder.decode(cks[i].getValue());
			}
		}
	}
%>
<body>
<form name="login" action="login_ok.jsp" method="post">
<fieldset>
	<legend>LOGIN</legend>
	<ul>
		<li>
			<label>ID</label>
			<input type="text" name="userid" placeholder="아이디" value="<%=saveid %>">
		</li>
		<li>
			<label>Password</label>
			<input type="password" name="userpwd" placeholder="비밀번호">
		</li>
	</ul>
	<p><input type="checkbox" name="saveid" value="on" <%=saveid.equals("") ? "" : "checked" %>>ID 기억하기 
	   <input type="submit" value="Login"></p>
</fieldset>
</form>
</body>
</html>