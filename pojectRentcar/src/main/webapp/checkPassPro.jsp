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
	// 권한이 필요한 탈퇴 처리 담당
	int dir = 0;
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	UserDAO dao = UserDAO.getInstance();
	if(dir == UserDAO.REMOVE){
		if(dao.deleteUser(id, pw) == -1){
		response.sendRedirect("checkPass.jsp");
		}
		else{
		// 탈퇴성공
		session.removeAttribute("log");
		response.sendRedirect("main.jsp");
		}
		
	}
	
	%>
</body>
</html>