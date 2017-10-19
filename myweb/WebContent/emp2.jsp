<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<style>
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
<%@include file="/header.jsp" %>
<section>
	<article>
		<h2>사원 관리 프로그램(Beans)</h2>
		<form name="empAdd2" action="empAdd2_ok.jsp" method="post">
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
	<article>
		<form name="empDel2" action="empDel2_ok.jsp">
			<fieldset>
				<legend>사원 삭제</legend>
				이름 <input type="text" name="name"><input type="submit" value="삭제">
			</fieldset>
		</form>
	</article>
	<article>
		<fieldset>
			<legend>모든 사원 보기</legend>
		<h4 align="center"><a href="empList2.jsp">모든 사원 내역 보기</a></h4>
		</fieldset>
	</article>
	<article>
		<form name="empSearch2" action="empSearch2_ok.jsp">
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
	<article>
		<form name="empUpdate2" action="empUpdate2.jsp">
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
</section>
<%@include file="/footer.jsp" %>
</body>
</html>