<%@page import="java.util.Random"%>
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
    <title>login</title>
</head>
<body>
    <h1>구구단</h1>
    <form method="GET" action="gugudanPro.jsp">
        <table border="1">
            <tr>
                <td>문제</td>
                <td>답입력</td>               
            </tr>
            
            <%
            Random random = new Random();
            for(int i=0; i<5; i++){
            	int x = random.nextInt(8)+2;
            	int y = random.nextInt(9)+1;
            	String name = String.format("a%d", i);
            	String dapName = String.format("d%d", i);  
            
            %>
            <tr>
                <td><%=x %> X <%=y %> =</td>
                <td>
                    <input type="text" name="<%=name %>" >
                    <input type="hidden" name="<%=dapName %>" value=<%=x*y %> >
                </td>                
            </tr>
			
			<%
            }
			%>
			
        </table><br>

        <input type="submit" name="" id="">
    </form>
    
</body>
</html>