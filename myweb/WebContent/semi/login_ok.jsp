<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="mdao" class="yong.semi.SemiDAO"/>
<%
String userid= request.getParameter("id");
String userpw= request.getParameter("pw");
String store= request.getParameter("store");
int result = mdao.loginCheck(userid,userpw);
String str = mdao.getUserInfo(userid);
if(store==null){
   if(result==3){
      %>
      <script>
      window.alert('로그인 성공.');
      window.self.close();
      location.href='index.jsp';
      </script>
      <% 
      session.removeAttribute("id");
      session.setAttribute("name", str);
      
   %>
      <% 
   }else if(result==2){
      %>
      <script>
      window.alert('비밀번호가 틀렸습니다.');
      location.href='login.jsp';
      </script>
      <% 
   }else if(result==1){
      %>
      <script>
      window.alert('아이디가 틀렸습니다.');
      location.href='login.jsp';
      </script>
      <% 
   }
   else if(result==-1){
      %>
      
      <script>
      window.alert('오류.');
      location.href='login.jsp';
      </script>
      <% 
   }   

}
else{
   if(result==3){
      
         session.setAttribute("id", userid);
         session.setAttribute("name", str);
         Cookie ck = new Cookie("saveid",userid);
         ck.setMaxAge(60*60*24*30);
         response.addCookie(ck);
         %>
         <script>
         window.alert('로그인 성공.');
         window.self.close();
         location.href='index.jsp';
         </script>
         <% 
   %>
      <% 
   }else if(result==2){
      %>
      <script>
      window.alert('비밀번호가 틀렸습니다.');
      location.href='login.jsp';
      </script>
      <% 
   }else if(result==1){
      %>
      <script>
      window.alert('아이디가 틀렸습니다.');
      location.href='login.jsp';
      </script>
      <% 
   }
   else if(result==-1){
      %>
      <script>
      window.alert('오류.');
      location.href='login.jsp';
      </script>
      <% 
   }   
}

%>