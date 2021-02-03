package com.ssafy.carrotmap.repository.dto;

import java.util.List;

public class UserBoardComment {

	private int no;
	private String comment;
	private int boardNo;
	private int classNo;
	private int groupNo;
	private String memberId;
	private String writeDate;
	private List<UserBoardComment> list;
	
	@Override
	public String toString() {
		return "UserBoardComment [no=" + no + ", comment=" + comment + ", boardNo=" + boardNo + ", classNo=" + classNo
				+ ", groupNo=" + groupNo + ", memberId=" + memberId + ", writeDate=" + writeDate + ", list=" + list
				+ "]";
	}
	public List<UserBoardComment> getList() {
		return list;
	}
	public void setList(List<UserBoardComment> list) {
		this.list = list;
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
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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
