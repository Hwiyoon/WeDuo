package com.weduo.caffeinme.board;

import java.util.Date;

public class CafeReviewVO {
	//ÇÊµå
	private int RNO;
	private int CNO;
	private String CONTENT;
	private String MID;
	private Date REVIEWDATE;
	
	//setter&getter
	public int getRNO() {
		return RNO;
	}
	public void setRNO(int rNO) {
		RNO = rNO;
	}
	public int getCNO() {
		return CNO;
	}
	public void setCNO(int cNO) {
		CNO = cNO;
	}
	public String getCONTENT() {
		return CONTENT;
	}
	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}
	public String getMID() {
		return MID;
	}
	public void setMID(String mID) {
		MID = mID;
	}
	public Date getREVIEWDATE() {
		return REVIEWDATE;
	}
	public void setREVIEWDATE(Date rEVIEWDATE) {
		REVIEWDATE = rEVIEWDATE;
	}

	
}
