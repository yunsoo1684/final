<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yong.bbs.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="bdao" class="yong.bbs.BbsDAO"/>
<%
	String idx_s = request.getParameter("idx");
	
	int readnum = Integer.parseInt(request.getParameter("readnum"));
	

	if(idx_s == null || idx_s.equals("")){
		idx_s = "0";
	}
	
	int idx = Integer.parseInt(idx_s);
	
	BbsDTO dto = bdao.bbsContent(idx);
	
	if(dto == null){
		%>
			<script>
				window.alert('잘못된 접근 또는 삭제된 게시글입니다.');
				location.href="bbsList.jsp";
			</script>
		<%
			return;
	}
	
	readnum = bdao.readNumber(readnum, idx);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
</head>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<h2>자유게시판 본문보기</h2>
			<table border="1" bordercolor="blue" sellspacing="0" width="500">
				<tr>
					<th>번호</th>
					<td><%=dto.getIdx() %></td>
					<th>작성날짜</th>
					<td><%=dto.getWritedate() %></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><%=dto.getWriter() %></td>
					<th>조회수</th>
					<td><%=dto.getReadnum() %></td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3"><%=dto.getSubject() %></td>
				</tr>
				<tr height="200">
					<td colspan="4" align="left" valign="top"><%=dto.getContent().replaceAll("\n", "<br>") %></td>
				</tr>
				<tr>
					<td colspan="4" align="center"><a href="bbsList.jsp">목록으로</a> || <a href="bbsReWrite.jsp?subject=<%=dto.getSubject() %>&ref=<%=dto.getRef()%>&lev=<%=dto.getLev() %>&sunbun=<%=dto.getSunbun() %>">답변쓰기</a> || <a href="bbsDelete.jsp?ref=<%=dto.getRef() %>&lev=<%=dto.getLev() %>&sunbun=<%=dto.getSunbun()%>&subject=<%=dto.getSubject() %>">삭제</a></td>
				</tr>
			</table>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>