package com.mini.model;
import lombok.Data;

public class User {
    private String id;
    private String passwd;
    private String name;
    private String nick;
    private String gender;
    private String birth;
    private String phone;
    private String email;
    private String addr;
    private String grade;
    private String cgrade;
    private String point;
    private String bancnt1;
    private String bancnt2;
    private String pwcont;
    private String auth1Yn;
    private String auth2Yn;
    private String creaflg;
    private String adminflg;
    private String ustatus;
    private String cdate;
    
    public String getUstatus() {
		return ustatus;
	}
	public void setUstatus(String ustatus) {
		this.ustatus = ustatus;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getPasswd() {
        return passwd;
    }
    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getNick() {
        return nick;
    }
    public void setNick(String nick) {
        this.nick = nick;
    }
    public String getGender() {
        return gender;
    }
    public void setGender(String gender) {
        this.gender = gender;
    }
    public String getBirth() {
        return birth;
    }
    public void setBirth(String birth) {
        this.birth = birth;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getAddr() {
        return addr;
    }
    public void setAddr(String addr) {
        this.addr = addr;
    }
    public String getGrade() {
        return grade;
    }
    public void setGrade(String grade) {
        this.grade = grade;
    }
    public String getCgrade() {
        return cgrade;
    }
    public void setCgrade(String cgrade) {
        this.cgrade = cgrade;
    }
    public String getPoint() {
        return point;
    }
    public void setPoint(String point) {
        this.point = point;
    }
    public String getBancnt1() {
        return bancnt1;
    }
    public void setBancnt1(String bancnt1) {
        this.bancnt1 = bancnt1;
    }
    public String getBancnt2() {
        return bancnt2;
    }
    public void setBancnt2(String bancnt2) {
        this.bancnt2 = bancnt2;
    }
    public String getPwcont() {
        return pwcont;
    }
    public void setPwcont(String pwcont) {
        this.pwcont = pwcont;
    }
    public String getAuth1Yn() {
        return auth1Yn;
    }
    public void setAuth1Yn(String auth1Yn) {
        this.auth1Yn = auth1Yn;
    }
    public String getAuth2Yn() {
        return auth2Yn;
    }
    public void setAuth2Yn(String auth2Yn) {
        this.auth2Yn = auth2Yn;
    }
    public String getCreaflg() {
        return creaflg;
    }
    public void setCreaflg(String creaflg) {
        this.creaflg = creaflg;
    }
    public String getAdminflg() {
        return adminflg;
    }
    public void setAdminflg(String adminflg) {
        this.adminflg = adminflg;
    }

}
