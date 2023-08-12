<%@page import="com.tjoeun.vo.BoardList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");
		
// 메인에 표시될 공지글 얻어오기
BoardList boardList = (BoardList) request.getAttribute("mainBoardList");
session.setAttribute("mainBoardList", boardList);
//pageContext.forward("index");
response.sendRedirect("main");
%>

</body>
</html>