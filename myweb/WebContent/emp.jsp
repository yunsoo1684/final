<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<style>
	label{
		width: 90px;
		float: left;
	}
	
	fieldset{
		margin: 0px auto;
		width: 300px; 
	}
	
	h2{
		text-align: center;
	}
</style>
</head>
<body>
<%@include file="header.jsp" %>
<section>
	<article>
		<h2>사원 관리 프로그램</h2>	
		<form name="empAdd" action="empAdd_ok.jsp">
			<fieldset>
				<legend>사원 등록</legend>
				<table>
					<tr>
						<th>사원 이름</th>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<th>E-Mail</th>
						<td><input type="text" name="email"></td>
					</tr>
					<tr>
						<th>부서명</th>
						<td><input type="text" name="dept"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" value="사원 등록">
							<input type="reset" value="다시 작성">
						</td>
					</tr>
				</table>
			</fieldset>
		</form>
	</article>
	<hr>
	<article>
		<form name="empDel" action="empDel_ok.jsp">
			<fieldset>
				<legend>사원 삭제</legend>
				<table>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" required="required"></td>
						<td><input type="submit" value="사원퇴사"></td>
					</tr>
				</table>
			</fieldset>
		</form>
	</article>
	<hr>
	<article>
		<fieldset>
			<legend>모든 사원 보기</legend>
		<h4 align="center"><a href="empList.jsp">모든 사원 내역 보기</a></h4>
		</fieldset>
	</article>
	<hr>
	<article>
		<form name="empSerach" action="empSearch_ok.jsp">
			<fieldset>
				<legend>사원 검색</legend>
				<table>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name"></td>
						<td><input type="submit" value="검색"></td>
					</tr>
				</table>
			</fieldset>
		</form>
	</article>
	<hr>
	<article>
		<form name="empUpdate" action="empUpdate.jsp">
			<fieldset>
				<legend>사원 수정</legend>
				<table>
					<tr>
						<th>사원 번호</th>
						<td><input type="text" name="idx"></td>
						<td><input type="submit" value="검색"></td>
					</tr>
				</table>
			</fieldset>
		</form>
	</article>
	<!-- <article>
		<form name="empUpdateForm" action="empUpdate.jsp">
			<table>
				<tr>
					<th>사원번호</th>
					<td><input type="text" name="idx"></td>
					<td><input type="submit" value="사원수정조회">
				</tr>
			</table>
		</form>
	</article> -->
</section>
<%@include file="footer.jsp" %>
</body>
</html>