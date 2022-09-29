<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"

pageEncoding="UTF-8"%>

<%@ page import="java.util.*, java.text.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>

<title>로그인 페이지 </title>

</head>
<style>
  #if{  width: 0px;  height: 0px;  border: 0px; }
</style>
<body>
<%
 request.setCharacterEncoding("utf-8");
 Integer id = (Integer)session.getAttribute("id");
 String name = (String)session.getAttribute("name");
 if(id!=null){
   session.invalidate();
 %>
   <script> 
   alert("로그아웃 되었습니다.");
   </script> 
 <%  } %> 
 
   
<div>
<h1>로그인 창</h1>
<form  action="Indexcontroller" method="get">
   <input  type="text" name="name" ><br>
   <input  type="number" name="pwd" > <br>
   <input   type="submit" value="전송" >
     
</form>
</div>
<iframe id ="if" name="login_if"></iframe>




</body>