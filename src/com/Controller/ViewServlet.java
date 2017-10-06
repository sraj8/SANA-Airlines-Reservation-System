package com.Controller;

import java.io.IOException;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.LoginDAO;
import com.MyBean.TicketDisplay;

public class ViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void viewTicket(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		
		HttpSession session=request.getSession(true);
		
		String sessionId=session.getId();
		System.out.println("view "+sessionId);
		
		List<TicketDisplay> addList=new ArrayList<TicketDisplay>();
		
		System.out.println("In viewticket");
		
		TicketDisplay td=new TicketDisplay();
		
		LoginDAO ldao=new LoginDAO();
		
		String bookid=request.getParameter("uid");
		String passwd=request.getParameter("passid");
		
		td.setBid(bookid);
		td.setPasswd(passwd);
		
		System.out.println(td.getBid()+" "+td.getPasswd());
		
		boolean flag=ldao.checkLogin(td);
		
		if(flag)
		{
			System.out.println("In if(flag) viewticket");
			
			addList=ldao.ticketDetails(td);
			
			if(addList.isEmpty())
			{
				System.out.println("In addlist.isEmpty() viewticket");
				response.sendRedirect("LoginFail.jsp");
			}
			else
			{
				String ffid=td.getFid();
				String bbid=td.getBid();
				String ddepTime=td.getDepTime();
				String aarrTime=td.getArrTime();
				String sseatcl=td.getSeatcl();
				String jjdate=td.getJdate();
				String ddepap=td.getDepAp();
				String aarrap=td.getArrAp();
				
				System.out.println(ffid+" "+bbid+" "+ddepTime+" "+aarrTime+" "+sseatcl+" "+jjdate+" "+ddepap+" "+aarrap);
				
				session.setAttribute("fid",ffid);
				session.setAttribute("bid",bbid);
				session.setAttribute("deptime",ddepTime);
				session.setAttribute("arrtime",aarrTime);
				session.setAttribute("seatcl",sseatcl);
				session.setAttribute("jdate",jjdate);
				session.setAttribute("depap",ddepap);
				session.setAttribute("arrap",aarrap);
				session.setAttribute("Tic",addList);
				
				session.setAttribute("sessid",sessionId);

				response.sendRedirect("Ticket_info1.jsp");
			}
		}
		else
		{
			response.sendRedirect("LoginFail.jsp");
		}
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In do get viewservlet");
		viewTicket(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In do post viewservlet");
		viewTicket(request,response);
	}

}
