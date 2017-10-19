<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style >


.darkGrey {
  color: #bbb;
  text-shadow: 0 0 2px rgba(0, 0, 0, .7);
  background-color: #474747;
  border-color: #1c1c1c #202020 #222;
 
}
.rounded {border-radius:100em!important;}



</style>


</head>
<body>
<form name="idCheck"action="idCheck_ok.jsp">


<fieldset>
<legend>중복검사</legend>
<table>
<tr>
<td>
<input type="text" name="userid" size="14" required placeholder="id 검사">
&nbsp;&nbsp;&nbsp;
<input type="submit" value="중복검사"
class="darkGrey rounded"> 
</td>
</tr>
</table>
</fieldset>


</form>


</script>
</body>
</html>