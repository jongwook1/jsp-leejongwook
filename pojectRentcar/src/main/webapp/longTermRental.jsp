<%@page import="carInfo.CarInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="longTermRental.css">

<style>
article {
	float: left;
}
</style>
<title>Document</title>
</head>
<body>

	<div class="wrap">
		<header>
			<h1 id="headerTitle">장기 렌터카 안내</h1>
			<input type="button" id="gotoMain" value="main페이지로 돌아가기"
				onClick="location.href='main.jsp'";>
		</header>
		<main>
			<section class="sub-wrap">
				<article id="arti1">
					<div id=art1-1>개인장기렌터카란?</div>
					<hr>
					<p id="atri1-2">@@렌터카가 만든 개인 장기렌터카로 차량을 직접 구매하지 않고 3개월/6개월/9개월
						동안 장기적으로 렌트하여 사용하는 새로운 차량 운용 방법으로 보험, 차량관리, 사고처리, 차량매각 등 모든
						차량관리업무를 @@렌터카에서 전담하여 편리하고 경제적으로 차량을 이용할 수 있는 서비스 입니다.</p>
				</article>
				<article id="arti2">
					<div id="arti2-1">
						선택가능상품
						<hr>
						<article>
							<img
								src="http://file.carisyou.com/upload/2020/12/08/FILE_202012081054411300.png"
								width="270" height="250" style="display: block;">GV70
						</article>
						<article>
							<img
								src="http://file.carisyou.com/upload/2020/02/17/FILE_202002170927306760.png"
								width="270" height="250" style="display: block;">쏘렌토
						</article>
						<article>
							<img
								src="http://file.carisyou.com/upload/2020/06/03/FILE_202006030536325550.png"
								width="270" height="250" style="display: block;">싼타페
						</article>
						<article>
							<img
								src="http://file.carisyou.com/upload/2019/12/23/FILE_201912231047361770.png"
								width="270" height="250" style="display: block;">K5
						</article>

						<article>
							<img
								src="http://file.carisyou.com/upload/2020/09/16/FILE_202009160449139050.png"
								width="270" height="250" style="display: block;">투싼
						</article>
						<article>
							<img
								src="http://file.carisyou.com/upload/2021/07/28/FILE_202107280514485110.png"
								width="270" height="250" style="display: block;">스포티지
						</article>
						<article>
							<img
								src="http://file.carisyou.com/upload/2021/02/17/FILE_202102170940471340.png"
								width="270" height="250" style="display: block;">K8
						</article>
						<article>
							<img
								src="http://file.carisyou.com/upload/2021/09/15/FILE_202109150147170690.png"
								width="270" height="250" style="display: block;">캐스퍼
						</article>

						<article>
							<img
								src="http://file.carisyou.com/upload/2020/04/08/FILE_202004080449504290.png"
								width="270" height="250" style="display: block;">아반떼
						</article>
						<article>
							<img
								src="http://file.carisyou.com/upload/2019/11/27/FILE_201911271034476480.jpg"
								width="270" height="250" style="display: block;">그랜저
						</article>
						<article>
							<img
								src="http://file.carisyou.com/upload/2020/03/30/FILE_202003300542061790.png"
								width="270" height="250" style="display: block;">G80
						</article>
						<article>
							<img
								src="http://file.carisyou.com/upload/2019/07/29/FILE_201907290940292990.png"
								width="270" height="250" style="display: block;">셀토스
						</article>

					</div>
					<br>

				</article>
				<article id="arti3">

					<form action="longTermRentalPro.jsp">
						<br>
						<div id=arti1Title>
							기간/지점 선택
							<hr>
						</div>
						<div id="choiceDate">
							기간선택(출발일)
							<div>
								<input type="date" name="startDate">
							</div>
						</div>
						<div id="choiceDate">
							기간선택(반납일)
							<div>
								<input type="date" name="endDate">
							</div>
						</div>
						<div id="choiceSopt">
							지점선택<br> <select name="choiceSopt">
								<option value="부천">부천</option>
								<option value="인천">인천</option>
								<option value="서울">서울</option>
								<option value="천안">천안</option>
								<option value="수원">수원</option>
							</select>
						</div>
						<br> <br>
						<div id="choiceCarKinds">
							차량 선택
							<hr>
						</div>
							<% CarInfoDAO dao = CarInfoDAO.getInstance();%>
						<select name="carChoice" id="" style="height: 4em">
							<%for(int i=0; i<dao.getCarInfos().size(); i++){ %>
						<option value=<%= dao.getCarInfos().get(i).getCarClass() + "/" + dao.getCarInfos().get(i).getCarName() + "/" + dao.getCarInfos().get(i).getCarPrice() %>><%=dao.getCarInfos().get(i).getCarClass() + "/" + dao.getCarInfos().get(i).getCarName() + "/" + dao.getCarInfos().get(i).getCarPrice() %></option>
						<%} %>
						</select><br> <br>
						<div id=sec2-5text>계약자 정보입력(제1운전자)</div>
						<hr>
						<p id="name">
							이름: <input id="input1" name="name" type="text"
								placeholder="이름 입력" style="height: 2em;">
						</p>
						<p id="birthday">
							생년월일: <input id="input2" name="birth" type="text"
								placeholder="생년월일 입력" style="height: 2em;">
						</p>
						<p id="phonNumber">
							휴대폰번호 <input id="input3" name="phoneN" type="text"
								placeholder="휴대폰번호 입력" style="height: 2em;">
						</p>
						<p id="drLicense">
							운전면허 발급일 입력 <input id="input4" name="drLicense" type="text"
								placeholder="운전면허 발급일 입력" style="height: 2em;">
						</p>
						session.getAttribute::<%=session.getAttribute("log")%>

						<%
						if (session.getAttribute("log") != null) {
						%>
						<br> <input type="submit" id="choice" value="선택완료">
						<%
						} else {
						%>
						로그인을 하시면 예약버튼이 나타납니다
						<%
						}
						%>

						<input type="hidden" name="id"
							value=<%=session.getAttribute("log")%>>
					</form>


				</article>
				<article id="arti4">
					<div>구비서류</div>
					<hr>
					<div>
						<table border="2" width="700" height="150"
							style="text-align: center;">
							<tr>
								<td>1</td>
								<td>2</td>
								<td>3</td>
							</tr>
							<tr>
								<td>1</td>
								<td>2</td>
								<td>3</td>
							</tr>
							<tr>
								<td>1</td>
								<td>2</td>
								<td>3</td>
							</tr>
						</table>
					</div>
				</article>
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