<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	삭제``
	<br />
	<%
	request.setCharacterEncoding("UTF-8");

	int no = Integer.parseInt(request.getParameter("no"));

	BoardDAO dao = BoardDAO.getInstance();

	BoardDTO board = new BoardDTO(no);

	dao.deleteBoard(board);
	response.sendRedirect("boardList.jsp");
	%>
	no ==
	<%=no%>
</body>
</html>