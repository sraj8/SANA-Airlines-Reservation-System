package com.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.MyBean.Details;
import com.MyBean.FlightData;
import com.MyBean.TempData;

public class FinalMasterDAO extends BaseDAO {
	
	Connection conn=null;
	Statement st=null;
	ResultSet rs=null;
	PreparedStatement ps=null;
	
	public TempData getTempData(Details dd,int ticks)
	{
		System.out.println("In getTempData()");
		
		int counter=1;
		TempData obj=new TempData(ticks);
		
		try
		{
			obj.setPwd(dd.getPasswd());
			obj.setFid(dd.getFid());
			obj.setSeatClass(dd.getSeatClass());
			obj.setJdate(dd.getJdate());
			obj.setFname(dd.getFname(),1);
			obj.setLname(dd.getLname(),1);
			obj.setAddr(dd.getAddr(),1);
			obj.setEmail(dd.getEmail(),1);
			obj.setMob(dd.getMobile(),1);
			obj.setAge(dd.getAge(),1);
			obj.setSid(dd.getSid(),1);
			obj.setTid(dd.getTid(),1);
			
			for(int i=2;i<=ticks;i++)
			{
				obj.setTid(dd.getTidArr(i),i);
				obj.setFname(dd.getFnameArr(i),i);
				obj.setLname(dd.getLnameArr(i),i);
				obj.setAddr(dd.getAddrArr(i),i);
				obj.setEmail(dd.getEmailArr(i),i);
				obj.setMob(dd.getMobArr(i),i);
				obj.setAge(dd.getAgeArr(i),i);
				obj.setSid(dd.getSidArr(i),i);
				
				System.out.println(obj.getPwd()+" "+obj.getFid()+" "+obj.getTid(counter)+" "+obj.getSeatClass()+" "+obj.getJdate()+" "+obj.getFname(counter)+" "+obj.getLname(counter)+" "+obj.getAddr(counter)+" "+obj.getEmail(counter)+" "+obj.getMob(counter)+" "+obj.getAge(counter)+" "+obj.getSid(counter));
				
				counter++;
			}
            
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return obj;
	}
	
	public FlightData getFromFlight(TempData td)
	{
		System.out.println("In getFromFlight()");
		
		FlightData fd=new FlightData();
		
		String fid=td.getFid();
		
		try
		{
			conn=getConnection();
			st=conn.createStatement();
			
			rs = st.executeQuery("SELECT dep_ap,arr_ap,dep_time,arr_time FROM flight where fid='"+fid+"'");
			
			while(rs.next())
			{
				fd.setDepap(rs.getString(1));
				fd.setArrap(rs.getString(2));
				fd.setDeptime(rs.getString(3));
				fd.setArrtime(rs.getString(4));
				
				System.out.println(fd.getDepap()+" "+fd.getArrap()+" "+fd.getDeptime()+" "+fd.getArrtime());
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return fd;
	}
	
	public String getToday()
	{
		System.out.println("In getToday()");
		
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
	
	public void insertPass(TempData td,String bid,int tickets)
	{
		System.out.println("In insertPass()");
		
		int counter=1;
		
		try
		{
			conn=getConnection();
			st=conn.createStatement();
			
			String qrpass="insert into passenger values(?,?,?,?,?,?,?,?,?)";
        	ps=conn.prepareStatement(qrpass);
        	
        	for(int i=1;i<=tickets;i++)
        	{
        		ps.setString(1,bid);
        		ps.setString(2,td.getPwd());
        		ps.setString(3,td.getFname(counter));
        		ps.setString(4,td.getLname(counter));
        		ps.setString(5,td.getAddr(counter));
        		ps.setString(6,td.getEmail(counter));
        		ps.setLong(7,td.getMob(counter));
        		ps.setInt(8,td.getAge(counter));
        		ps.setInt(9,td.getTid(counter));
        		
        		System.out.println("Pass: "+bid+" "+td.getPwd()+" "+td.getFname(counter)+" "+td.getLname(counter)+" "+td.getAddr(counter)+" "+td.getEmail(counter)+" "+td.getMob(counter)+" "+td.getAge(counter));
        		counter++;
        		
            	int countpass=ps.executeUpdate();
            	if(countpass>0)
            	{
            		System.out.println("Successfully inserted into passenger!");
            	}
            	else
            	{
            		System.out.println("Unsuccessful insertion passenger!");
            	}
        	}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void insertTicket(TempData td,FlightData fd,String bid,int tickets)
	{
		System.out.println("In insertTicket()");
		
		int counter=1;
		
		try
		{
			conn=getConnection();
			st=conn.createStatement();

			String qrtick="insert into ticket values(?,?,?,?,?,?)";
        	ps=conn.prepareStatement(qrtick);
        	
        	for(int i=1;i<=tickets;i++)
        	{        		
        		ps.setString(1,bid);
        		ps.setString(2,td.getFid());
        		ps.setInt(3,td.getTid(counter));
        		ps.setString(4,td.getSeatClass());
        		ps.setString(5,td.getJdate());
        		ps.setInt(6,td.getSid(counter));
        		
        		System.out.println("Ticket: "+bid+" "+td.getFid()+" "+td.getTid(counter)+" "+td.getSeatClass()+" "+td.getJdate()+" "+td.getSid(counter));
        		counter++;
        		
        		int counttick=ps.executeUpdate();
            	if(counttick>0)
            	{
            		System.out.println("Successfully inserted into ticket!");
            	}
            	else
            	{
            		System.out.println("Unsuccessful insertion ticket!");
            	}
        	}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void insertBooking(TempData td,String bid,long cred,String currentDay,int totprc)
	{
		System.out.println("In insertBooking()");
		
		try
		{
			conn=getConnection();
			st=conn.createStatement();
			
			String qrbook="insert into booking values(?,?,?,?)";
        	ps=conn.prepareStatement(qrbook);
        	
        	ps.setString(1,bid);
        	ps.setLong(2,cred);
        	ps.setString(3,currentDay);
        	ps.setInt(4,totprc);
        	
        	System.out.println("Booking: "+bid+" "+td.getFid()+" "+cred+" "+currentDay+" "+totprc);
        	
        	int countbook=ps.executeUpdate();
        	if(countbook>0)
        	{
        		System.out.println("Successfully inserted into booking!");
        	}
        	else
        	{
        		System.out.println("Unsuccessful insertion booking!");
        	}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void updateSeats(TempData td,int ticks)
	{
		System.out.println("In updateSeats()");
		
		try
		{
			conn=getConnection();
			st=conn.createStatement();
			
			String stclass=td.getSeatClass();
			String dat=td.getJdate();
			String fid=td.getFid();
			
			if(stclass.equals("Economy"))
        	{
        		int rows=st.executeUpdate("UPDATE day SET eco_seats=eco_seats-"+ticks+" where fid='"+fid+"' and avail_day='"+dat+"'");
				System.out.println(rows+" row(s) updated!");
        	}
        	else
        	{
        		int rows=st.executeUpdate("UPDATE day SET bus_seats=bus_seats-"+ticks+" where fid='"+fid+"' and avail_day='"+dat+"'");
        		System.out.println(rows+" row(s) updated!");
        	}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
