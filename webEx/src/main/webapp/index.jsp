<%-- 주석 태그 --%>
<!-- 지시자 태그(브라우저에게 문서의 정보를 전달) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	hello world
	<%
	// JSP : Java Server Page
	// ㄴ html 문서 안에 java 문장(코드)을 작성하는것
	
	// 1)지사자 태그<%@ % >
	// 2) 주석 태그 <%-- --% >
	// 3) 스크립틀릿 <% % >
	// 4)표현식 <%= % >
	
	// 스크립틀릿(scriptlet) 태그 안에 자바 문장을 작성할 수 있다
	
	%>
	
	<%
	// 구구단 2~9단까지 웹 페이지에 출력
	for(int i=2; i<10; i++){ %>
		<h1>[<%=i %>단]</h1>
		
		<%for(int j=1; j<10; j++){%>
			<h1><%=i %> x <%=j %> = <%=i*j %></h1>
			
		<%} 
	}
	%>
</body>
</html>