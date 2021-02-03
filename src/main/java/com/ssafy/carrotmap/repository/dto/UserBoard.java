package com.ssafy.carrotmap.repository.dto;

import java.util.List;

public class UserBoard {

	private int no;
	private String title;
	private String userId;
	private String content;
	private int importance;
	private String regTime;
	private String updateTime;
	private int viewCnt;
	@Override
	public String toString() {
		return "UserBoard [no=" + no + ", title=" + title + ", userId=" + userId + ", content=" + content
				+ ", importance=" + importance + ", regTime=" + regTime + ", updateTime=" + updateTime + ", viewCnt="
				+ viewCnt + ", category=" + category + "]";
	}
	private List<String> category;
	
	
	public List<String> getCategory() {
		return category;
	}
	public void setCategory(List<String> category) {
		this.category = category;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getImportance() {
		return importance;
	}
	public void setImportance(int importance) {
		this.importance = importance;
	}
	public String getRegTime() {
		return regTime;
	}
	public void setRegTime(String regTime) {
		this.regTime = regTime;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	}
