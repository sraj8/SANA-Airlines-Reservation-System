package com.MyBean;

public class Details {

	private String fid;
	private String fname;
	private String lname;
	private String addr;
	private String email;
	private long mobile;
	private int age;
	private String bid;
	private String passwd;
	private String jdate;
	private String seatClass;
	private int tid;
	private int sid;
	private int ticket;
	private String fnameArr[];
	private String lnameArr[];
	private String addrArr[];
	private String emailArr[];
	private long mobArr[];
	private int ageArr[];
	private int tidArr[];
	private int sidArr[];
	
	public Details()
	{
	}
	
	public Details(int ticks)
	{
		fnameArr=new String[ticks+1];
		lnameArr=new String[ticks+1];
		addrArr=new String[ticks+1];
		emailArr=new String[ticks+1];
		mobArr=new long[ticks+1];
		ageArr=new int[ticks+1];
		tidArr=new int[ticks+1];
		sidArr=new int[ticks+1];
	}

	public String getFid() {
		return fid;
	}

	public void setFid(String fid) {
		this.fid = fid;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getMobile() {
		return mobile;
	}

	public void setMobile(long mobile) {
		this.mobile = mobile;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getBid() {
		return bid;
	}

	public void setBid(String bid) {
		this.bid = bid;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getJdate() {
		return jdate;
	}

	public void setJdate(String jdate) {
		this.jdate = jdate;
	}

	public String getSeatClass() {
		return seatClass;
	}

	public void setSeatClass(String seatClass) {
		this.seatClass = seatClass;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public int getTicket() {
		return ticket;
	}

	public void setTicket(int ticket) {
		this.ticket = ticket;
	}

	public String getFnameArr(int index) {
		return fnameArr[index];
	}

	public void setFnameArr(String fnameArr,int index) {
		this.fnameArr[index] = fnameArr;
	}

	public String getLnameArr(int index) {
		return lnameArr[index];
	}

	public void setLnameArr(String lnameArr,int index) {
		this.lnameArr[index] = lnameArr;
	}

	public String getAddrArr(int index) {
		return addrArr[index];
	}

	public void setAddrArr(String addrArr,int index) {
		this.addrArr[index] = addrArr;
	}

	public String getEmailArr(int index) {
		return emailArr[index];
	}

	public void setEmailArr(String emailArr,int index) {
		this.emailArr[index] = emailArr;
	}

	public long getMobArr(int index) {
		return mobArr[index];
	}

	public void setMobArr(long mobArr,int index) {
		this.mobArr[index] = mobArr;
	}

	public int getAgeArr(int index) {
		return ageArr[index];
	}

	public void setAgeArr(int ageArr,int index) {
		this.ageArr[index] = ageArr;
	}

	public int getTidArr(int index) {
		return tidArr[index];
	}

	public void setTidArr(int tidArr,int index) {
		this.tidArr[index] = tidArr;
	}

	public int getSidArr(int index) {
		return sidArr[index];
	}

	public void setSidArr(int sidArr,int index) {
		this.sidArr[index] = sidArr;
	}
}
