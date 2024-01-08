package com.naver.erp;

import lombok.Data;

@Data
public class CalendarDTO {
	private String att_id;
	private String stu_id;
	private String attend_date;
	private String attend_status;
	private String stu_name;
	
	
	public String getAtt_id() {
		return att_id;
	}
	public void setAtt_id(String att_id) {
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
