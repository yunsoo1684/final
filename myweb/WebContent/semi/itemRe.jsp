<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="admin.bbs.*" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="bdto" class="admin.bbs.BbsDTO"/>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="admin.bbs.BbsDAO"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
href="/myweb/css/semiLayout.css">
</head>
<body>
<%@include file="/semi/header.jsp" %>
<section>
	<form name="itemRe" action="itemRe_ok.jsp">
	<article>
	<%	int idxname = Integer.parseInt(request.getParameter("idx"));
	
			ArrayList<BbsDTO> arr = bdao.itemUpdate2(idxname);
			
		if(arr.size() == 0)
		{
			%>
			<script>
				window.alert('등록된 사번이 아닙니다!')
				location.href='emp2.jsp'
			</script>
			<%
		}else{
			for(int i = 0; i < arr.size(); i++)
			{
				arr.get(i).getIdx();
				arr.get(i).getCode();
				arr.get(i).getBrand();
				arr.get(i).getName();
				arr.get(i).getS();
				arr.get(i).getM();
				arr.get(i).getL();
				arr.get(i).getXl();
				arr.get(i).getFree();		
				
		 %>
		
		<table> 
		<tr>
					<th>idx</th>
					<td><input type="text" name="idx" value="<%=arr.get(i).getIdx() %>" readonly></td>
				</tr>
				<tr>
					<th>상품명</th>
					<td><input type="text" name="name" value="<%=arr.get(i).getCode() %>"></td>
				</tr>
				<tr>
					<th>상품 코드</th>
					<td><input type="text" name="code" value="<%=arr.get(i).getCode() %>"></td>
				</tr>
				<tr>
					<th>브랜드</th>
					<td><input type="text" name="brand" value="<%=arr.get(i).getBrand() %>"></td>
				</tr>
				<tr>
					<th>Size-S</th>
					<td><input type="text" name="s" value="<%=arr.get(i).getS() %>"></td>
				</tr>
				<tr>
					<th>Size-M</th>
					<td><input type="text" name="m" value="<%=arr.get(i).getM() %>"></td>
				</tr>
				<tr>
					<th>Size-L</th>
					<td><input type="text" name="l" value="<%=arr.get(i).getL() %>"></td>
				</tr>
				<tr>
					<th>Size-XL</th>
					<td><input type="text" name="xl" value="<%=arr.get(i).getXl() %>"></td>
				</tr>
				<tr>
					<th>Size-Free</th>
					<td><input type="text" name="free" value="<%=arr.get(i).getFree() %>"></td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="submit" value="수정">
						<input type="button" value="돌아가기" onclick="location.href='http://localhost:9090/myweb/semi/itemAdd.jsp';">
					</td>
				</tr>
		</table>
			<%}
		}	%>
	</article>
	</form>
</section>
<%@include file="/semi/footer.jsp" %>
</body>
</html>