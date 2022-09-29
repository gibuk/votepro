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
<h2>현재 상황입니다.<br>
투표인원 :<%=votecnt%>명<br/>
투표율 : <% out.println(String.format("%.1f",voteper)+"%"); %>
</h2>
<h3>
<%

if (votecnt==16) {
	if (samelank.length()==0) {
		out.println("당선자는 "+ firstman+" 입니다. 축하합니다!<br/><br/>");
	}
	else {
	out.println("당선자는 "+ samelank+" 입니다. 재투표하십시요!<br/><br/>");
	}
}
else {

if (votecnt>0 && samelank.length()>0){
	out.println(""+samelank+"후보자가 현재 공동 1등입니다.");
} else {
	out.println(""+firstman+"후보자가 현재 1등입니다.");	
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
	out.println("<li>"+(i+1)+"위 "+vd.getName()+" 득표수 : "+vd.getCnt()+", 득표율 : "+String.format("%.1f",candiper)+"%</li>");
 }
%>
</ul>
</h3>
</body>
</html>

