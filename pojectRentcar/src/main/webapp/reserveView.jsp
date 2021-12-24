<%@page import="userChoice.UserChoiceDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="userChoice.UserChoiceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 내역</title>
</head>
<body>
	<div class="wrap">
		<header>
			<h1 id="board">예약내역</h1>
		</header>
		<main>
			<section class="sub-grid">
				<article id="arti1">
					<table border="solid 1px" style="border-collapse: collapse"
						width="1000px">
						<tr>
							<td>시작일자</td>
							<td>반납일자</td>

							<td>차종</td>
							<td>차 이름</td>
							<td>하루가격</td>
							<td>제 1운전자 성명</td>
							<td>총 기간</td>
							<td>최종비용</td>
							<td>예약시점</td>

						</tr>
						<!--  행 -->
						<%
                    UserChoiceDAO cdao = UserChoiceDAO.getInstance();
                    String reserveId= request.getParameter("id");
                    
                    
                    ArrayList<UserChoiceDTO> reserveInfo = cdao.getUserChoose(reserveId);    
                    for(int i=0; i<reserveInfo.size(); i++){
                    	UserChoiceDTO tempInfo = reserveInfo.get(i);
                        
                        System.out.println("board.toString() :: " + tempInfo.toString());
                     
                        
                        String temp[] = tempInfo.toString().split("/");	
                %>
						<tr>
							<td><%=temp[0] %></td>

							<td><%=temp[1] %></td>

							<td><%=temp[2] %></td>

							<td><%=temp[3] %></td>
							<td><%=temp[4] %></td>
							<td><%=temp[5] %></td>
							<td><%=temp[6] %></td>
							<td><%=temp[7] %></td>
							<td><%=temp[8] %></td>
						</tr>
						<% }
                
                %>
					</table>
				</article>
				<input type="button" id="writeboard" value="메인페이지로 돌아가기"
					onClick="location.href='main.jsp'";>
			</section>
		</main>
		<nav>
			<!-- nav -->
		</nav>
		<aside>
			<!-- aside -->
		</aside>
		<footer>
			<!-- footer -->
		</footer>
	</div>
</body>
</html>