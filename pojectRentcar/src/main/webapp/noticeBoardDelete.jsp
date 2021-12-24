<%@page import="noticeBoard.NoticeBoardDTO"%>
<%@page import="noticeBoard.NoticeBoardDAO"%>
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
	
	int no=Integer.parseInt(request.getParameter("no"));
	
	NoticeBoardDAO dao = NoticeBoardDAO.getInstance();
	
	NoticeBoardDTO board = new NoticeBoardDTO(no);
	
	dao.deleteNoticeBoard(board);	
	response.sendRedirect("noticeBoardList.jsp");
	
	
%>
</body>
</html>