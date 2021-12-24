<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>98</title>
</head>
<body>

	<%--BoardDTO board = Bdao.getBoard().get(Integer.parseInt(request.getParameter("no"))); --%>
	<%
/* BoardDAO Bdao = BoardDAO.getInstance();
									 
int no=Integer.parseInt(request.getParameter("no"));

BoardDTO board = Bdao.getBoard().get(no); */
	
		String strNo = request.getParameter("no");
		
		BoardDAO bdao = BoardDAO.getInstance();
		// 단건 조회
		ArrayList<BoardDTO> bDatas = bdao.getBoardOne(strNo);
	%>

	<form method="post" action="boardUpdatePro.jsp">
		<table border="solid 1px" style="border-collapse: collapse">
			<tr>
				<td>작성시간</td>
			</tr>
			<tr>
				<td><%= bDatas.get(0).getRegDate() %></td>
			</tr>
			<tr>
				<td>글제목</td>
			</tr>
			<tr>
				<td><%= bDatas.get(0).getTitle() %></td>
			</tr>
			<tr>
				<th>작성한 게시글의 내용</th>
			</tr>
			<tr>
				<td><textarea name="content" id="" cols="30" rows="10"><%= bDatas.get(0).getContent()%></textarea>
				</td>
			</tr>

			<table>

				<input type="hidden" name="no" value="<%=bDatas.get(0).getNo() %>">

				<input type="submit" value="수정완료">

				<%--받은파라미터no의 값<%=bDatas.get(0).getNo()--%>
				</form>
</body>
</html>