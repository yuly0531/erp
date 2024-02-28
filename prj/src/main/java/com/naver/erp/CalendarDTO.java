package com.naver.erp;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class CalendarDTO {
	
	private int att_id;
	private String stu_id;
	private String attend_date;
	private String tea_id;
	private String tea_name;
	
	@NotEmpty(message="출석여부는 필수 입력입니다.")
	@NotNull (message="출석여부는 필수 입력입니다.")
	private String attend_status;
	private String stu_name;
	private String todayattend;
	private String totalday;
	private String remainday;
	private String class_id;
	private String class_name;
	private String class_start_date;
	private String class_end_date;
	private String today;
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
	
	
	
	
	public String getTea_name() {
		return tea_name;
	}
	public void setTea_name(String tea_name) {
		this.tea_name = tea_name;
	}
	public String getTea_id() {
		return tea_id;
	}
	public void setTea_id(String tea_id) {
		this.tea_id = tea_id;
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
	public String getTodayattend() {
		return todayattend;
	}
	
	public String getTotalday() {
		return totalday;
	}
	public void setTotalday(String totalday) {
		this.totalday = totalday;
	}
	public void setTodayattend(String todayattend) {
		this.todayattend = todayattend;
	}
	
	public String getRemainday() {
		return remainday;
	}
	public void setRemainday(String remainday) {
		this.remainday = remainday;
	}
	public String getClass_id() {
		return class_id;
	}
	public void setClass_id(String class_id) {
		this.class_id = class_id;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getClass_start_date() {
		return class_start_date;
	}
	public void setClass_start_date(String class_start_date) {
		this.class_start_date = class_start_date;
	}
	public String getClass_end_date() {
		return class_end_date;
	}
	public void setClass_end_date(String class_end_date) {
		this.class_end_date = class_end_date;
	}
	public String getToday() {
		return today;
	}
	public void setToday(String today) {
		this.today = today;
	}
	
}
