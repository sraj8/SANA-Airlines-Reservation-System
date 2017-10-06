package com.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		HttpSession session=request.getSession(false);
		
		//System.out.println(session.getId());
		
		if(session==null || session.isNew())
		{
			response.sendRedirect("Home.jsp");
		}
		
		session.invalidate();
		
		response.sendRedirect("Logout1.jsp");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In do get logout servlet");
		logout(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In do post logout servlet");
		logout(request,response);
	}

}
