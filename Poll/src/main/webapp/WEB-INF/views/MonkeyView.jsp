<%@page import="Pack01.Person"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>MonkeyView.jsp</h3>
	<%
		int num = (int)request.getAttribute("num");
		String str = (String)request.getAttribute("str");
		out.println(num+", ");
		out.println(str+"<br/>");
		
		int[] ar = (int[])request.getAttribute("ar");
		for(int value: ar){
			out.println(value+" ");
		}out.println("<br/>");
		
		@SuppressWarnings("unchecked")
		LinkedList<Integer> li = 
				(LinkedList<Integer>)request.getAttribute("li");
		out.println(li.get(0)+" ");
		out.println(li.get(1)+" ");
		out.println(li.get(2)+" ");
		out.println("<br/>");
		
		@SuppressWarnings("unchecked")
		LinkedList<String> st = 
				(LinkedList<String>)request.getAttribute("st");
		out.println(st.get(0)+" ");
		out.println(st.get(1)+" ");
		out.println(st.get(2)+" ");
		out.println("<br/>");
		
		Person person = (Person)request.getAttribute("person");
		out.println(person.getId()+" ");
		out.println(person.getPw()+" ");
		out.println(person.getSalary()+" ");
		out.println("<br/>");
		
		@SuppressWarnings("unchecked")
		LinkedList<Person> plist = 
				(LinkedList<Person>)request.getAttribute("plist");
		out.println(plist.get(0).getId()+" "+
				plist.get(0).getPw()+" "+plist.get(0).getSalary());
		out.println(plist.get(1).getId()+" "+
				plist.get(1).getPw()+" "+plist.get(1).getSalary());
		out.println(plist.get(2).getId()+" "+
				plist.get(2).getPw()+" "+plist.get(2).getSalary());
		out.println("<br/>");
		for(int i = 0; i<plist.size();i++){
			out.println("얍"+ plist.get(i).getId()+" "+
					plist.get(i).getPw()+" "+plist.get(i).getSalary());
		}
		out.println("<br/>");
	%>
	
	<c:forEach var="a" items="${plist}" varStatus="b">
	${b.index} : ${a.getId()} ${a.getPw()} ${a.getSalary()} <br/>
	</c:forEach>
</body>
</html>