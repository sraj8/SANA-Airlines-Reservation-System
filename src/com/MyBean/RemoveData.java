package com.MyBean;

public class RemoveData {

	private String fid;
	private String bid;
	private String jdate;
	private String seatClass;
	private int tid[];
	
	public RemoveData()
	{
	}
	
	public RemoveData(int count)
	{
		tid=new int[count];
	}

	public String getFid() {
		return fid;
	}

	public void setFid(String fid) {
		this.fid = fid;
	}

	public String getBid() {
		return bid;
	}

	public void setBid(String bid) {
		this.bid = bid;
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

	public int getTid(int index) {
		return tid[index];
	}

	public void setTid(int tid,int index) {
		this.tid[index] = tid;
	}
}
