package com.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.MyBean.Details;

public class DetailsMasterDAO extends BaseDAO {

	Connection conn;
	PreparedStatement ps=null;
	Statement st=null;
	ResultSet rs=null;
	
	public boolean checkBid(Details d)
	{
		System.out.println("In checkBid()");
		
		try
		{
			conn=getConnection();
			st=conn.createStatement();
			
			String bid=d.getBid();
			
			rs = st.executeQuery("SELECT * FROM ticket where bid='"+bid+"'");
            
            if(rs.next())
            {
            	return true;
            }
            else
            {
            	return false;
            }
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return true;
	}
	
	public int calcTotPrice(Details d)
	{
		System.out.println("In calcTotPrice()");
		
		int totprc=0;
		
		try
		{
			conn=getConnection();
			st=conn.createStatement();
		
			String seatClass=d.getSeatClass();
			String fid=d.getFid();
			int ticks=d.getTicket();
			int prc=0;
		
			if(seatClass.equals("Economy"))
			{
				rs = st.executeQuery("SELECT eco_price FROM flight where fid='"+fid+"'");
			}
			else
			{
				rs = st.executeQuery("SELECT bus_price FROM flight where fid='"+fid+"'");
			}
    	
			while(rs.next())
			{
				prc=rs.getInt(1);
			}
    	
			totprc=ticks*prc;
    	
			System.out.println(prc+" "+totprc);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return totprc;
	}
}
