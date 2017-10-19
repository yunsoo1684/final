<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
</style>
<title>로그인</title>
<%
   String id1 = (String) session.getAttribute("id");
   Cookie cks[] = request.getCookies();
   String saveid = "";
   if (cks != null) {
      for (int i = 0; i < cks.length; i++) {
         if (cks[i].getName().equals("saveid")) {
            saveid = cks[i].getValue();
         }
      }
   }
%>
<link rel="stylesheet" type="text/css" href="/myweb/css/semiLayout.css">
</head>
<body>
   <%@include file="header.jsp"%>
      <section>
      <div>
         <div style="float: left;">
         <img src="/myweb/img/main1.jpg">
         </div>
         <div style="float: left;">
            <article>
               <form name="login" action="login_ok.jsp">
                  <fieldset style="width:300px;">
                     <legend>L O G I N</legend>
                     <%
                        if (id1 == null) {
                     %>
                      <input type="text" name="id" required placeholder="YOUR ID" style="height: 30px;"><br>
                     <%
                        } else {
                     %>
                      <input type="text" name="id" required placeholder="YOUR ID" style="height: 30px;" value="<%=id1%>"><br>
                     
                     <%
                        }
                     %>
                     <input type="password" name="pw" required placeholder="YOUR PWD" style="height: 30px;"><br>
                     <input type="checkbox" name="store" value="on">
                     <font size="2" color="gray" <%=saveid.equals("") ? "" : "checked"%>>
                        아이디기억
                     </font>
                     <input type="submit" value="로그인">
                  </fieldset>
               </form>
            </article>
            </div>
            <div style="float: center;">
         <img src="/myweb/img/main.jpg">
         </div>
            </div>
         </section>
   <%@include file="../semi/footer.jsp"%>
</body>
</html>