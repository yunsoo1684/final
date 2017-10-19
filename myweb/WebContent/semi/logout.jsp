<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
session.removeAttribute("name");
response.sendRedirect("/Web1/semi");
%>
   <script>
   window.alert('로그아웃 했습니다.');

   location.href='index.jsp';
   opener.location.reload();
   </script>