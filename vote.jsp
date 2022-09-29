<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

int id = (int)session.getAttribute("id");
String vc = (String)request.getAttribute("vc");
if (vc.equals("Y")) {
%>
<h1>이미 투표하셨습니다.</h1>
 <a href="vr">투표결과보기</a>
<%} else {
%>
   <div id="wrap">
      <h1>투표하기</h1>
      <div id="vote_wrap">
         <fieldset>
            <legend>선호 동물</legend>
            <form action="vote">
               <input type="hidden" name="id" value="<%=id %>">
               <div class="option">
                  <label> 독수리 : <input type="radio" name="candiname" value="독수리"
                     checked="checked">
                  </label>
               </div>

               <div class="option">
                  <label> 호랑이 : <input type="radio" name="candiname" value="호랑이">
                  </label>

               </div>

               <div class="option">
                  <label> 코끼리 : <input type="radio" name="candiname" value="코끼리">
                  </label>
               </div>

               <input type="submit" value="전송" id = "button">
            </form>
            
         </fieldset>
         <button onclick="location.href='index.jsp'" id = "main">메인</button>
         
         
      </div>

   </div>
<%} %>   
</body>
</html>