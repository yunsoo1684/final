<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 내용 작성</title>
<link rel="stylesheet" type="text/css"
href="/myweb/css/semiLayout.css">
</head>
<body>
<%@include file="../semi/header.jsp" %>
<section>
<article>
<form name="itemwrite" action="itemAddWrite_ok.jsp">
<table>
<caption>상품추가</caption>
<tr>
<td>코드</td>
<td colspan=2> <input type="text" name="code"></td>
<td>상품명</td>
<td colspan=2><input type="text" name="name"></td>
</tr>
<tr>
<td>가격</td>
<td colspan=2> <input type="text" name="price"></td>
<td>브랜드</td>
<td colspan=2><input type="text" name="brand"></td>
</tr>
<tr>
<td>S사이즈</td>
<td colspan=2> <input type="text" name="sizes"></td>
<td>분류</td>
<td colspan=2><input type="text" name="type"></td>

</tr>
<tr>
<td>M사이즈</td>
<td colspan=2> <input type="text" name="sizes"></td>
<td>L사이즈</td>
<td colspan=2><input type="text" name="type"></td>

</tr>
<tr>
<td>XL사이즈</td>
<td colspan=2> <input type="text" name="sizes"></td>
<td>FREE사이즈</td>
<td colspan=2><input type="text" name="type"></td>

</tr>
<tr>
<td colspan="2">사진:<input type="file" name="picture"></td>
</tr>
<tr>
<td><input type="submit" value="상품추가"></td>
</tr>
</table>
</form></article></section>
<%@include file="../semi/footer.jsp" %>
</body>
</html>