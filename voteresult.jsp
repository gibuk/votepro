<%@page import="java.util.ArrayList"%>
<%@page import="Pack01.VoteDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@page import="java.util.LinkedList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%


request.setCharacterEncoding("UTF-8");
String name = (String)session.getAttribute("name");


@SuppressWarnings("unchecked")
ArrayList<VoteDTO> al = (ArrayList<VoteDTO>)request.getAttribute("al");
VoteDTO vd = new VoteDTO();
int votecnt=0;
int totalperson = 16;
String firstman="";
String samelank="";
int firstcnt=0;
ArrayList<Integer> alcnt = new ArrayList<Integer>();

for (int i=0;i<al.size();i++) {
	vd = al.get(i);
	votecnt = votecnt+vd.getCnt();
	out.println("<ol>");

	if (i==0) {
		firstman=vd.getName();
		firstcnt=vd.getCnt();
		samelank=firstman+" ";
	}		
	if (firstcnt==vd.getCnt() && i>0) {
		samelank=samelank+al.get(i).getName()+" ";		
	}	
}
float voteper = votecnt/(float)totalperson*100f;
if ( firstman.equals(samelank.substring(0,samelank.length()-1)) ) {
	samelank="";
}

%>
<h2>���� ��Ȳ�Դϴ�.<br>
��ǥ�ο� :<%=votecnt%>��<br/>
��ǥ�� : <% out.println(String.format("%.1f",voteper)+"%"); %>
</h2>
<h3>
<%

if (votecnt==16) {
	if (samelank.length()==0) {
		out.println("�缱�ڴ� "+ firstman+" �Դϴ�. �����մϴ�!<br/><br/>");
	}
	else {
	out.println("�缱�ڴ� "+ samelank+" �Դϴ�. ����ǥ�Ͻʽÿ�!<br/><br/>");
	}
}
else {

if (votecnt>0 && samelank.length()>0){
	out.println(""+samelank+"�ĺ��ڰ� ���� ���� 1���Դϴ�.");
} else {
	out.println(""+firstman+"�ĺ��ڰ� ���� 1���Դϴ�.");	
}
%>
<br/><br/>
<ul>
<%
}
float candiper = 0.0f;
for (int i=0;i<al.size();i++) {
	vd = al.get(i);
	candiper=(float)vd.getCnt()/(float)votecnt*100.0f;		
	out.println("<li>"+(i+1)+"�� "+vd.getName()+" ��ǥ�� : "+vd.getCnt()+", ��ǥ�� : "+String.format("%.1f",candiper)+"%</li>");
 }
%>
</ul>
</h3>
</body>
</html>

