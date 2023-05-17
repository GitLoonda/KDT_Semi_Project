package com.mini.model;

import lombok.Data;

public class Comment {
    
	private int cno;
	private int tbNo;
	private int cbNo;
	private String id;
	private String conte;
	private String reconte;
	private String cdate;
	private String udate;
	private String recno;
	private String revwFlg;
	private String showYn;
	private String delYn;
	
	//--------------- JOIN 들어갈거
	
	private String brdFlg;
	private String cate1;
	private String cate2;
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getTbNo() {
		return tbNo;
	}
	public void setTbNo(int tbNo) {
		this.tbNo = tbNo;
	}

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
	public String getConte() {
		return conte;
	}
	public void setConte(String conte) {
		this.conte = conte;
	}
	public String getReconte() {
		return reconte;
	}
	public void setReconte(String reconte) {
		this.reconte = reconte;
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
	public String getRecno() {
		return recno;
	}
	public void setRecno(String recno) {
		this.recno = recno;
	}
	public String getRevwFlg() {
		return revwFlg;
	}
	public void setRevwFlg(String revwFlg) {
		this.revwFlg = revwFlg;
	}
	public String getShowYn() {
		return showYn;
	}
	public void setShowYn(String showYn) {
		this.showYn = showYn;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getBrdFlg() {
		return brdFlg;
	}
	public void setBrdFlg(String brdFlg) {
		this.brdFlg = brdFlg;
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

}
