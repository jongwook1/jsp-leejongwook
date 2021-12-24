<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardViewMy</title>
</head>
<body>

	<%
		String strNo = request.getParameter("no");
		
		BoardDAO bdao = BoardDAO.getInstance();
		// 단건 조회
		ArrayList<BoardDTO> bDatas = bdao.getBoardOne(strNo);
		String boardPassword = bDatas.get(0).getPw();
		String boardId = bDatas.get(0).getId();
		String loginId = request.getParameter("id");
		
	
	%>
	boardId::<%=boardId %>
	loginId::<%=loginId %>
	<table border="solid 1px" style="border-collapse: collapse" width="400">

		<tr>
			<td>작성시간</td>
			<%-- <td><%=bDatas[].getRegDate() %></td> --%>
			<td><%= bDatas.get(0).getRegDate() %></td>
		</tr>
		<tr>
			<td>글제목</td>
			<th><%=bDatas.get(0).getTitle() %></th>
		</tr>
		<tr height="400">
			<td>글내용</td>
			<td><%=bDatas.get(0).getContent() %></td>
		</tr>

	</table>
	<%-- 받은파라미터no의 값<%= strNo %> <br/> --%>

	<button onclick="location.href='boardList.jsp'">목록</button>

	<%if(boardId.equals(loginId)){ %>
	<input type="button" value="수정하기" onclick="button_event2();">
	<input type="button" value="삭제하기" onclick="button_event();">
	<% } %>


	<%-- <button onclick="location.href='_98_boardUpdateMy.jsp?no=<%=bDatas.get(0).getNo() %>'">수정</button>	--%>
	<%-- <input type="hidden" name="num" value="<%=no%>"> --%>





</body>

<script>

//fucntion checkId(){
	
//}

function button_event(){
	let boardPw = "<%=boardPassword%>";
	let pw = prompt("비밀번호 입력해주세요")
	if(pw==boardPw){
		let num = "<%=strNo%>";
		
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			//alert("num =="+num);
		    location.href='boardDelete.jsp?no=' + num;		    
		
		}else{   //취소
			
			return;		
		}
	}
	else
		alert("비밀번호가 일치하지 않습니다")
		return;	
}

function button_event2(){
	let boardPw = "<%=boardPassword%>";
	let pw = prompt("비밀번호 입력해주세요")
	if(pw==boardPw){
		location.href='boardUpdate.jsp?no=<%=bDatas.get(0).getNo() %>'
	}
	else
		return;
}


</script>

</html>