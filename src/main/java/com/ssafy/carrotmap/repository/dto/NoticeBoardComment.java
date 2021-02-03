package com.ssafy.carrotmap.repository.dto;

import java.util.List;

public class NoticeBoardComment {
	private int no;
	private String comment;
	private int noticeNo;
	private int classNo;
	private int groupNo;
	private String memberId;
	private String writeDate;
	private List<NoticeBoardComment> list;
	
	public List<NoticeBoardComment> getList() {
		return list;
	}
	public void setList(List<NoticeBoardComment> list) {
		this.list = list;
	}
	@Override
	public String toString() {
		return "NoticeBoardComment [no=" + no + ", comment=" + comment + ", noticeNo=" + noticeNo + ", classNo="
				+ classNo + ", groupNo=" + groupNo + ", memberId=" + memberId + ", writeDate=" + writeDate + "]";
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public int getClassNo() {
		return classNo;
	}
	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	

}
