
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
   <h1> 투표를 성공하셨습니다. </h1>
   <%
   request.setCharacterEncoding("UTF-8");
   
   String result = (String)request.getAttribute("result");
   String resultstr = (String)request.getAttribute("resultstr");
   if (result.equals("S")) {
      //out.println("success");
   } else if (result.equals("F")) {
      //out.println("fail");
   }
   %>
   <a href="vr">투표결과보기</a>
</body>
</html>