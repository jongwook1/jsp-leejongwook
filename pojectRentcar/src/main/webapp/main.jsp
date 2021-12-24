<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" type="text/css" href="main.css">

<title>rentercar</title>
</head>
<body>


	<div class="wrap">
		<header>
			<!-- style="width: 100%; height: auto;" -->
			<!-- <img class="img1" src="https://www.happyrent.co.kr/FileData/banner/2020-11-24/202011241525105fbca746039dc.jpg" width="800px" height="140px"> -->
			<h1 id="title1">뚜벅이도 걷지말고 이용하자 @@렌트</h1>

		</header>
		<nav>
			<button id="btnShort1">단기렌트</button>
			<button id="btnShort2">장기렌트</button>
			<button id="btnShort3">게시판</button>
			<button id="btnShort4">마이페이지</button>

		</nav>
		<main>
			<section class="sec1">
				<article id="arti1">
					BEST <img
						src="https://www.happyrent.co.kr/FileData/banner/2021-05-14/20210514142145609e08e956b46.png">
					<img
						src="https://www.happyrent.co.kr/FileData/banner/2021-10-21/202110211152106170d5da772dd.png">
					<img
						src="https://www.happyrent.co.kr/FileData/banner/2021-01-28/202101281448446012503c04d93.png">
					<img
						src="https://www.happyrent.co.kr/FileData/banner/2020-11-04/202011041323275fa22cbfcc1e2.png">

				</article>
				<article id="arti2">
					NEW <img
						src="https://www.happyrent.co.kr/FileData/banner/2021-05-14/20210514145318609e104e7ce50.png">
					<img
						src="https://www.happyrent.co.kr/FileData/banner/2021-10-21/202110211152106170d5da53ff1.png">
					<img
						src="https://www.happyrent.co.kr/FileData/banner/2020-11-04/202011041323275fa22cbfce6a2.png">
					<img
						src="https://www.happyrent.co.kr/FileData/banner/2020-11-04/202011041323275fa22cbfccd99.png">
				</article>
			</section>
			<section class="sec2">
				<img
					src="https://www.happyrent.co.kr/FileData/pdtimg/2021-02-17/20210217162719602cc5573ddf4.jpg">
				<img
					src="https://www.happyrent.co.kr/FileData/pdtimg/2021-11-13/20211113132846618f3efea1d79.jpg">
				<img
					src="https://www.happyrent.co.kr/FileData/pdtimg/2020-05-18/202005181559365ec23258ced3e.jpg">
				<br>
				<div id="sec2-1text">12월 특가차종</div>
				<br>

				<div id="sec2-2text">대여절차</div>
				<div id="sec2-3text">각지점방문</div>
				<div id="sec2-4text">약관설명 및 계약서 작성</div>
				<div id="sec2-5text">차량인수</div>
				<div id="sec2-6text">신나는여행</div>


			</section>
			<section class="sec3">
				<article id=sec3text>정비매장</article>
				<div id="sec3textwrap">
					<p id="sec3-1text">21C
					<ul>
						<li>서울특별시 동작구 시흥대로 616(신대방동)</li>
						<li>전화: 02-831-0811</li>
						<li></li>
					</ul>
					</p>

					<p id="sec3-2text">AK원주
					<ul>
						<li>강원도 원주시 봉화로 1 AK프라자원주점지</li>
						<li>전화: 033-732-5051</li>
						<li></li>
					</ul>
					</p>

					<p id="sec3-3text">OK순천점
					<ul>
						<li>전남 순천시 가곡동169</li>
						<li>전화: 061-751-7811</li>
						<li></li>
					</ul>
					</p>

					<p id="sec3-4text">Q엔느강동
					<ul>
						<li>서울특별시 강동구 양재대로 1509 (길동)</li>
						<li>전화: 02-478-5189</li>
						<li></li>
					</ul>
					</p>
				</div>

			</section>
			<section class="sec4"></section>

		</main>
		<aside></aside>
		<footer>
			<p></p>
			<br>
			<br>
			<p>크라운네트윅스 ㅣ 대표이사: 홍길동 ㅣ 상호명:@@렌터가(주)ㅣ 성동구 자동차시장9길 123-456 ㅣ
				사업자번호:113-12-1234</p>
			<p>통신판매신고번호 : 제 2000-서울성동-1234호 ㅣ TEL : 1234-1234 ㅣ FAX
				:064-777-7777 ㅣ abc@abcdef.co.kr</p>
		</footer>

	</div>

	<script>
    const btnShort1 = document.querySelector
    ('button#btnShort1');

    btnShort1.addEventListener('click', e=>{
//        location.href = "shortTermRental.jsp";
        location.href = "shortTermRental.jsp";
    });

    const btnShort2 = document.querySelector
    ('button#btnShort2');

    btnShort2.addEventListener('click', e=>{
        location.href = "longTermRental.jsp";
    });

    const btnShort3 = document.querySelector
    ('button#btnShort3');

    btnShort3.addEventListener('click', e=>{
        location.href = "boardList.jsp";
    });

    const btnShort4 = document.querySelector
    ('button#btnShort4');

    btnShort4.addEventListener('click', e=>{
        location.href = "myPage.jsp";
    });

    </script>
</body>
</html>