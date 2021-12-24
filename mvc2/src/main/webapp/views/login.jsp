<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        span{
            white-space: pre;
        }
    </style>

    <title>Document</title>
</head>
<body>
<!-- url : login -> LoginPro.java(servlet)  --> 
    <h1>login</h1>
    <form method="post" action="../LoginPro">
        <span>id:&#9;</span><input type="text" name="id"><br><br>
        <span>pw:&#9;</span><input type="password" name="pw"><br><br>
        <input type="submit" value="login">
    </form>
</body>
</html>