<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
 <%
 request.setCharacterEncoding("UTF-8");
    String name = (String)request.getAttribute("name");
    Integer id = (Integer)request.getAttribute("id");
    Integer count = (Integer)request.getAttribute("count");
    session.setAttribute("id", id); //세션저장
    session.setAttribute("name", name);
     session.setMaxInactiveInterval(10000); 
  if(name == null){
   %>
   <h1> 존재하지 않는 회원입니다. 로그인 페이지로 돌아가세요</h1>
   <a href="index.jsp">로그인페이지로 가기</a><br/>   
 <% } else if (count == 1){ %> 
    <h1> 비밀번호 불일치 입니다. 로그인 페이지로 돌아가세요</h1>
    <a href="index.jsp">로그인페이지로 가기</a><br/>   
 <%  }  else {   %> 
<h1>  ${name} 님 로그인되었습니다.</h1>
   <a href="votecheck?id=<%=id%>">투표하러 가기</a><br/>   
   <% } %>
</body>
</html>