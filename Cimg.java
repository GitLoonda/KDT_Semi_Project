package com.mini.model;

import lombok.Data;

public class Cimg {
	int cpathNo;
	int cbno;
	String path;
	String rep;
	
	public int getCpathNo() {
		return cpathNo;
	}
	public void setCpathNo(int cpathNo) {
		this.cpathNo = cpathNo;
	}
	public int getCbno() {
		return cbno;
	}
	public void setCbno(int cbno) {
		this.cbno = cbno;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getRep() {
		return rep;
	}
	public void setRep(String rep) {
		this.rep = rep;
	}
}
