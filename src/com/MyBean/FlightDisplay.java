package com.MyBean;

public class FlightDisplay {
	private String fid;
	private String dep;
	private String arr;
	private String depTime;
	private String arrTime;
	private int price;
	private int availSeats;
	
	public FlightDisplay()
	{
	}
	
	public FlightDisplay(String fid,String dep,String arr,String depTime,String arrTime,int price,int availSeats)
	{
		this.fid=fid;
		this.dep=dep;
		this.arr=arr;
		this.depTime=depTime;
		this.arrTime=arrTime;
		this.price=price;
		this.availSeats=availSeats;
	}
	
	public String getFid(){
		return fid;
	}
	
	public void setFid(String fid){
		this.fid=fid;
	}
	
	public String getDep(){
		return dep;
	}
	
	public void setDep(String dep){
		this.dep=dep;
	}
	
	public String getArr(){
		return arr;
	}
	
	public void setArr(String arr){
		this.arr=arr;
	}
	
	public String getDepTime(){
		return depTime;
	}
	
	public void setDepTime(String depTime){
		this.depTime=depTime;
	}
	
	public String getArrTime(){
		return arrTime;
	}
	
	public void setArrTime(String arrTime){
		this.arrTime=arrTime;
	}
	
	public int getPrice(){
		return price;
	}
	
	public void setPrice(int price){
		this.price=price;
	}
	
	public int getAvailSeats(){
		return availSeats;
	}
	
	public void setAvailSeats(int availSeats){
		this.availSeats=availSeats;
	}

	public String toString(){
		return fid;
	}
}