package com.bridgeIt.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.bridgeIt.model.User;
import com.bridgeIt.service.Service;

/**
 * Servlet implementation class LoginController
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		processesRequest(request, response);
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		processesRequest(req, resp);
	}
	
	
	public void processesRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{

		
//		HttpSession session = request.getSession(false);
//		response.setContentType("text/html");
//		User user1 = (User)session.getAttribute("user");
//		 if (user1!=null){
//			
//			 request.getRequestDispatcher("UserHome.jsp").forward(request, response);
//		}
//		
		
		String email = request.getParameter("emailId");
		String password = request.getParameter("password");

		System.out.println(email + " " + password);

		Service service = new Service();
		ResultSet set = service.userLogIn(email, password);
		System.out.println(set);
		try {
			set.next();
			
			User user = new User();
			user.setEmail(set.getString("email"));
			user.setFullName(set.getString("fullName"));
			user.setPassword(set.getString("password"));
			user.setUserName(set.getString("userName"));
			HttpSession session = request.getSession();
			session.setAttribute("userObj", user);
			Cookie userCookies = new Cookie("user",user.getEmail());
			userCookies.setMaxAge(30*60);
			response.addCookie(userCookies);
			
		//	request.getRequestDispatcher("UserHome.jsp").forward(request, response);
		//	response.sendRedirect("UserHome.jsp");
			
			//Get the encoded URL string
			String encodedURL = response.encodeRedirectURL("UserHome.jsp");
			response.sendRedirect(encodedURL);
			
			
//			System.out.println(
//					set.getString("email") + " " + set.getString("userName") + " " + set.getString("fullName"));
		} catch (SQLException e) {
			
			String warning = "Wrong email or Password entered";
		//	HttpSession session=request.getSession();	
			request.setAttribute("warning", warning);
			
			//response.sendRedirect("index.jsp");
			request.getRequestDispatcher("index.jsp").forward(request, response);
			e.printStackTrace();

		}

	}
	

}
