<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
span {
	white-space: pre;
}
</style>

<title>Document</title>
</head>
<body>
	<h1>BOARD WRITE</h1>

	<form method="post" action="boardWritePro.jsp">
		<%--   <span>no:&#9;</span> <input type="text" name="no"><br><br> --%>
		<span>title:&#9;</span> <input type="text" name="title" id=""><br>
		<br> <span>pw:&#9;</span> <input type="text" name="pw" id=""><br>
		<br> <span>content:&#9;</span><br>
		<textarea name="content" id="" cols="30" rows="10"></textarea>
		<br>
		<br>
		<%-- <span>likes:&#9;</span><input type="text" name="likes" id=""><br><br> --%>
		<input type="hidden" name="id" id=""
			value=<%=session.getAttribute("log") %>><br>
		<br> <input type="submit">
	</form>

</body>
</html>