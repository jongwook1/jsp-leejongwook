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
            grid-template:
                "nav header aside"0.2fr "nav main aside"1fr "nav main aside"1fr / 0.8fr 1fr 0.8fr;
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
            <form action="http://localhost:8082/webEx/_2_joinProMy.jsp">
                <div>아이디</div>
                <input type="text" name="id" style="width: 500px; height: 60px; font-size: 2em;" required>
                <div id="text0" style="display: none; color: red;">필수 정보입니다</div>
                <div><br> 비밀번호</div>
                <input type="password" name="pw1" style="width: 500px; height: 60px; font-size: 2em;" required>
                <div id="text1" style="display: none; color: red;">필수 정보입니다</div>
                <div><br> 비밀번호 재확인</div>
                <input type="password" name="pw2" style="width: 500px; height: 60px; font-size: 2em;" required>
                <div id="text2" style="display: none; color: red;">필수 정보입니다</div>
                <div><br>이름</div>
                <input type="text" name="name" style="width: 500px; height: 60px; font-size: 2em;" required>
                <div id="text3" style="display: none; color: red;">필수 정보입니다</div>
                <div><br> 생년월일</div>
                <input type="text" name="year" style="width: 160px; height: 60px; font-size: 2em;">
                <div id="text4" style="display: none; color: red;">태어난 년도 4자리를 정확하게 입력하세요</div>
                <input type="text" name="month" style="width: 160px; height: 60px; font-size: 2em;">
                <input type="text" name="day" style="width: 160px; height: 60px; font-size: 2em;">
                <div><br> 성별</div>
                <select name="" id="" style="width: 500px; height: 60px; font-size: 2em;" required>
                    <option value="o1">성별</option>
                    <option value="o1">남자</option>
                    <option value="o1">여자</option>
                    <option value="o1">선택안함</option>
                </select>
                <div id="text5" style="display: none; color: red;">필수 정보입니다</div>
                <div><br> 본인 확인 이메일</div>
                <input type="text" name="email" style="width: 500px; height: 60px; font-size: 2em;"><br>
                <p><br> 휴대전화</p>
                <div>
                    <select name="" id="" style="width: 500px; height: 60px; font-size: 2em;">
                        <option value="o1">대한민국+82</option>
                        <option value="o1">벨기에+32</option>
                        <option value="o1">프랑스+33</option>
                        <option value="o1">체코+420</option>
                    </select>
                </div>
                <br>
                <input type="text" name="phonNumber" style="width: 350px; height: 60px; font-size: 2em;" required>
                <input type="button" value="인증번호 받기" style="width: 150px; height: 60px;">
                <div><br><input type="text" style="width: 500px; height: 60px; font-size: 2em;" required></div><br>
                <div id="text6" style="display: none; color: red;">필수 정보입니다</div>
                <div id="text7" style="display: none; color: red;">인증이 필요합니다</div>
                <input type="button" value="가입하기" style="width: 500px; height: 50px">                
            </form>
        </main>
        <nav></nav>
        <aside></aside>
    </div>
    <%-- 
    <script>
    mouse();
    function mouse(){
    $(".input").mouseover(function (e) {
                $(this).css('cursor', 'pointer')
            });
    }
    </script>
    --%>
</body>

</html>