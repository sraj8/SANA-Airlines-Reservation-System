package com.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.RemoveMasterDAO;
import com.MyBean.RemoveData;

public class RemoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void removeTickets(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		HttpSession session=request.getSession(false);
		
		System.out.println(session.getId());
		
		if(session==null || session.isNew())
		{
			response.sendRedirect("Home.jsp");
		}
		
		RemoveData rd;
		RemoveMasterDAO rdao=new RemoveMasterDAO();
		
		System.out.println("In removeTickets method");
		
		int counter=0;
		int tids[]=new int[10];
		
		String selectedItems[] = request.getParameterValues("tidd");
		for (String sitem : selectedItems)
		{
		    tids[counter++]=Integer.parseInt(request.getParameter("tid_"+sitem));
		}
		
		for(int i=0;i<counter;i++)
		{
			System.out.println(tids[i]);
		}
		
		rd=new RemoveData(counter);
		
		String fid=(String)session.getAttribute("fid");
		String bid=(String)session.getAttribute("bid");
		String scl=(String)session.getAttribute("seatcl");
		String jdat=(String)session.getAttribute("jdate");
		
		rd.setFid(fid);
		rd.setBid(bid);
		rd.setSeatClass(scl);
		rd.setJdate(jdat);
		
		for(int i=0;i<counter;i++)
		{
			rd.setTid(tids[i],i);
		}
		
		String currentDay=rdao.getToday();
		
		rdao.insertCancel(rd,currentDay,counter);
		
		rdao.deleteTicket(rd,counter);
		
		rdao.deletePass(rd,counter);
	
		rdao.updateSeats(rd,counter);
		
        response.sendRedirect("CancelSuccess1.jsp");
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In do get removeservlet");
		removeTickets(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In do post removeservlet");
		removeTickets(request,response);
	}

}
