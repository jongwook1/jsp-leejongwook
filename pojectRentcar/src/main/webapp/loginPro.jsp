

<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	String pw =  request.getParameter("pw");
	
	UserDAO dao = UserDAO.getInstance();
	
	if(dao.checkLogin(id, pw)){
		session.setAttribute("log", id);	
		response.sendRedirect("main.jsp");%>
	<%--  response.sendRedirect("_7_boardList.jsp"); --%>
	<%	
	}
	else{
		response.sendRedirect("login.jsp");
	}
	%>
</body>
</html>