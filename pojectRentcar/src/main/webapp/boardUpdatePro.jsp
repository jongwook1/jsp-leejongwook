<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardUpdatePro</title>
</head>
<body>
	업데이트프로
	<%
	request.setCharacterEncoding("UTF-8");
	
	int no = Integer.parseInt(request.getParameter("no"));
	String content = request.getParameter("content");
	

	BoardDAO dao = BoardDAO.getInstance();

	BoardDTO board = new BoardDTO(no, content);
	
	dao.updateBoard(board);
	response.sendRedirect("boardList.jsp");	
	
	
	
	%>
</body>
</html>