 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.sql.*" %>

<%
 request.setCharacterEncoding("euc-kr");
 String realFolder = "C:/pys/jspstudy/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/imgup/img";
 int maxSize = 1024*1024*5;
 String encType = "euc-kr";
 
 try{
  MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType);

 } catch(Exception e) {
  e.printStackTrace();
 }
 

%>

<title>Insert title here</title>
</head>
<body>
</body>
</html>

