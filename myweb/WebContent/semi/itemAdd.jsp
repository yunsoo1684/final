<%@page import="admin.bbs.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="yong.bbs.*"%>
<jsp:useBean id="bdao" class="admin.bbs.BbsDAO" scope="session" />
<%
	//모듈
	int totalCnt = bdao.getTotalCnt();//총게시물수 
	int listSize = 10; //보여줄리스트수
	int pageSize = 5; // 보여줄페이지수
	String cp_s = request.getParameter("cp");
	if (cp_s == null || cp_s.equals("")) {
		cp_s = "1";
	}
	int cp = Integer.parseInt(cp_s);
	int pageCnt = totalCnt / listSize + 1;
	if (totalCnt % listSize == 0)
		pageCnt--;//총페이지수
	int userGroup = cp / pageSize;
	if (cp % pageSize == 0)
		userGroup--;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 추가</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/semiLayout.css">
</head>
<body>
	<%@include file="../semi/header.jsp"%>
	<section>
		<form name="frm" action="itemDel.jsp">
			<article>
				<h2>상품등록</h2>
				<table>
					<tr>
						<th>번호</th>
						<th>상품명</th>
						<th>상품코드</th>
						<th>브랜드</th>
						<th>size-S</th>
						<th>size-M</th>
						<th>size-L</th>
						<th>size-XL</th>
						<th>size-Free</th>
					</tr>
					<%
						ArrayList<BbsDTO> arr = bdao.bbsList(cp, listSize);
						if (arr == null || arr.size() == 0) {
					%>
					<tr>
						<td colspan="4" align="center">등록된 게시글이 없습니다.</td>
					</tr>
					<%
						} else {
							for (int i = 0; i < arr.size(); i++) {
					%>
					<tr>
						<td><%=arr.get(i).getIdx()%></td>
						<td><a href="bbsContent.jsp?idx=<%=arr.get(i).getIdx()%>"><%=arr.get(i).getName()%></a></td>
						<td><%=arr.get(i).getCode()%></td>
						<td><%=arr.get(i).getBrand()%></td>
						<td><%=arr.get(i).getS()%></td>
						<td><%=arr.get(i).getM()%></td>
						<td><%=arr.get(i).getL()%></td>
						<td><%=arr.get(i).getXl()%></td>
						<td><%=arr.get(i).getFree()%></td>
						<td></td>
						<td><input type="submit" value="상품 삭제"></td>
						<td><input type="button" value="상품 수정"
							onclick="location.href='itemRe.jsp?idx=<%=arr.get(i).getIdx()%>'">
						</td>
					</tr>
					<%
						}
						}
					%>
					<tr>
						<td><input type="button" value="상품 등록"
							onclick="location.href='itemAddWrite.jsp'"></td>
					</tr>
					<tr>
						<td colspan="3" align="center">
							<%
								if (userGroup != 0) {
							%> <a href="bbsList.jsp?cp=<%=(userGroup - 1) * pageSize + pageSize%>">&lt;&lt;</a>
							<%
								}
								for (int i = (userGroup * pageSize + 1); i <= (userGroup * pageSize + pageSize); i++) {
							%> &nbsp; &nbsp; &nbsp; <a href="itemAdd.jsp?cp=<%=i%>"><%=i%></a>
							<%
								if (i == pageCnt) {
										break;
									}
								}
								if (userGroup != (pageCnt / pageSize - (pageCnt % pageSize == 0 ? 1 : 0))) {
							%> <a href="bbsList.jsp?cp=<%=(userGroup + 1) * pageSize + 1%>">&gt;&gt;</a>
							<%
}
%>
						</td>
					</tr>
				</table>
		</form>
		</article>
	</section>
	<%@include file="../semi/footer.jsp"%>
</body>
</html>