package com.Model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.MyBean.TicketDisplay;

public class LoginDAO extends BaseDAO{

	Connection conn=null;
	Statement s=null;
	ResultSet rs=null;
	
	public boolean checkLogin(TicketDisplay td)
	{
		try {
				String bookid=td.getBid();
				String passid=td.getPasswd();
				
				System.out.println("In checklogin method");
				
				System.out.println(bookid+" "+passid);
			
				conn=getConnection();
            	s = conn.createStatement();
            	rs=s.executeQuery("select * from passenger where bid='"+bookid+"' and passwd='"+passid+"'");
            	
            	while(rs.next())
            	{
            		return true;
            	}
        } 
        catch (SQLException ex) {
            Logger.getLogger(LoginDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
		
		return false;
	}
	
	public List<TicketDisplay> ticketDetails(TicketDisplay td)
	{
		ArrayList<TicketDisplay> addList=new ArrayList<TicketDisplay>();
		try
		{
			System.out.println("In ticketDetails method");
			String bid=td.getBid();
			
			System.out.println("Bid= "+bid);
			
			s=conn.createStatement();
			rs=s.executeQuery("SELECT ticket.bid,ticket.fid,ticket.tid,ticket.sclass,ticket.jdate,passenger.fname,passenger.lname,passenger.age,ticket.sid,flight.dep_ap,flight.arr_ap,flight.dep_time,flight.arr_time FROM ticket,flight,passenger WHERE ticket.fid=flight.fid and ticket.tid=passenger.tid and ticket.bid='"+bid+"' order by ticket.sid");
			
			while(rs.next())
			{
				TicketDisplay ttd=new TicketDisplay();
				
				td.setBid(rs.getString(1));
				td.setFid(rs.getString(2));
				td.setSeatcl(rs.getString(4));	
				td.setJdate(rs.getString(5));
				td.setDepAp(rs.getString(10));
				td.setArrAp(rs.getString(11));
				td.setDepTime(rs.getString(12));
				td.setArrTime(rs.getString(13));
				
				ttd.setTid(rs.getLong(3));
				ttd.setFname(rs.getString(6));
				ttd.setLname(rs.getString(7));
				ttd.setAge(rs.getInt(8));
				ttd.setSeatno(rs.getInt(9));
				
				addList.add(ttd);
				
				for(TicketDisplay d: addList) {
	            	System.out.println(d.getFname()+" "+d.getLname()+" "+d.getSeatno()+" "+d.getTid()+" "+d.getAge());
	        	}
				System.out.println("--------");
				
				System.out.println(td.getBid()+" "+td.getFid()+" "+td.getSeatcl()+" "+td.getJdate()+" "+td.getDepAp()+" "+td.getArrAp()+" "+td.getDepTime()+" "+td.getArrTime()+" "+ttd.getTid()+" "+ttd.getFname()+" "+ttd.getLname()+" "+ttd.getAge()+" "+ttd.getSeatno());
			}
		}
		catch(SQLException ex)
		{
			  Logger.getLogger(LoginDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return addList;
	}
}
