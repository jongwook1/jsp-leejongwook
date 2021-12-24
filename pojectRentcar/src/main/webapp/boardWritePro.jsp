<%@page import="util.DBManager"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
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

	<%--String id = request.getParameter("id"); --%>



	<% 
	request.setCharacterEncoding("UTF-8");	
	
	
	
	String id  = request.getParameter("id"); 
	String pw = request.getParameter("pw");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	
	BoardDAO Bdao = BoardDAO.getInstance();
	
	
	ArrayList<BoardDTO> bDatas = Bdao.getBoard();
	DBManager.getConnection();
	
	BoardDTO board = new BoardDTO(id, pw, title, content);
	Bdao.addBoard(board);	
	response.sendRedirect("boardList.jsp");
	DBManager.getConnection();
	%>
	"id" ====== id
</body>
</html>