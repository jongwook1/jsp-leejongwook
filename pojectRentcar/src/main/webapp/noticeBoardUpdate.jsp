<%@page import="noticeBoard.NoticeBoardDTO"%>
<%@page import="noticeBoard.NoticeBoardDAO"%>
<%@page import="java.util.ArrayList"%>
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
		String strNo = request.getParameter("no");
		
		NoticeBoardDAO bdao = NoticeBoardDAO.getInstance();
		// 단건 조회
		ArrayList<NoticeBoardDTO> bDatas = bdao.getBoardOne(strNo);
	%>
	<form method="post" action="noticeBoardUpdatePro.jsp">
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