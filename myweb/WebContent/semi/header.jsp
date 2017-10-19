<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>


<div style="height: 270px">
<div style="height: 20px; background-color: black">
<ul>

<li ><a href="https://www.facebook.com/yang.jinmo.7" target="_blank">facebook</a> </li>
<li> <a href="https://www.instagram.com/memory_jinmo/" target="_blank" >instagram</a></li>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


<%
String id=(String)session.getAttribute("id");
String name=(String)session.getAttribute("name");
if(name==null){
   
   %>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <li> <a href="memberAdd.jsp">Join</a></li>
   <li> <a href="login.jsp">Login</a></li>
   <li> My page</li>
   <% 
}
else if(name.equals("관리자")){
   %>
   
   <li> <%=name  %> 님 환영합니다. </li>
   <li> <a href="itemAdd.jsp">상품등록하기</a></li>
   <li> <a href="logout.jsp">Logout</a></li>
   <li> My page</li>
   <%
}else{
   
}

%>


</ul>
</div>


<div style="height: 187px">
<article id="mainImg">
<a href="index.jsp"><img src="../img/Logo.jpg" ></a>
</article>



<article style="margin-top:70px; margin-left:70px; margin-right:70px; margin-bottom:51px; float: right;" >
<ul>
<li><font color="blue" size="5">N e w</font> </li> &nbsp;&nbsp;
<li><font color="red"  size="5">H o t </font></li> &nbsp;&nbsp;
<li><font color="black"  size="5">Q & A</font> </li> &nbsp;&nbsp;
<li><input type="text" size ="20" style="height:20px;" placeholder="상품검색"></li>

</ul>
</div>







<div style="height: 43px;">
<ul>
<li><strong><font size="4px" color="black">

   Brand


</font></strong></li>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<li><strong><a href="*"><font size="4px" color="black">Top</font></a></strong></li>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<li><strong><a href="*"><font size="4px" color="black">Bottom</font></a></strong></li>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<li><strong><a href="*"><font size="4px" color="black">Outer</font></a></strong></li>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<li><strong><a href="*"><font size="4px" color="black">Shose</font></a></strong></li>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<li><strong><a href="*"><font size="4px" color="black">Acc</font></a></strong></li>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<li><strong><a href="*"><font size="4px" color="black">Etc</font></a></strong></li>

</ul>
</div>
<div style="height: 20px; background-color: black">

</div>
</div>
<br>
</header>
