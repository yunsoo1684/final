<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdto" class="yong.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="yong.member.MemberDAO"></jsp:useBean>

<%
	int result = mdao.memberJoin(mdto);
	String msg=result>0?"회원가입을 축하합니다.":"회원가입실패";
%>

<script>
	window.alert('<%=msg%>');
	location.href='/myweb/index.jsp';
</script>