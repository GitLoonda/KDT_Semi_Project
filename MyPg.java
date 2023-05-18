package com.mini.model;
import lombok.Data;

public class MyPg {
	private String id;
	private String intro;
	private String pinfo;
	private String cintro;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getPinfo() {
		return pinfo;
	}
	public void setPinfo(String pinfo) {
		this.pinfo = pinfo;
	}
	public String getCintro() {
		return cintro;
	}
	public void setCintro(String cintro) {
		this.cintro = cintro;
	}

}
