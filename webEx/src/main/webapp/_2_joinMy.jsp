<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script> --%>
<style>
* {
	margin: 0;
	padding: 0;
}

.warp {
	display: grid;
	height: 150vh;
	/* width:vh */
	grid-template: "nav header aside" 0.2fr "nav main aside" 1fr
		"nav main aside" 1fr/0.8fr 1fr 0.8fr;
}

header {
	grid-area: header;
	font-size: 2em;
	/* background-color: rosybrown; */
}

main {
	grid-area: main;
	/* background-color: royalblue; */
}

nav {
	grid-area: nav;
	/* background-color: slateblue; */
}

aside {
	grid-area: aside;
	/* background-color: slategray; */
}
</style>

<title>Document</title>
</head>

<body>
	<div class="warp">
		<header>
			<h1 style="text-align: center; margin-top: 5%;">NAVER</h1>
		</header>
		<main>
			<form method="POST" name='info'
				action="http://localhost:8082/webEx/_2_joinProMy.jsp">
				<div>아이디</div>
				<input type="text" name="id"
					style="width: 500px; height: 60px; font-size: 2em;" required>
				<%-- <div id="text0" style="display: none; color: red;">필수 정보입니다</div>--%>
				<div>
					<br> 비밀번호
				</div>
				<input type="password" name="pw1"
					style="width: 500px; height: 60px; font-size: 2em;" required>
				<%--<div id="text1" style="display: none; color: red;">필수 정보입니다</div>--%>
				<div>
					<br> 비밀번호 재확인
				</div>
				<input type="password" name="pw2"
					style="width: 500px; height: 60px; font-size: 2em;" required>
				<%--<div id="text2" style="display: none; color: red;">필수 정보입니다</div>--%>
				<div>
					<br>이름
				</div>
				<input type="text" name="name"
					style="width: 500px; height: 60px; font-size: 2em;" required>
				<%--<div id="text3" style="display: none; color: red;">필수 정보입니다</div>--%>
				<div>
					<br> 생년월일
				</div>
				<input type="text" name="year"
					style="width: 160px; height: 60px; font-size: 2em;">
				<%--<div id="text4" style="display: none; color: red;">태어난 년도 4자리를
					정확하게 입력하세요</div>--%>
				<input type="text" name="month"
					style="width: 160px; height: 60px; font-size: 2em;"> <input
					type="text" name="day"
					style="width: 160px; height: 60px; font-size: 2em;">
				<div>
					<br> 성별
				</div>
				<select name="s" id=""
					style="width: 500px; height: 60px; font-size: 2em;" required>
					<option value="">성별</option>
					<option value="남자">남자</option>
					<option value="여자">여자</option>
					<option value="">선택안함</option>
				</select>
				<%--<div id="text5" style="display: none; color: red;">필수 정보입니다</div>--%>
				<div>
					<br> 본인 확인 이메일
				</div>
				<input type="text" name="email"
					style="width: 500px; height: 60px; font-size: 2em;"><br>
				<p>
					<br> 휴대전화
				</p>
				<div>
					<select name="country" id=""
						style="width: 500px; height: 60px; font-size: 2em;">
						<option value="oo1">대한민국+82</option>
						<option value="oo2">벨기에+32</option>
						<option value="oo3">프랑스+33</option>
						<option value="oo4">체코+420</option>
					</select>
				</div>
				<br> <input type="text" name="phonNumber"
					style="width: 350px; height: 60px; font-size: 2em;" required>
				<input type="button" value="인증번호 받기"
					style="width: 150px; height: 60px;">
				<div>
					<br>
					<input type="text"
						style="width: 500px; height: 60px; font-size: 2em;" required>
				</div>
				<br>
				<%--<div id="text6" style="display: none; color: red;">필수 정보입니다</div>--%>
				<%--<div id="text7" style="display: none; color: red;">인증이 필요합니다</div>--%>
				<input type="button" value="가입하기" onclick="checkVal(form)"
					style="width: 500px; height: 50px">
			</form>
		</main>
		<nav></nav>
		<aside></aside>
	</div>


	<script>
    function checkVal(form){
        if(!checkId(form.id.value)){
           return false;
        }
        else if(!checkPw(form)){
            return false;
        }            
        else if(!checkName(form)){
            return false;
        }
        else if(!checkDate(form)){
            return false;
        }
        else if(!checkMail(form)){
            return false;
        }
        else if(!checkPhonnumber(form)){
            return false;
        }
        
        form.submit();
    }

        //공백체크함수
    function checknull(value){
        if(value==""){
            // alert("공백입니다")
            return false;
        }
        return true;
    }

        //아아디유효성검사
    function checkId(inputValue){
        if(!checknull(inputValue)){
            alert("아이디가 공백입니다")
            return false;
        }
        let valTest = /^[a-zA-Z0-9]{4,12}$/
        // https://developer.mozilla.org/ko/docs/Web/JavaScript/Guide/Regular_Expressions 정규식참고
        // alert(valTest);
        // alert(inputValue);
        // → / : 자바스크립트의 정규표현식의 처음과 끝을 의미한다.
        // → [ ] : 문자셋이다. 예를 들면 [a-z]라고 적을경우 정규표현식에 만족해야하는 값들은 반드시 a~z사이의 값만 넣을 수 있다.
        // → ^ : 문장의 처음을 뜻한다.
        // → $ : 문장의 마지막을 뜻한다.
        // → { } : 문자열 길이를 뜻한다. 예를 들어 {4,12}일 경우 최소 길이 4, 최대 길이 12이다.


        if(!valTest.test(inputValue)){
            alert("아이디는 영문or대소문자or숫자4~12자리로 입력")
            
           
            const form = document.info;
                form.id.value = "";      //input태그 name=id 인곳 공백만듬
                form.id.focus();        //포커스잡아줌
            return false;
        }
        return true;
    }

        //비번 유효성검사
    function checkPw(form){
        // alert("여들어오냐")
        if(!checknull(form.pw1.value)){
            alert("비번 공백입니다")
            return false;
        }
        if(!checknull(form.pw2.value)){
            alert("재확인비번 공백입니다")
            return false;
        }
        let valTest = /^[a-zA-Z0-9]{4,12}$/

        if(!valTest.test(form.pw2.value)){
            alert("비번은 영문or대소문자or숫자4~12자리로 입력");               
           
            const form = document.info;
                form.id.value = "";      //input태그 name=id 인곳 공백만듬
                form.id.focus();        //포커스잡아줌
            return false;
        }

        if(form.pw2.value != form.pw1.value){
            alert("처음입력한 비밀번호와 맞지않습니다");
            form.pw1.value = "";
            form.pw2.value = "";
            form.pw2.focus();
            return false;
        }

        if(form.pw1.value == form.id.value){
            alert("아디와 비번이 같으면 안됩니다");
            return false;
        }
        return true;            
    }

        //이름 검사
    function checkName(form){
        // alert("여들어오냐")
        if(!checknull(form.name.value)){
            alert("이름이 공백입니다")
            return false;
        }

        let valTest = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|$]/;       //한글영어만 입력받기
        if(!valTest.test(form.name.value)){
            alert("이름은 한글or영문or대소문자로 입력");               
           
            const form = document.info;
                form.name.value = "";      //input태그 name이 name 인곳 공백만듬
                form.name.focus();        //포커스잡아줌
            return false;
        }
        // alert("이름검사끝")
        return true;
    }
        
 		// 날짜검사
    function checkDate(form){
        if(!checknull(form.year.value)){
            alert("년도가 공백입니다")
            return false;
        }
        if(!checknull(form.month.value)){
            alert("월이 공백입니다")
            return false;
        }
        if(!checknull(form.day.value)){
            alert("날이 공백입니다")
            return false;
        }

        return true;
    }    

        //메일 검사
    function checkMail(form){
        if(!checknull(form.email.value)){
            alert("메일이 공백입니다")
            return false;
        }

        let valTest = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

        if(!valTest.test(form.email.value)){
            alert("이메일주소를 확인해주세요");                     
            const form = document.info;
                form.email.value = "";      //input태그 name이 email 인곳 공백만듬
                form.email.focus();        //포커스잡아줌
            return false;
        }

        return true;
    }

        //전화번호검사
    function checkPhonnumber(form){
        if(!checknull(form.phonNumber.value)){
            alert("전화번호가 공백입니다")
            return false;
        }

        let valTest = /^\d{3}-\d{3,4}-\d{4}$/;

        if(!valTest.test(form.phonNumber.value)){
            alert("전화번호를 확인해주세요 양식)000-0000-0000");                     
            const form = document.info;
                form.phonNumber.value = "";      //input태그 name이 email 인곳 공백만듬
                form.phonNumber.focus();        //포커스잡아줌
            return false;
        }

        return true;
    }
    </script>
</body>

</html>