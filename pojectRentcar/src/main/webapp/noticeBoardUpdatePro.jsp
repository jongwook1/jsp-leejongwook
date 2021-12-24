<%@page import="noticeBoard.NoticeBoardDTO"%>
<%@page import="noticeBoard.NoticeBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeBoardUpdatePro</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	
	int no = Integer.parseInt(request.getParameter("no"));
	String content = request.getParameter("content");
	

	NoticeBoardDAO dao = NoticeBoardDAO.getInstance();

	NoticeBoardDTO board = new NoticeBoardDTO(no, content);
		
	dao.updateNoticeBoard(board);
	response.sendRedirect("noticeBoardList.jsp");	
	
	
	
	%>

</body>
</html>