package com.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.FinalMasterDAO;
import com.MyBean.Details;
import com.MyBean.FlightData;
import com.MyBean.TempData;

public class StudServletOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void confirmBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		
		HttpSession session=request.getSession(false);
		
		System.out.println("In confirmbook");
		
		Details dd;
		TempData td;
		FlightData fd;
		FinalMasterDAO ndao=new FinalMasterDAO();
		
		String bid;
		long cred;
		int tickets;
		int totprc;
		
		try
		{			
			System.out.println("In try confirmbook");
			
			cred=Long.parseLong(request.getParameter("crc"));
			dd=(Details)session.getAttribute("detobj");
			totprc=(Integer)session.getAttribute("totalprice");
			bid=(String)session.getAttribute("bookide");
			tickets=(Integer)session.getAttribute("ticks");
			
			System.out.println(bid+" "+cred+" "+tickets);
			
			//td=ndao.getFromTemp(bid,tickets);
			
			td=ndao.getTempData(dd,tickets);
			
			fd=ndao.getFromFlight(td);
			
			String currentDay=ndao.getToday();
			
			ndao.insertPass(td,bid,tickets);
			
			ndao.insertTicket(td,fd,bid,tickets);
        	
			ndao.insertBooking(td,bid,cred,currentDay,totprc);
        	
			ndao.updateSeats(td,tickets);
        	
        	response.sendRedirect("Success1.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In do get studservlet");
		confirmBook(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In do post studservlet");
		confirmBook(request,response);
	}

}
