<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JOIN PRO</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw1");
	String userName = request.getParameter("name");
	int birth = Integer.parseInt(request.getParameter("birth"));
	String sex = request.getParameter("sex");	
	String email = request.getParameter("email");	
	int phoneNumber = Integer.parseInt(request.getParameter("phonNumber"));
	
	UserDAO dao = UserDAO.getInstance();
	
	
	
	UserDTO user = new UserDTO(id, pw);	
	
	
	
	UserDTO user2 = new UserDTO(id, pw, userName, birth, sex, email, phoneNumber);
	
	
	if(dao.addUser(user2) != -1){
		response.sendRedirect("main.jsp");		
	}
	else{
		response.sendRedirect("join.jsp");
	}
	
	
	%>

</body>
</html>