package com.MyBean;

public class Flight {

	private String fid;
	private String dep;
	private String arr;
	private String depTime;
	private String arrTime;
	private String availDay;
	private int tickets;
	private int price;
	private String seatClass;
	
	public Flight()
	{
	}
	
	public Flight(String fid,String dep,String arr,String depTime,String arrTime,String availDay,int tickets,int price,String seatClass)
	{
		this.fid=fid;
		this.dep=dep;
		this.arr=arr;
		this.depTime=depTime;
		this.arrTime=arrTime;
		this.availDay=availDay;
		this.tickets=tickets;
		this.price=price;
		this.seatClass=seatClass;
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
	
	public String getAvailDay(){
		return availDay;
	}
	
	public void setAvailDay(String availDay){
		this.availDay=availDay;
	}
	
	public int getTickets(){
		return tickets;
	}
	
	public void setTickets(int tickets){
		this.tickets=tickets;
	}
	
	public int getPrice(){
		return price;
	}
	
	public void setPrice(int price){
		this.price=price;
	}
	
	public String getSeatClass(){
		return seatClass;
	}
	
	public void setSeatClass(String seatClass){
		this.seatClass=seatClass;
	}
}
