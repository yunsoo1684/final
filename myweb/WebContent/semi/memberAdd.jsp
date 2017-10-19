<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/semiLayout.css">
<style >


.darkGrey {
  color: #bbb;
  text-shadow: 0 0 2px rgba(0, 0, 0, .7);
  background-color: #474747;
  border-color: #1c1c1c #202020 #222;
 
}
.rounded {border-radius:100em!important;}



</style>

<script type="text/javascript">
function openIdCheck() {
   window.open('idCheck.jsp','idCheck',"width=300,height=200")
}

</script>

</head>

<body>
   <%@include file="../semi/header.jsp"%>

   <section style="padding-right: 400px; padding-left: 400px;">
   
   
      <article style="width: 450px;">
         <form action="">
         <h2 align="center">SIGN UP</h2>
         <hr>
         <fieldset>
            <table>
               <tr>
                  <br>
                  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="text" name="id" required placeholder="YOUR ID" style="height: 30px;">
                  <input type="button" class="darkGrey rounded" value="중복검사" onclick="openIdCheck()">
                  </td>
                  
               </tr>
               
               <tr>
               
               <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  
               <input type="text" name="pwd" required placeholder="YOUR PWD" style="height: 30px;">
               
               </td>
               
               </tr>
               <tr>
               <td>
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="text" required placeholder="address" style="height: 30px;">
               </td>
               </tr>
                
               
               
                  <tr>
                  <td>
                  &nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <input type="text" required placeholder="E-mail"
                        name="email" size="8">@<input type="text" size="8">
                        <select style="width:85px">
                         <option>naver.com</option>
                         <option>daum.net</option>
                         <option>gmail.com</option>
                         <option>nate.com</option> 
                        </select>
                  </td>
                  
                  
                  
                  </tr>
                  <tr>
                  
                  <td>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <font size="2" color="gray">생일</font> <input type="text"
                        required placeholder="년(4자)" size="6"> <select
                        name="job">
                           <option value="1월">1월</option>
                           <option value="2월">2월</option>
                           <option value="3월">3월</option>
                           <option value="4월">4월</option>
                           <option value="5월">5월</option>
                           <option value="6월">6월</option>
                           <option value="7월">7월</option>
                           <option value="4월">8월</option>
                           <option value="5월">9월</option>
                           <option value="6월">10월</option>
                           <option value="5월">11월</option>
                           <option value="6월">12월</option>
                           <br>
                     </select> <input type="text" required placeholder="일" size="3"></td>
                  </tr>
               <tr>
                     <td>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="radio" name="se" value="남자"> <font
                        size="2" color="black">남자</font> <input type="radio" name="se"
                        value="여자" checked> <font size="2" color="black">여자
                     </font></td>
                  </tr>
                    <tr>
                     <td>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     +82 <input type="text" required placeholder="휴대 전화번호"
                        name="tel">
                     </td>
                  </tr>
               <tr>
                     <td>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                     <input type="submit" value="SIGN UP" style="width:170px"
                     class="darkGrey rounded"></td>
                  </tr>
               
               

            </table>
            </fieldset>
         </form>
      </article>

   </section>












   <%@include file="../semi/footer.jsp"%>
</body>
</html>