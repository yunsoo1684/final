<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mdao" class="yong.member.MemberDAO" scope="page"/>
<%
	String userid = URLEncoder.encode(request.getParameter("userid"));
	String userpwd = request.getParameter("userpwd");
	String saveid = request.getParameter("saveid");
	int result = mdao.loginCheck(userid, userpwd);
		
	if(result == mdao.LOGIN_OK){
		String username = mdao.getUserInfo(userid);
		
		session.setAttribute("sid", userid);
		session.setAttribute("sname", username);
		
		if(saveid != null){
			Cookie ck = new Cookie("saveid", userid);
			ck.setMaxAge(60 * 60 * 24 * 30);
			response.addCookie(ck);
		}else{
			Cookie ck = new Cookie("saveid", userid);
			ck.setMaxAge(0);
			response.addCookie(ck);
		}
		%>
			<script>
				window.alert('<%=username%>님 환영합니다.');
				opener.location.reload();
				window.self.close();
			</script>
		<%
	}else if(result == mdao.NOT_ID){
		%>
			<script>
				window.alert('등록되지 않은 ID입니다.');
				location.href='login.jsp';
			</script>
		<%
	}else if(result == mdao.NOT_PWD){
		%>
			<script>
				window.alert('잘못된 비밀번호입니다.');
				location.href="login.jsp";
			</script>
		<%
	}else if(result == mdao.ERROR){
		out.println("<h3>고객센터 연락바람~</h3>");
	}
%>