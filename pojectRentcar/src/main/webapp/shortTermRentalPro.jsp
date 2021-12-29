<%@page import="carInfo.CarInfoDAO"%>
<%@page import="carInfo.CarInfoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="userChoice.UserChoiceDTO"%>
<%@page import="userChoice.UserChoiceDAO"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숏렌탈프로</title>
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
	int totalPrice = dayCount*carPrice;
	
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
	
	
	CarInfoDTO reserveCar= new CarInfoDTO(startDate, endDate, carName);
	CarInfoDAO cDao = CarInfoDAO.getInstance();
	cDao.updateCarInfo(reserveCar);
	
	response.sendRedirect("main.jsp");
%>


	id::
	<%=id %>
	startDate:::<%=startDate %>
	endDate:::<%=endDate %>
	choiceSopt:::<%=choiceSopt %>
	carChoice:::<%=carChoice %>
	name:::<%=name %>
	birth:::<%=birth %>
	phoneN:::<%=phoneN %>
	drLicense:::<%=drLicense %>

	carClass:::<%=carClass %>
	carName:::<%=carName %>
	carPrice:::<%=carPrice %>

	dayCount:::<%=dayCount %>
	totalPrice:::<%=totalPrice %>

</body>
</html>