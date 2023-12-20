package com.naver.erp;

import java.util.List;
 
public class AdminDTO {
	// 추후 JSP 구현되면 추가
	private String stu_no;
	private String tea_no;
	private String class_no;
	private int selectPageNo;  									 
	private int rowCntPerPage; 							 
	private int begin_rowNo;  								 
	private int end_rowNo;
	
	
	public String getStu_no() {
		return stu_no;
	}
	public void setStu_no(String stu_no) {
		this.stu_no = stu_no;
	}
	public String getTea_no() {
		return tea_no;
	}
	public void setTea_no(String tea_no) {
		this.tea_no = tea_no;
	}
	public String getClass_no() {
		return class_no;
	}
	public void setClass_no(String class_no) {
		this.class_no = class_no;
	}
	public int getSelectPageNo() {
		return selectPageNo;
	}
	public void setSelectPageNo(int selectPageNo) {
		this.selectPageNo = selectPageNo;
	}
	public int getRowCntPerPage() {
		return rowCntPerPage;
	}
	public void setRowCntPerPage(int rowCntPerPage) {
		this.rowCntPerPage = rowCntPerPage;
	}
	public int getBegin_rowNo() {
		return begin_rowNo;
	}
	public void setBegin_rowNo(int begin_rowNo) {
		this.begin_rowNo = begin_rowNo;
	}
	public int getEnd_rowNo() {
		return end_rowNo;
	}
	public void setEnd_rowNo(int end_rowNo) {
		this.end_rowNo = end_rowNo;
	}   
}
