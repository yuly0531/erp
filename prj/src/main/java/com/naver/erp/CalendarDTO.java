package com.naver.erp;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class CalendarDTO {
	
	private int att_id;
	private String stu_id;
	private String attend_date;
	
	@NotEmpty(message="출석여부는 필수 입력입니다.")
	@NotNull (message="출석여부는 필수 입력입니다.")
	private String attend_status;
	private String stu_name;
	private int id;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStu_name() {
		return stu_name;
	}
	public void setStu_name(String stu_name) {
		this.stu_name = stu_name;
	}
	
	
	
	
	public int getAtt_id() {
		return att_id;
	}
	public void setAtt_id(int att_id) {
		this.att_id = att_id;
	}
	public String getStu_id() {
		return stu_id;
	}
	public void setStu_id(String stu_id) {
		this.stu_id = stu_id;
	}
	public String getAttend_date() {
		return attend_date;
	}
	public void setAttend_date(String attend_date) {
		this.attend_date = attend_date;
	}
	public String getAttend_status() {
		return attend_status;
	}
	public void setAttend_status(String attend_status) {
		this.attend_status = attend_status;
	}
	
}
