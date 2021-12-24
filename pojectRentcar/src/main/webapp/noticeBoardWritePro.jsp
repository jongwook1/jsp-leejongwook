<%@page import="noticeBoard.NoticeBoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="noticeBoard.NoticeBoardDAO"%>
<%@page import="util.DBManager"%>
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
	request.setCharacterEncoding("UTF-8");	
	
	
	
	String id  = request.getParameter("id"); 
	String pw = request.getParameter("pw");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	
	NoticeBoardDAO Bdao = NoticeBoardDAO.getInstance();
	
	
	ArrayList<NoticeBoardDTO> bDatas = Bdao.getNoticeBoard();
	DBManager.getConnection();
	
	NoticeBoardDTO board = new NoticeBoardDTO(id, pw, title, content);
	
	Bdao.addNoitceBoard(board);
	response.sendRedirect("noticeBoardList.jsp");
	DBManager.getConnection();
	%>

</body>
</html>