package com.ssafy.carrotmap.repository.dto;

public class User {
	private int no;
	private String id;
	private String pw;
	private String kakaoToken;
	private String facebookToken;
	private String googleToken;
	private String name;
	private String email;
	private String gender;
	private String phone;
	private String birthday;
	private int grade;
	private String banDate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getKakaoToken() {
		return kakaoToken;
	}
	public void setKakaoToken(String kakaoToken) {
		this.kakaoToken = kakaoToken;
	}
	public String getFacebookToken() {
		return facebookToken;
	}
	public void setFacebookToken(String facebookToken) {
		this.facebookToken = facebookToken;
	}
	public String getGoogleToken() {
		return googleToken;
	}
	public void setGoogleToken(String googleToken) {
		this.googleToken = googleToken;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getBanDate() {
		return banDate;
	}
	public void setBanDate(String banDate) {
		this.banDate = banDate;
	}
	@Override
	public String toString() {
		return "User [no=" + no + ", id=" + id + ", pw=" + pw + ", kakaoToken=" + kakaoToken + ", facebookToken="
				+ facebookToken + ", googleToken=" + googleToken + ", name=" + name + ", email=" + email + ", gender="
				+ gender + ", phone=" + phone + ", birthday=" + birthday + ", grade=" + grade + ", banDate=" + banDate
				+ "]";
	}
	
}
