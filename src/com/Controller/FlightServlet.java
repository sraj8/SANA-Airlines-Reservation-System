package com.Controller;

import com.Model.FlightMasterDAO;
import com.MyBean.Flight;
import com.MyBean.FlightDisplay;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class FlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void checkFlights(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		HttpSession session=request.getSession(true);
		
		String sessionId=session.getId();
		
		List<FlightDisplay> addList=new ArrayList<FlightDisplay>();
		FlightMasterDAO fdao=new FlightMasterDAO();
		
		System.out.println("In checkFlight method");
		
		Flight f=new Flight();
		
		String stClass="";
		String day="";
		int tickets=0;
		
		try
		{
			
			String src=request.getParameter("source");
			String dest=request.getParameter("dest");
			day=request.getParameter("datepicker");
			tickets=Integer.parseInt(request.getParameter("adult"));
			stClass=request.getParameter("sclass");
			
			System.out.println(src+" "+dest+" "+day+" "+tickets);
			
			f.setDep(src);
			f.setArr(dest);
			f.setAvailDay(day);
			f.setTickets(tickets);
			f.setSeatClass(stClass);
			
			System.out.println(f.getDep()+" "+f.getArr()+" "+f.getAvailDay()+" "+f.getTickets()+" "+f.getSeatClass());
			
			addList=fdao.retrieveFlights(f);
			
			if(addList.isEmpty())
			{
				response.sendRedirect("No_Flights.jsp");
			}
			else
			{
					session.setAttribute("seatclass",stClass);
					session.setAttribute("ticks",tickets);
					session.setAttribute("dayss",day);
					session.setAttribute("Fli",addList);
					session.setAttribute("sessid",sessionId);
					response.sendRedirect("Flight_info1.jsp");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In do get flightservlet");
		checkFlights(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In do post flightservlet");
		checkFlights(request,response);
	}

}