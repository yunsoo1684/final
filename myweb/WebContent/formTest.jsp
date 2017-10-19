<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<style>
	h2{
		text-align: center;
	}
	
	fieldset{
		margin: 0px auto;
		width: 450px; 
	}
	
	label{
		width: 90px;
		float: left;
	}
	
	fieldset p{
		text-align: center;
	}
</style>
</head>
<body>
<%@include file="header.jsp" %>
<section>
	<article>
	<h2>Form 테스트</h2>
	<form name="fm" action="formTest_ok.jsp">
	<fieldset>
		<legend>간단한 정보</legend>
		<ul>
			<li><label>이름</label>
				<input type="text" name="name">
			</li>
			<li><label>비밀번호</label>
				<input type="password" name="pwd">
			</li>
			<li><label>성별</label>
				<input type="radio" name="se" value="남자">남자
				<input type="radio" name="se" value="여자">여자
				<input type="radio" name="se" value="트랜스">트랜스
			</li>
			<li><label>취미</label>
				<input type="checkbox" name="cb" value="1">독서
				<input type="checkbox" name="cb" value="2">공부
				<input type="checkbox" name="cb" value="3">스포츠
				<input type="checkbox" name="cb" value="4">게임
				<input type="checkbox" name="cb" value="5">잠자기
			</li>
		</ul>
		<p>
			<input type="submit" value="전달하기">
			<input type="reset" value="다시 작성">
		</p>
	</fieldset>
	</form>
	</article>
</section>
<%@include file="footer.jsp" %>
</body>
</html>