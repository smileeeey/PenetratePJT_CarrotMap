package com.ssafy.carrotmap.repository.dto;

public class Like {
	private int no;
	private String id;
	public int getNo() {
		return no;
	}
	public Like(int no, String id) {
		super();
		this.no = no;
		this.id = id;
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
	
	
}
