package com.ssafy.carrotmap.repository.dto;

public class UserboardDislike {
	private int no;
	private String userId;
	private int userboardNo;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getUserboardNo() {
		return userboardNo;
	}
	public void setUserboardNo(int userboardNo) {
		this.userboardNo = userboardNo;
	}
	@Override
	public String toString() {
		return "UserboardDislike [no=" + no + ", userId=" + userId + ", userboardNo=" + userboardNo + "]";
	}
	
	
}
