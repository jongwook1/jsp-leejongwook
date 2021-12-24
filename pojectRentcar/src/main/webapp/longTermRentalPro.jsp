<%@page import="java.util.ArrayList"%>
<%@page import="userChoice.UserChoiceDTO"%>
<%@page import="userChoice.UserChoiceDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
	UserChoiceDAO dao = UserChoiceDAO.getInstance();
	int no = 0;
	String id = request.getParameter("id");
	String startDate = request.getParameter("startDate");
	String endDate = request.getParameter("endDate");
	String choiceSopt = request.getParameter("choiceSopt");
	String carChoice = request.getParameter("carChoice");
	String temp[]=carChoice.split("/");
	String carClass ="";
	String carName ="";
	int carPrice=0;
	for(int i=0; i<temp.length;i++){
		carClass = temp[0];
		carName = temp[1];
		carPrice =Integer.parseInt(temp[2]);
	}
	
	
	String name = request.getParameter("name");
	int birth =Integer.parseInt(request.getParameter("birth"));
	int phoneN = Integer.parseInt(request.getParameter("phoneN"));
	int drLicense = Integer.parseInt(request.getParameter("drLicense"));
	
	int dayCount = dao.dateCount(startDate, endDate);	
	int sum = dayCount*carPrice;
	
	int totalPrice = dao.disCountPrice(dayCount, sum);
	
	ArrayList<UserChoiceDTO> bDatas = dao.getUserChoose(id);
	if(bDatas == null){
		no = 0;
	}else{
		for(int i =0; i<bDatas.size(); i++){
			no = bDatas.get(i).getNo();
		}
	}
	
	
	UserChoiceDTO userChoose = new UserChoiceDTO(no, id, startDate, endDate, choiceSopt, carChoice, carClass, carName,
			carPrice, name, birth, phoneN, drLicense, dayCount, totalPrice);
	
	dao.addUserChoose(userChoose);
	
	response.sendRedirect("main.jsp");
%>

</body>
</html>