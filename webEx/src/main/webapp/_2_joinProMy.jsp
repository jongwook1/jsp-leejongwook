<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	조인프로<br>
	<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw1 = request.getParameter("pw1");
	String pw2 = request.getParameter("pw2");
	String name = request.getParameter("name");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String s = request.getParameter("s");
	String email = request.getParameter("email");
	String phonNumber = request.getParameter("phonNumber");
	
	%>
	id: <%=id %><br>
	pw1: <%=pw1 %><br>
	pw2: <%=pw2 %><br>
	name: <%=name %><br>
	year: <%=year %><br>
	month: <%=month %><br>
	day: <%=day %><br>
	s = <%=s %><br>
	email: <%=email %><br>
	phonNumber: <%=phonNumber %>
	
</body>
</html>