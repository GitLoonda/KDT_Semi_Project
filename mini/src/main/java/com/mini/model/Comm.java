package com.mini.model;

import lombok.Data;

public class Comm {
    
	private int cbNo;
	private String id;
	private String cate1;
	private String cate2;
	private String ctitle;
	private String ccont;
	private int hits;
	private String cdate;
	private String udate;
	private String delYn;
	
	public int getCbNo() {
		return cbNo;
	}
	public void setCbNo(int cbNo) {
		this.cbNo = cbNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCate1() {
		return cate1;
	}
	public void setCate1(String cate1) {
		this.cate1 = cate1;
	}
	public String getCate2() {
		return cate2;
	}
	public void setCate2(String cate2) {
		this.cate2 = cate2;
	}
	public String getCtitle() {
		return ctitle;
	}
	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}
	public String getCcont() {
		return ccont;
	}
	public void setCcont(String ccont) {
		this.ccont = ccont;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public String getUdate() {
		return udate;
	}
	public void setUdate(String udate) {
		this.udate = udate;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

}
