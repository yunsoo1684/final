<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yong.bbs.*"%>

<jsp:useBean id="bdto" class="admin.bbs.BbsDTO"/>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="admin.bbs.BbsDAO"/>

<% 	
int idx = Integer.parseInt(request.getParameter("idx"));

int result = bdao.itemUpdate(bdto, idx);

	String msg = result > 0? "상품 수정 성공" : "상품 수정 실패"; 
%>
<script>
	window.alert('<%=msg %>')
	location.href='/myweb/semi/index.jsp'
</script>