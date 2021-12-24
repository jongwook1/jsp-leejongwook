<%@page import="user.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="join.css">
<title>Join</title>
</head>
<body>
	<%
	UserDAO dao = UserDAO.getInstance();
	ArrayList<UserDTO> datas = dao.getUsers();
	
	for(int i=0; i<datas.size(); i++){
	System.out.println("JOIN페이지에서 출력한 users::"+"id:"+datas.get(i).getId()+" "+"pw:"+datas.get(i).getPw()+" "+"regD:"+datas.get(i).getLegDate());
	}
	%>
	<div class="warp">
		<header>
			<h1 style="text-align: center; margin-top: 5%;">회원가입</h1>
		</header>
		<main>
			<form name='info' action="joinPro.jsp">
				<div style="text-align: center;">아아디</div>
				<input type="text" name="id"
					style="display: block; margin: 0 auto; width: 500px; height: 60px; font-size: 2em;">
				<div style="text-align: center;">
					<br> 비밀번호
				</div>
				<input type="text" name="pw1"
					style="display: block; margin: 0 auto; width: 500px; height: 60px; font-size: 2em;">
				<div style="text-align: center;">
					<br> 비밀번호 재확인
				</div>
				<input type="text" name="pw2"
					style="display: block; margin: 0 auto; width: 500px; height: 60px;">
				<div style="text-align: center;">
					<br>이름
				</div>
				<input type="text" name="name"
					style="display: block; margin: 0 auto; width: 500px; height: 60px;">
				<div style="text-align: center;">
					<br> 생년월일
				</div>
				<input type="text" name="birth"
					style="display: block; margin: 0 auto; width: 500px; height: 60px;">
				<!-- <input type="text" name="year" style=" width: 170px; height: 60px;">
                <input type="text" name="month" style=" width: 170px; height: 60px;">
                <input type="text" name="day" style=" width: 170px; height: 60px;"> -->
				<div style="text-align: center;">
					<br> 성별
				</div>
				<select name="sex" id=""
					style="display: block; margin: 0 auto; width: 500px; height: 60px;">
					<option value="o1">성별</option>
					<option value="man">남자</option>
					<option value="woman">여자</option>
					<option value="o1">선택안함</option>
				</select>
				<div style="text-align: center;">
					<br> 본인 확인 이메일
				</div>
				<input type="text" name="email"
					style="display: block; margin: 0 auto; width: 500px; height: 60px; font-size: 1em;"><br>
				<p style="text-align: center;">
					<br> 휴대전화
				</p>
				<%-- <div style="text-align: center;">
                    <select name="" id="" style="display: block; margin: 0 auto; width: 500px; height: 60px;">
                        <option value="o1">대한민국+82</option>
                        <option value="o1">벨기에+32</option>
                        <option value="o1">프랑스+33</option>
                        <option value="o1">체코+420</option>
                    </select>
                </div>--%>
				<br> <input type="text" name="phonNumber"
					style="display: block; margin: 0 auto; width: 500px; height: 60px;">
				<%-- <input type="button" value="인증번호 받기" style="display: block; margin: 0 auto; width: 150px; height: 60px"> 
                <div><br><input type="text" style="display: block; margin: 0 auto; width: 500px; height: 60px;"></div><br>--%>
				<br> <input type="button" value="가입하기" onclick="checkVal(form)"
					style="display: block; margin: 0 auto; width: 300px; height: 50px">
			</form>
		</main>
		<nav></nav>
		<aside></aside>
	</div>
	<script>
    function checkVal(form) {
    	console.log("checkVal")
    	if (!checkId(form)) {
    		return false;
    	}
    	else if (!checkPw(form)) {
    		return false;
    	}
    	else if (!checkName(form)) {
    		return false;
    	}
    	else if (!checkDate(form)) {
    		return false;
    	}
    	else if (!checkMail(form)) {
    		return false;
    	}
    	else if (!checkPhonnumber(form)) {
    		return false;
    	}
    	form.submit();
    }

    //공백체크함수
    function checknull(value) {
    	if (value == "") {
    		return false;
    	}
    	return true;
    }

    //아이디 유효성검사
    function checkId(inputValue) {
    	if (!checknull(inputValue.id.value)) {
    		alert("아이디가 공백입니다")
    		const form = document.info;
    		form.id.focus();
    		return false;
    	}
    	let valTest = /^[a-zA-Z0-9]{4,12}$/

    	if (!valTest.test(inputValue.id.value)) {
    		alert("아이디는 (영문or대소문자or숫자)4~12자리로 입력")


    		const form = document.info;
    		form.id.value = "";      //input태그 name=id 인곳 공백만듬
    		form.id.focus();        //포커스잡아줌
    		return false;
    	}
    	return true;

    }

    //비밀번호 유효성검사	
    function checkPw(form) {
    	// alert("checkPw")
    	if (!checknull(form.pw1.value)) {
    		alert("비밀번호가 공백입니다");
    		form.pw1.focus();
    		return false;
    	}
    	let valTest = /^[a-zA-Z0-9]{4,12}$/

    	if (!valTest.test(form.pw1.value)) {
    		alert("비번은 영문(대문자 OR 소문자 OR 숫자)4~12자리로 입력");

    		const form = document.info;
    		form.pw1.value = "";      //input태그 name=id 인곳 공백만듬
    		form.pw1.focus();        //포커스잡아줌
    		return false;
    	}

    	if (form.pw1.value == form.id.value) {
    		alert("아디와 비번이 같으면 안됩니다");
    		form.pw1.value = "";
    		form.pw1.focus();
    		return false;
    	}

    	if (!checknull(form.pw2.value)) {
    		alert("재확인비밀번호가 공백입니다")
    		form.pw2.focus();
    		return false;
    	}

    	if (form.pw2.value != form.pw1.value) {
    		alert("처음입력한 비밀번호와 맞지않습니다");
    		form.pw2.value = "";
    		form.pw2.focus();
    		return false;
    	}

    	return true;
    }

    //이름 검사
    function checkName(form) {
    	// alert("여들어오냐")
    	if (!checknull(form.name.value)) {
    		alert("이름이 공백입니다")
    		const form = document.info;
    		form.name.value = "";     
    		form.name.focus();       
    		return false;
    	}

    	let valTest = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|$]/;       //한글영어만 입력받기
    	if (!valTest.test(form.name.value)) {
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
    function checkDate(form) {
    	if (!checknull(form.birth.value)) {
    		alert("생년월일이 공백입니다")
    		const form = document.info;
    		form.birth.value = "";      //input태그 name이 name 인곳 공백만듬
    		form.birth.focus(); 
    		return false;
    	}
    	return true;
    }

    //메일 검사
    function checkMail(form) {
    	if (!checknull(form.email.value)) {
    		alert("메일이 공백입니다")
    		const form = document.info;
    		form.email.value = "";      //input태그 name이 name 인곳 공백만듬
    		form.email.focus(); 
    		return false;
    	}

    	let valTest = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

    	if (!valTest.test(form.email.value)) {
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

                return true;
            }
    
    </script>





</body>
</html>