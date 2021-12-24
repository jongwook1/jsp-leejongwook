package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDAO;
import model.dto.UserDTO;

/**
 * Servlet implementation class JoinPro
 */
//@WebServlet("/JoinPro")
public class JoinPro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinPro() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		UserDAO dao = UserDAO.getInstance();
		dao.getUsers();
		
		UserDTO user = new UserDTO(id, pw);
		if(dao.addUser(user) != -1) {
			String url = "views/main.jsp";
			request.getRequestDispatcher(url).forward(request, response);
		}
		else {
			String url = "views/join.jsp";
			request.getRequestDispatcher(url).forward(request, response);
		}
		System.out.println("id: " + id);
		System.out.println("pw: " + pw);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("adfasfs");
		System.out.println("JoinPro :: doPost");
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
