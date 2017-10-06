package com.MyBean;

public class TempData {

	private String pwd;
	private String fid;
	private String seatClass;
	private String jdate;
	private String fname[];
	private String lname[];
	private String addr[];
	private String email[];
	private long mob[];
	private int age[];
	private int sid[];
	private int tid[];
	
	public TempData()
	{
	}
	
	public TempData(int ticks)
	{
		fname=new String[ticks+1];
		lname=new String[ticks+1];
		addr=new String[ticks+1];
		email=new String[ticks+1];
		mob=new long[ticks+1];
		age=new int[ticks+1];
		sid=new int[ticks+1];
		tid=new int[ticks+1];
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getFid() {
		return fid;
	}

	public void setFid(String fid) {
		this.fid = fid;
	}

	public String getSeatClass() {
		return seatClass;
	}

	public void setSeatClass(String seatClass) {
		this.seatClass = seatClass;
	}

	public String getJdate() {
		return jdate;
	}

	public void setJdate(String jdate) {
		this.jdate = jdate;
	}

	public String getFname(int index) {
		return fname[index];
	}

	public void setFname(String fname,int index) {
		this.fname[index] = fname;
	}

	public String getLname(int index) {
		return lname[index];
	}

	public void setLname(String lname,int index) {
		this.lname[index] = lname;
	}

	public String getAddr(int index) {
		return addr[index];
	}

	public void setAddr(String addr,int index) {
		this.addr[index] = addr;
	}

	public String getEmail(int index) {
		return email[index];
	}

	public void setEmail(String email,int index) {
		this.email[index] = email;
	}

	public long getMob(int index) {
		return mob[index];
	}

	public void setMob(long mob,int index) {
		this.mob[index] = mob;
	}

	public int getAge(int index) {
		return age[index];
	}

	public void setAge(int age,int index) {
		this.age[index] = age;
	}

	public int getSid(int index) {
		return sid[index];
	}

	public void setSid(int sid,int index) {
		this.sid[index] = sid;
	}
	
	public int getTid(int index) {
		return tid[index];
	}

	public void setTid(int tid,int index) {
		this.tid[index] = tid;
	}
}
