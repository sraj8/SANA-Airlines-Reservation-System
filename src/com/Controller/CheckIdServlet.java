package com.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void checkId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		HttpSession session=request.getSession(false);
        
		System.out.println("In checkid method");
		
		try
		{
			String id=request.getParameter("bookform");
			
			String stClass=(String)session.getAttribute("seatclass");
			String day=(String)session.getAttribute("dayss");
			int tickets=(Integer)session.getAttribute("ticks");
			
			System.out.println(id);
			System.out.println(stClass);
			System.out.println(day);
			System.out.println(tickets);
			
			session.setAttribute("fligid",id);
			response.sendRedirect("details1.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In do get checkidservlet");
		checkId(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In do post checkidservlet");
		checkId(request,response);
	}

}
