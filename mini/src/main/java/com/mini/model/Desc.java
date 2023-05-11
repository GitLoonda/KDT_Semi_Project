package com.mini.model;
import lombok.Data;

public class Desc {
    private String dNo;
    private String cId;
    private String cNum;
    private String cInfo;
    private String pComm1;
    private String pComm2;
    
	public String getdNo() {
		return dNo;
	}
	public void setdNo(String dNo) {
		this.dNo = dNo;
	}
	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId;
	}
	public String getcNum() {
		return cNum;
	}
	public void setcNum(String cNum) {
		this.cNum = cNum;
	}
	public String getcInfo() {
		return cInfo;
	}
	public void setcInfo(String cInfo) {
		this.cInfo = cInfo;
	}
	public String getpComm1() {
		return pComm1;
	}
	public void setpComm1(String pComm1) {
		this.pComm1 = pComm1;
	}
	public String getpComm2() {
		return pComm2;
	}
	public void setpComm2(String pComm2) {
		this.pComm2 = pComm2;
	}

}
