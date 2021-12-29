<%@page import="carInfo.CarInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="shortTermRental.css">
<title>Document</title>
</head>
<body>
	<div class="wrap">
		<header>O단기렌트예약O</header>
		<main>
			<section class="sec1">
				<!-- <article id="arti1"> -->
				<form action="shortTermRentalPro.jsp">
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
						이름: <input id="input1" name="name" type="text" placeholder="이름 입력"
							style="height: 2em;">
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

					<%if(session.getAttribute("log") != null ){ %>
					<br> <input type="submit" id="choice" value="선택완료">
					<% }else{ %>
					로그인을 하시면 예약버튼이 나타납니다
					<% } %>

					<input type="hidden" name="id"
						value=<%=session.getAttribute("log") %>>
				</form>
			</section>
			<section class="sec2">
				<div id=sec2-0text>
					차량손해면책제도 안내
					<hr>
				</div>
				<div id="sec2-1text">선택안함</div>
				<div id="sec2-2text">
					SUPER 자차 <br>면책금 5만원
				</div>
				<div id="sec2-3text">
					PLUS 자차<br>면책금10만원
				</div>
				<div id="sec2-4text">
					일반 자차<br>면책금30만원
				</div>
				<div>
					<br> <br> <br> <br> <br> <br> 단, 대여
					차량 계약 시 선택한 차량손해면책제도 가입 종류에 따라 고객 부담금(면책금)이 차등 적용됩니다. <br>
					수입차의 경우 차량손해면책제도 가입 시 내륙은 일반자차(50만원 적용)만 선택 가능합니다. <br> 공항지점
					수입차의 면책금은 별도 규정이 적용됩니다.(PLUS자차 30만원, 일반자차 50만원)
				</div>
				<br> <br> <br> <br>

			</section>

			<section class="sec3">
				<br> <br>
				<div id="info">환불/취소안내</div>
				<hr>
				환불/변경 신청은 유선상으로만 가능합니다. 환불규정은 기간에 따라 환불 요금이 변동될 수 있으며, 당사 업무시간 내에 취소
				및 변경을 하셔야 적용됩니다.<br> 천재지변에 의해 취소가 될 경우에는 취소 확인할 수 있는
				확인서(결항증명서)를 보내주셔야 취소 수수료 없이 환불이 가능합니다.<br> 개인 사정으로 인해 취소 할 경우
				취소 수수료가 부과됩니다.<br> 차량 인수 24시간 이내 취소하는 경우, 예약 당일 취소 구간(수수료 없음)이
				적용되지 않습니다.<br> 예약일 ~ 인수 7일전까지 - 취소수수료없음<br> 인수 6일전 ~ 인수
				4일전까지 취소수수료 10%<br> 인수 72시간 ~ 인수 24시간전까지 취소수수료 30%<br> 인수
				24시간 이내 환불 불가<br> * 차량 인수 24시간 이내 취소하는 경우, 예약 당일 취소 구간(수수료 없음)이
				적용되지 않습니다.<br> * 당일 예약시 반드시 유의하시기 바랍니다.<br>
			</section>
			<!-- <section class="sec4">section4</section> -->
		</main>
		<aside>
			<input type="button" id="gotoMain" value="main페이지로 돌아가기"
				onClick="location.href='main.jsp'";>
		</aside>
		<footer>
			<%--<BUtton id="nextbtn">다음</BUtton> --%>

		</footer>

	</div>
</body>

<script>
//    document.querySelector('input#choice').addEventListener('click', e=>{

//        location.href='shortTermRentalPro.jsp'  ;      
        
 //   });
</script>
</html>