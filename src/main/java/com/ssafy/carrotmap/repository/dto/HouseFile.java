package com.ssafy.carrotmap.repository.dto;

public class HouseFile {
	private int fileNo;
	private int no;
	private String filePath; 
	private String orgFileName; 
	private String systemName; 
	private int fileSize;
	private String fileType;
	
	@Override
	public String toString() {
		return "HouseFile [fileNo=" + fileNo + ", no=" + no + ", filePath=" + filePath + ", orgFileName=" + orgFileName
				+ ", systemName=" + systemName + ", fileSize=" + fileSize + ", fileType=" + fileType + "]";
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getOrgFileName() {
		return orgFileName;
	}
	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}
	public String getSystemName() {
		return systemName;
	}
	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
}
