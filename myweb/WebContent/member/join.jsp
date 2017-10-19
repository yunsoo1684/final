<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
<style>
h2{
text-align:center;

}

fieldset {
   width:450px;
   margin:0px auto;
}

section li{
list-style-type:none;

}

label{
width:90px;
float:left;
}

section p{
text-align:center;
}

</style>
<script>
function openIdCheck(){
window.open('idCheck.jsp','idCheck','width=300','heigh=200');
}
</script>
</head>
<body>
<%@include file="/header.jsp"%>
<section>
   <article>
      <h2>회원가입</h2>
      <form name="join" action="join_ok.jsp">
         <fieldset>
            <legend>기본정보</legend>
            <ul>
               <li><label>ID</label> <input type="text" name="id" readonly>
               <input type="button" value="중복검사" onclick="openIdCheck()">
               </li>

               <li><label>Name</label> <input type="text" name="name">
               </li>
               
               <li><label>Password</label> <input type="password" name="pwd">
               </li>

               <li><label>Telephone</label> <input type="text" name="tel">
               </li>

               <li><label>Address</label> <input type="text" name="addr"></li>
            </ul>
               
            <p><input type="submit" value="회원가입">
               <input type="reset" value="다시작성">
            </p>
         </fieldset>
      </form>
   </article>
</section>
<%@include file="/footer.jsp"%>
</body>
</html>