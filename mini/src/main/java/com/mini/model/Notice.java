package com.mini.model;
import lombok.Data;

public class Notice {
    private int abNo;
    private String id;
    private String cate0;
    private String atitle;
    private String acont;
    private int hits;
    private String cdate;
    private String udate;
    private String delYn;
    
    //----------------------- 공지사항
    
    private int cno;
    private int tbNo;
    private String conte;
    private String reconte;
    private String recNo;
    private String revwFlg;
    private String showYN;
    
    //----------------------- 밴리스트
    
    private int baNo;
    private String adate;
    
    private int bancnt1;
    private int bancnt2;

    //----------------------- 밴 확인
    
    private String ustatus;
    
    //----------------------- 크리에이터 승인 목록

	private String cretitle;
    private String crecont;
    private String creYn;
    
    
    
    public String getCreYn() {
		return creYn;
	}
	public void setCreYn(String creYn) {
		this.creYn = creYn;
	}
	public String getCretitle() {
		return cretitle;
	}
	public void setCretitle(String cretitle) {
		this.cretitle = cretitle;
	}
	public String getCrecont() {
		return crecont;
	}
	public void setCrecont(String crecont) {
		this.crecont = crecont;
	}
	public String getAdate() {
		return adate;
	}
	public void setAdate(String adate) {
		this.adate = adate;
	}
	public int getBaNo() {
		return baNo;
	}
	public void setBaNo(int baNo) {
		this.baNo = baNo;
	}
	private String content;
    
    
    
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getAbNo() {
		return abNo;
	}
	public void setAbNo(int abNo) {
		this.abNo = abNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCate0() {
		return cate0;
	}
	public void setCate0(String cate0) {
		this.cate0 = cate0;
	}
	public String getaTitle() {
		return atitle;
	}
	public void setaTitle(String aTitle) {
		this.atitle = aTitle;
	}
	public String getaCont() {
		return acont;
	}
	public void setaCont(String aCont) {
		this.acont = aCont;
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
	public String getRecNo() {
		return recNo;
	}
	public void setRecNo(String recNo) {
		this.recNo = recNo;
	}
	public String getRevwFlg() {
		return revwFlg;
	}
	public void setRevwFlg(String revwFlg) {
		this.revwFlg = revwFlg;
	}
	public String getShowYN() {
		return showYN;
	}
	public void setShowYN(String showYN) {
		this.showYN = showYN;
	}
    
    public String getUstatus() {
		return ustatus;
	}
	public void setUstatus(String ustatus) {
		this.ustatus = ustatus;
	}
	public int getBancnt1() {
		return bancnt1;
	}
	public void setBancnt1(int bancnt1) {
		this.bancnt1 = bancnt1;
	}
	public int getBancnt2() {
		return bancnt2;
	}
	public void setBancnt2(int bancnt2) {
		this.bancnt2 = bancnt2;
	}

}
