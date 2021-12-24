<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원 권한 확인</h1>
	<form method="post" action="checkPassPro.jsp">
		<span>id:&#9;</span> <input type="text" name="id"
			value=<%=session.getAttribute("log") %>><br> <br> <span>pw:&#9;</span>
		<input type="password" name="pw"><br> <br> <input
			type="submit"> <input type="button" id="gotoMain"
			value="main페이지로 돌아가기" onClick="location.href='main.jsp'";>
	</form>
</body>
</html>