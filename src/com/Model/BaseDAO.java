package com.Model;

import java.sql.*;

public class BaseDAO {
	Connection con;

	public Connection getConnection()
	{
		try
		{
			Class.forName("oracle.jdbc.OracleDriver");
        	con=DriverManager.getConnection("jdbc:oracle:thin:testuser/testpass@localhost");
		}
	
		catch(Exception e)
		{
			System.out.println(e);
		}
		
		return con;
	}

	public void closeConnection()
	{
		try
		{
			con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
}
