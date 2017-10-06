package com.Model;

import com.MyBean.Flight;
import com.MyBean.FlightDisplay;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class FlightMasterDAO extends BaseDAO {

	Connection conn;
	PreparedStatement stmt=null;
	Statement st=null;
	ResultSet rs=null;
	
	public List<FlightDisplay> retrieveFlights(Flight f){
		ArrayList<FlightDisplay> addList=new ArrayList<FlightDisplay>();
		
		try
		{
			System.out.println("In retrieve flights");
			
			conn=getConnection();
			st=conn.createStatement();
			
			String dayssk=f.getAvailDay();
			String dep=f.getDep();
			String arr=f.getArr();
			int ticket=f.getTickets();
			String seaClass=f.getSeatClass();
			
			System.out.println(dayssk+" "+dep+" "+arr+" "+ticket+" "+seaClass);
			
			System.out.println(dayssk+dayssk);
			
			if(seaClass.equalsIgnoreCase("Economy"))
			{
				rs=st.executeQuery("select flight.fid,dep_ap,arr_ap,dep_time,arr_time,eco_price,eco_seats from flight,day where flight.fid=day.fid and avail_day='"+dayssk+"' and dep_ap='"+dep+"' and arr_ap='"+arr+"' and eco_seats>="+ticket);
			}
			else
			{
				rs=st.executeQuery("select flight.fid,dep_ap,arr_ap,dep_time,arr_time,bus_price,bus_seats from flight,day where flight.fid=day.fid and avail_day='"+dayssk+"' and dep_ap='"+dep+"' and arr_ap='"+arr+"' and bus_seats>="+ticket);
			}
				
			while(rs.next())
			{
				FlightDisplay fd=new FlightDisplay();
					
				fd.setFid(rs.getString(1));
				fd.setDep(rs.getString(2));
				fd.setArr(rs.getString(3));
				fd.setDepTime(rs.getString(4));
				fd.setArrTime(rs.getString(5));
				fd.setPrice(rs.getInt(6));
				fd.setAvailSeats(rs.getInt(7));
				
				addList.add(fd);
				
				System.out.println(fd.getFid());
				System.out.println(fd.getDep());
				System.out.println(fd.getArr());
				System.out.println(fd.getDepTime());
				System.out.println(fd.getArrTime());
				System.out.println(fd.getPrice());
				System.out.println(fd.getAvailSeats());
			}
		}
		catch(SQLException ex)
		{
			Logger.getLogger(FlightMasterDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		
		return addList;
	}

}
