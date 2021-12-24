<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="boardList.css">
<title>Document</title>
</head>
<body>
	<div class="wrap">
		<header>
			<h1 id="board">이용후기 게시판</h1>
		</header>
		<main>

			<section class="sub-grid">
				<article id="arti1">
					<table border="solid 1px" style="border-collapse: collapse"
						width="1000px">
						<tr>
							<td>no</td>
							<td>id</td>

							<td>title</td>
							<td>content</td>
							<td>regdate</td>
						</tr>
						<!--  행 -->
						<%
                    BoardDAO bdao = BoardDAO.getInstance();
                     
                    
                    ArrayList<BoardDTO> bDatas = bdao.getBoard();
                    for(int i=0; i<bDatas.size(); i++){
                        BoardDTO board = bDatas.get(i);
                        
                        System.out.println("board.toString() :: " + board.toString());
                        System.out.println("bDatas.get(i).getNo() :: " + bDatas.get(i).getNo());
                        
                        String temp[] = board.toString().split("/");	
                %>
						<tr>
							<td><%=temp[0] %></td>

							<td><%=temp[1] %></td>

							<td><a
								href='boardView.jsp?no=<%=bDatas.get(i).getNo() %>&id=<%=session.getAttribute("log") %>'
								a> <%=temp[3] %> <%-- send request with parameter name=value --%></td>

							<td><%=temp[4] %></td>
							<td><%=temp[5] %></td>
						</tr>
						<% }
                
                %>
					</table>
				</article>
				<input type="button" id="writeboard" value="이용후기 쓰기">
			</section>
		</main>
		<nav>
			<p>공지사항</p>
			<input type="button" id="noticeboard" value="공지사항"
				onClick="location.href='noticeBoardList.jsp'";>

			<!-- nav -->
		</nav>
		<aside>
			<input type="button" id="gotoMain" value="main페이지로 돌아가기"
				onClick="location.href='main.jsp'";>
			<!-- aside -->
		</aside>
		<footer>
			<!-- footer -->
		</footer>
	</div>
</body>
<script>
        document.querySelector('input#writeboard').addEventListener('click', e=>{

        location.href='boardWrite.jsp';
    	});
        
        //document.querySelector('input#viewboard').addEventListener('click', e=>{

        //location.href=`_97_boardViewMy.jsp`;
        //});
  </script>
</html>