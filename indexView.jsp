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
    session.setAttribute("id", id); //��������
    session.setAttribute("name", name);
     session.setMaxInactiveInterval(10000); 
  if(name == null){
   %>
   <h1> �������� �ʴ� ȸ���Դϴ�. �α��� �������� ���ư�����</h1>
   <a href="index.jsp">�α����������� ����</a><br/>   
 <% } else if (count == 1){ %> 
    <h1> ��й�ȣ ����ġ �Դϴ�. �α��� �������� ���ư�����</h1>
    <a href="index.jsp">�α����������� ����</a><br/>   
 <%  }  else {   %> 
<h1>  ${name} �� �α��εǾ����ϴ�.</h1>
   <a href="votecheck?id=<%=id%>">��ǥ�Ϸ� ����</a><br/>   
   <% } %>
</body>
</html>