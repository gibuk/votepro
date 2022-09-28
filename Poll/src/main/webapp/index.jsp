<%@ page language="java" contentType="text/html; charset=UTF-8"

pageEncoding="UTF-8"%>

<%@ page import="java.util.*, java.text.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>

<title>메인 페이지</title>

</head>

<body>

<%=new Date()%>

<h2>Hello World</h2>

<a href="t1">링크1</a><br/>
<a href="t2">링크2</a><br/>
<a href="t3?name=apple">링크3</a><br/>
<a href="t4?name=banana&age=30">링크4</a><br/> 
<a href="t5?name=orange&age=40">링크5</a><br/>
<a href="t6">링크6</a><br/>
<a href="t7?name=kiwi&age=50">링크7</a><br/>
<a href="t8">링크8</a><br/>
<a href="t9?tf=true">링크9-true</a><br/>
<a href="t9?tf=false">링크9-false</a><br/>
<a href="t10">링크10</a><br/>
<form method=post action="t13">
	<input type="text" name="id" value="tiger"/><br/>
	<input type="number" name="pw" value="1234"/><br/>
	<input type="number" name="salary" value="1000"/><br/>
	<input type="submit" value="전송"/><br/>	
</form>

<a href="t14">링크14</a><br/>
<a href="t15">링크15-1</a><br/>
<a href="t15?name=apple">링크15-2</a><br/>

<a href="t16">링크16-1</a><br/>
<a href="t16?name=강아지">링크16-2</a><br/>

<!-- 기본값은 get이다 -->
<form method=GET action="t17">
	<input type="text" name="id" value="tiger"/><br/>
	<input type="submit" value="GET전송"/><br/>	
</form>
<form method=POST action="t17">
	<input type="text" name="id" value="tiger"/><br/>
	<input type="submit" value="POST전송"/><br/>	
</form>

<a href="register/t19">링크19(step01)</a><br/>
<a href="register/t20">링크20(step02)</a><br/>
<a href="register/t21">링크21(step03)</a><br/>

</body>