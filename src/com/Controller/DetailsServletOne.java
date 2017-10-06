package com.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Model.DetailsMasterDAO;
import com.MyBean.Details;

public class DetailsServletOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void processDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		HttpSession session=request.getSession(false);
		
		Details d;
		DetailsMasterDAO ddao=new DetailsMasterDAO();
		
		String id,fnames,lnames,addrs,emails,bid,pwd,stClass,day;
		int tickets,tidone,sidone,ages;
		String first[],last[],address[],emailid[];
		int tid[],sid[],ageno[];
		long mobno[];
		long mobs;
		
		int totPrice=0;
		
		System.out.println("In processdetails method");
		
		try
		{
			fnames=request.getParameter("fname");
			lnames=request.getParameter("lname");
			addrs=request.getParameter("addr");
			emails=request.getParameter("email");
			mobs=Long.parseLong(request.getParameter("mob"));
			ages=Integer.parseInt(request.getParameter("age"));
			bid=request.getParameter("bookid");
			pwd=request.getParameter("passwd");
			
			id=(String)session.getAttribute("fligid");
			stClass=(String)session.getAttribute("seatclass");
			day=(String)session.getAttribute("dayss");
			tickets=(Integer)session.getAttribute("ticks");
			
			tidone=generateUniqueId();
			sidone=generateUniqueId()/10000000;
			
			d=new Details(tickets);
			
			d.setFid(id);
			d.setFname(fnames);
			d.setLname(lnames);
			d.setAddr(addrs);
			d.setEmail(emails);
			d.setMobile(mobs);
			d.setAge(ages);
			d.setBid(bid);
			d.setPasswd(pwd);
			d.setSeatClass(stClass);
			d.setJdate(day);
			d.setTicket(tickets);
			d.setTid(tidone);
			d.setSid(sidone);
			
			System.out.println(fnames+" "+lnames+" "+addrs+" "+emails+" "+mobs+" "+ages+" "+tidone+" "+sidone);
			
			System.out.println("In try processdetails");
				
			System.out.println("In if try processdetails");
				
			first=new String[tickets+1];
			last=new String[tickets+1];
			address=new String[tickets+1];
			emailid=new String[tickets+1];
			mobno=new long[tickets+1];
			ageno=new int[tickets+1];
			tid=new int[tickets+1];
			sid=new int[tickets+1];
				
			for(int i=2;i<=tickets;i++)
			{
				first[i]=request.getParameter("fname_"+i);
				last[i]=request.getParameter("lname_"+i);
				address[i]=request.getParameter("addr_"+i);
				emailid[i]=request.getParameter("email_"+i);
				mobno[i]=Long.parseLong(request.getParameter("mob_"+i));
				ageno[i]=Integer.parseInt(request.getParameter("age_"+i));
					
				tid[i]=generateUniqueId();
				sid[i]=sidone+i-1;
				
				d.setFnameArr(first[i],i);
				d.setLnameArr(last[i],i);
				d.setAddrArr(address[i],i);
				d.setEmailArr(emailid[i],i);
				d.setMobArr(mobno[i],i);
				d.setAgeArr(ageno[i],i);
				d.setTidArr(tid[i],i);
				d.setSidArr(sid[i],i);
				
				System.out.println(first[i]+" "+last[i]+" "+address[i]+" "+emailid[i]+" "+mobno[i]+" "+ageno[i]+" "+tid[i]);
			}
			
			System.out.println(id+" "+fnames+" "+lnames+" "+addrs+" "+emails+" "+mobs+" "+ages+" "+bid+" "+pwd+" "+stClass+" "+day+" "+tickets);
			
			boolean flag=ddao.checkBid(d);
			
			if(flag)
			{
				response.sendRedirect("ErrorBid.jsp");
			}
			else
			{
				//ddao.insertTemp(d);
				totPrice=ddao.calcTotPrice(d);
				
				session.setAttribute("detobj",d);
				session.setAttribute("totalprice", totPrice);
				session.setAttribute("bookide",bid);
				response.sendRedirect("Payment1.jsp");
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			out.close();
		}
	}
	
	private static int generateUniqueId() {      
        UUID idOne = UUID.randomUUID();
        String str=""+idOne;        
        int uid=str.hashCode();
        String filterStr=""+uid;
        str=filterStr.replaceAll("-", "");
        return Integer.parseInt(str);
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In do get detailsservletone");
		processDetails(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("In do post detailsservletone");
		processDetails(request,response);
	}

}
