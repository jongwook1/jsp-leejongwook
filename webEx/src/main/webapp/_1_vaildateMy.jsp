<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

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
            <h1 style="text-align: center;">NAVER</h1>
        </header>

        <main>
            <form action="http://localhost:8082/webEx/_2_joinMy.jsp" style="text-align:left">
                <input type="checkbox" name="selectall">
                <span style="text-align: center;">
                    네이버 이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 정보 수신(선택)에 모두 동의합니다.
                </span><br><br>

                <input type="checkbox" name="check0">
                <span style="text-align: center;">
                    네이버 이용약관 동의(필수)
                </span><br>
                <table border="1" width="600" height="100" style="text-align: center;">
                    <tr>
                        <td></td>
                    </tr>
                </table>

                <input type="checkbox" name="check0">
                <span style="text-align: center;">
                    개인정보 수집 및 이용 동의(필수)
                </span><br>
                <table border="1" width="600" height="100" style="text-align: center;">
                    <tr>
                        <td></td>
                    </tr>
                </table>

                <input type="checkbox" name="check1">
                <span style="text-align: center;">
                    위치정보 이용약관 동의(선택)
                </span><br>
                <table border="1" width="600" height="100" style="text-align: center;">
                    <tr>
                        <td></td>
                    </tr>
                </table>

                <input type="checkbox" name="check1">
                <span style="text-align: center;">
                    프로모션 정보 수신동의(선택)
                </span><br>
                <p>네이버에서 제공하는 이벤트/혜택 등 다양한 정보를 휴대전화(네이버앱 알림 또는 문자), 이메일로 받아보실 수 있습니다. 일부 서비스(별도 회원 체계로 운영하거나 네이버 가입 이후
                    추가 가입하여 이용하는 서비스 등)의 경우, 개별 서비스에 대해 별도 수신 동의를 받을 수 있으며,
                    이때에도 수신 동의에 대해 별도로 안내하고 동의를 받습니다.</p><br>

                <div id="text" style="display: none; color: red;">네이버 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.</div>
                <input type="button" value="취소" style="width: 200px; height: 50px">
                <input type="button" value="확인" onclick="checkVal(form)" style="width: 200px; height: 50px">

            </form>

        </main>
        <nav></nav>
        <aside></aside>
    </div>

    <script>
        // function ccc(){
        //     alert("ccc나와라")
        // }       

        function checkVal(form) {
            let cnt = 0;
            for (let i = 0; i < form.check0.length; i++) {
                if (form.check0[i].checked === true)
                    cnt++;
            }
            if (cnt > 1)
                form.submit();  // 홀드하고 있었던 서밋동작을 실행
            else {
                document.getElementById("text").style.display = "block";
            }
        }

    </script>


</body>

</html>