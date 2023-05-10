package com.mini.model;

import lombok.Data;

public class Cimg {
	private int cbno;
	private int cpathno;
	private String path;
	private String rep;
	
	public int getCbno() {
		return cbno;
	}
	public void setCbno(int cbno) {
		this.cbno = cbno;
	}
	public int getCpathno() {
		return cpathno;
	}
	public void setCpathno(int cpathno) {
		this.cpathno = cpathno;
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
