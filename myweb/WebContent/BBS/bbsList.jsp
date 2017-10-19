<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="yong.bbs.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="bdao" class="yong.bbs.BbsDAO"/>
<%
	int totalCnt = bdao.getTotalCnt(); // 총 게시물 수
	int listSize = 3; // 보여줄 리스트 수
	int pageSize = 5; // 보여줄 페이지 수
	
	String cp_s = request.getParameter("cp");
	
	if(cp_s == null || cp_s.equals("")){
		cp_s = "1";
	}
	
	int cp = Integer.parseInt(cp_s); 
	
	int pageCnt = totalCnt / listSize + 1;
	
	if(totalCnt % listSize == 0)pageCnt--;
	
	int userGroup = cp / pageSize;
	
	if(cp % pageSize == 0)userGroup--;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
<style>
h2{
	text-align: center;
}

table{
	margin: 0px auto;
	width: 550px;
	border-spacing: 0px;
	border-top: 3px double darkblue;
	border-bottom: 3px double darkblue;
}

table th{
	background-color: skyblue;
}
</style>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<h2>자 유 게 시 판</h2>
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<%
						ArrayList<BbsDTO> arr = bdao.bbsList(cp,listSize);
						
						if(arr == null || arr.size() == 0){
							%>
							<tr>
								<td colspan="4" align="center">등록된 게시글이 없습니다.</td>
							</tr>
							<%
						}else{
							for(int i = 0; i < arr.size(); i++){
								%>
									<tr>
										<td><%=arr.get(i).getIdx() %></td>
										<td>
											<%
												for(int z = 1; z <= arr.get(i).getLev(); z++){
													out.println("&nbsp;&nbsp;");
												}
											%>
										<a href="bbsContent.jsp?idx=<%=arr.get(i).getIdx() %>&readnum=<%=arr.get(i).getReadnum()%>"><%=arr.get(i).getSubject() %></a></td>
										<td><%=arr.get(i).getWriter() %></td>
										<td><%=arr.get(i).getReadnum() %></td>
									</tr>
								<%
							}
						}
					%>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="3" align="center">
							<%
								if(userGroup != 0){
									%>
										<a href="bbsList.jsp?cp=<%=(userGroup - 1) * pageSize + pageSize%>">&lt;&lt;</a>
									<%
								}
								
								for(int i = (userGroup * pageSize + 1); i <= (userGroup * pageSize + pageSize); i++){
									%>
										&nbsp;&nbsp;<a href="bbsList.jsp?cp=<%=i %>"><%=i %></a>&nbsp;&nbsp;
									<%
									if(i == pageCnt){
										break;
									}
								}
								
								if(userGroup!=(pageCnt/pageSize-(pageCnt%pageSize==0?1:0))){
									   %>
									   <a href="bbsList.jsp?cp=<%=(userGroup+1)*pageSize+1%>">&gt;&gt;</a>
									   <%
									}
							%>
						</td>
						<td><a href="bbsWrite.jsp">글쓰기</a></td>
					</tr>
				</tfoot>
			</table>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>