package com.mini.model;
import lombok.Data;

public class Main {
	private String tbNo;
	private String id;
	private String bPrice;
	private String bTitle;
	private String hits;
	private String likes;
	private String path;
	
	public String getTbNo() {
		return tbNo;
	}
	public void setTbNo(String tbNo) {
		this.tbNo = tbNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getbPrice() {
		return bPrice;
	}
	public void setbPrice(String bPrice) {
		this.bPrice = bPrice;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getHits() {
		return hits;
	}
	public void setHits(String hits) {
		this.hits = hits;
	}
	public String getLikes() {
		return likes;
	}
	public void setLikes(String likes) {
		this.likes = likes;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
}
