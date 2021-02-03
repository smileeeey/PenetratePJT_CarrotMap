package com.ssafy.carrotmap.repository.dto;

public class BoardSearchType {

	private String boardType;
	private String searchWord;
	private String searchCondition;
	private int startIndex;
	private int cntPerPage;
	

	@Override
	public String toString() {
		return "BoardSearchType [boardType=" + boardType + ", searchWord=" + searchWord + ", searchCondition="
				+ searchCondition + ", startIndex=" + startIndex + ", cntPerPage=" + cntPerPage + "]";
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	
}
