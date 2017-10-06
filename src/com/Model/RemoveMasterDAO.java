package com.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.MyBean.RemoveData;

public class RemoveMasterDAO extends BaseDAO {
	
	Connection conn=null;
	Statement st=null;
	ResultSet rs=null;
	PreparedStatement ps=null;

	public String getToday()
	{
		System.out.println("In getToday() removemaster");
		
		String cday="";
		
		try
		{
			conn=getConnection();
			st=conn.createStatement();
			
			rs = st.executeQuery("SELECT to_char(sysdate,'dd-mm-yyyy') FROM dual");
			while(rs.next())
			{
				cday=rs.getString(1);
				
				System.out.println(cday);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return cday;
	}
	
	public void insertCancel(RemoveData rd,String currentDay,int ticks)
	{
		System.out.println("In insertCancel()");
		
		try
		{
			conn=getConnection();
			st=conn.createStatement();
			
			for(int i=0;i<ticks;i++)
			{
				String qrcancel="insert into cancellation values(?,?,?)";
	        	ps=conn.prepareStatement(qrcancel);
	        	
	        	ps.setString(1,rd.getBid());
	        	//ps.setString(2,rd.getFid());
	        	ps.setLong(2,rd.getTid(i));
	        	ps.setString(3,currentDay);
	        	
	        	System.out.println("Cancellation: "+rd.getBid()+" "+rd.getTid(i)+" "+currentDay);
	        	
	        	int countcan=ps.executeUpdate();
	        	if(countcan>0)
	        	{
	        		System.out.println("Successfully inserted into cancellation!");
	        	}
	        	else
	        	{
	        		System.out.println("Unsuccessful insertion cancellation!");
	        	}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
		
	public void deletePass(RemoveData rd,int ticks)
	{
		System.out.println("In deletePass()");
		int count=0;
			
		try
		{
			conn=getConnection();
			st=conn.createStatement();
				
			for(int i=0;i<ticks;i++)
			{
				int ctid=rd.getTid(i);
					
				count=st.executeUpdate("DELETE FROM passenger where tid='"+ctid+"'");
					
				if(count>0)
				{
					System.out.println("Successfully deleted from passenger");
				}
				else
				{
					System.out.println("Unsuccessful deletion from passenger");
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void deleteTicket(RemoveData rd,int ticks)
	{
		System.out.println("In deleteTicket()");
		int count=0;
			
		try
		{
			conn=getConnection();
			st=conn.createStatement();
				
			for(int i=0;i<ticks;i++)
			{
				int ctid=rd.getTid(i);
					
				count=st.executeUpdate("DELETE FROM ticket where tid='"+ctid+"'");
					
				if(count>0)
				{
					System.out.println("Successfully deleted from ticket");
				}
				else
				{
					System.out.println("Unsuccessful deletion from ticket");
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void updateSeats(RemoveData rd,int ticks)
	{
		System.out.println("In updateSeats()");
			
		try
		{
			conn=getConnection();
			st=conn.createStatement();
			
			String scl=rd.getSeatClass();
			String fid=rd.getFid();
			String jdat=rd.getJdate();
				
			if(scl.equals("Economy"))
        	{
        		int rows=st.executeUpdate("UPDATE day SET eco_seats=eco_seats+"+ticks+" where fid='"+fid+"' and avail_day='"+jdat+"'");
        		System.out.println(rows+" row(s) updated!");
        	}
        	else
        	{
        		int rows=st.executeUpdate("UPDATE day SET bus_seats=bus_seats+"+ticks+" where fid='"+fid+"' and avail_day='"+jdat+"'");
        		System.out.println(rows+" row(s) updated!");
        	}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
