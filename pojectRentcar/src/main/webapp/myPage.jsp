<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="myPage.css">
<title>Document</title>
</head>
<body>

	<div class="wrap">
		<header>
			<h1>마이페이지</h1>
		</header>
		<main>
			<section class="sec1">
				<article id="arti1">
					회원가입(id#pw#name)<br> <input type="button" id="join"
						value="join">
				</article>
				<article id="arti2">
					로그인(id#pw)<br> <input type="button" id="login" value="login">
					<!-- <div id ="checkFalse" style="display: none;">아이디와 비번을 확인해주세요</div> -->
					<!-- <div id="out" style="display: none;">로그아웃되셨습니다</div>
                    <span id="logcheck" style="display: none;">로그아웃상태입니다</span><br> -->
				</article>

			</section>
			<section class="sec2" style="text-align: center;">
				<form action="reserveView.jsp">
					<%if(session.getAttribute("log") != null ){ %>
					<br> <input type="submit" id="reserve"
						style="margin-top: 30px;" value="예약내역 확인하기"> <input
						type="hidden" name="id" value=<%=session.getAttribute("log") %>>
					<% }else{ %>
					로그인후 예약내역을 확인하실수있습니다
					<% } %>

					<%--<input type="submit" id="reserveBtn" value="예약내역 확인하기" style="margin-left: 400px; margin-top: 50px;"  > --%>

				</form>


			</section>
			<section class="sec3"></section>
			<section class="sec4">
				<%if(session.getAttribute("log") != null){%>
				<button onclick="location.href='logOut.jsp'">로그아웃</button>
				<button onclick="location.href='checkPass.jsp'">회원탈퇴</button>
				<% } %>

				<input type="button" id="gotoMain" value="main페이지로 돌아가기"
					onClick="location.href='main.jsp'";>
			</section>

		</main>
		<nav></nav>
		<aside></aside>
		<footer></footer>

	</div>
</body>

<script>
    document.querySelector('input#join').addEventListener('click', e=>{
        <%--
    	const id = document.querySelector('.id').value;
        const url = `_3_join.jsp?id=${id}`;
        location.href = url;       
        --%>
        location.href='join.jsp'        
        
    });
    
    document.querySelector('input#login').addEventListener('click', e=>{

        location.href=`login.jsp?id=${id}`;
    });
    
    
</script>
</html>