<%@page import="noticeBoard.NoticeBoardDTO"%>
<%@page import="noticeBoard.NoticeBoardDAO"%>
<%@page import="administrator.administratorDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="administrator.administratorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="noticeBoardList.css">
<title>공지사항</title>
</head>
<body>
	<%		
	//관리자 아이디 불러오기	
	administratorDAO bdao = administratorDAO.getInstance();
		
		ArrayList<administratorDTO> bDatas = bdao.getAdministrators();
		
		String administratorId = bDatas.get(0).getId();
		String loginId ="";
		if(session.getAttribute("log") ==null){
			
		}else{
		loginId = session.getAttribute("log").toString();} %>

	loginId:::<%=loginId %>

	<div class="wrap">
		<header>
			<h1 id="board">공지사항</h1>
		</header>
		<main>

			<section class="sub-grid">
				<article id="arti1">
					<table border="solid 1px" style="border-collapse: collapse"
						width="1000px">
						<tr>
							<td>no</td>
							<td>administartorId</td>

							<td>title</td>
							<td>content</td>
							<td>regdate</td>
						</tr>
						<!--  행 -->
						<%
                        NoticeBoardDAO dao2 = NoticeBoardDAO.getInstance();
                        
                       
                        ArrayList<NoticeBoardDTO> bDatas2 = dao2.getNoticeBoard();
                        for(int i=0; i<bDatas2.size(); i++){
                        	NoticeBoardDTO board = bDatas2.get(i);
                            
                            System.out.println("board.toString() :: " + board.toString());
                            System.out.println("bDatas.get(i).getNo() :: " + bDatas2.get(i).getNo());
                            
                            String temp[] = board.toString().split("/");	
                    %>
						<tr>
							<td><%=temp[0] %></td>

							<td><%=temp[1] %></td>

							<td><a
								href='noticeBoardView.jsp?no=<%=bDatas2.get(i).getNo() %>&id=<%=session.getAttribute("log") %>'
								a> <%=temp[3] %> <%-- send request with parameter name=value --%></td>

							<td><%=temp[4] %></td>
							<td><%=temp[5] %></td>
						</tr>
						<% }
                %>
					</table>
					<%if(administratorId.equals(loginId)){ %>
					<input type="button" value="공지사항 글쓰기"
						onClick="location.href='noticeBoardWrite.jsp'";>
					<% } %>
				</article>


				<%--  <input type="button" id="writeboard" value="이용후기 쓰기"> --%>
			</section>

		</main>
		<nav>

			<!-- nav -->
		</nav>
		<aside>
			<input type="button" id="administratorLogin" value="관리자 로그인"
				onClick="location.href='administratorLogin.jsp'";> <input
				type="button" id="gotoMain" value="main페이지로 돌아가기"
				onClick="location.href='main.jsp'";>

			<!-- aside -->
		</aside>
		<footer>
			<!-- footer -->
		</footer>
	</div>


</body>
</html>