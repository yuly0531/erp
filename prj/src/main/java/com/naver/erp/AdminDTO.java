package com.naver.erp;

import java.util.List;
 
public class AdminDTO {
	// 추후 JSP 구현되면 추가
	private String id;
	
	// 학생 등록, 수정, 삭제--------------------------
	private String pwd;
	private String name;
	private String jumin_num1;
	private String jumin_num2;
	private String phone;
	private String emergency_name;
	private String emergency_relation;
	private String emergency_phone;
	private String joinClass;
	private String etc;
	// -----------------------------------------
	
	// 학생 검색 ----------------------------------
	private List<String> gender;
	private String min_regist_date;
	private String max_regist_date;
	private String min_age;
	private String max_age;
	// -----------------------------------------
	
	
	// 수업 -------------------------------------
	private String class_name;
	private String class_start_date;
	private String class_end_date;
	private String take_charge_tea;
	private String class_subject;
	// -----------------------------------------
	// 페이지 ------------------------------------
	private int selectPageNo;  									 
	private int rowCntPerPage; 							 
	private int begin_rowNo;  								 
	private int end_rowNo;
	// -----------------------------------------
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJumin_num1() {
		return jumin_num1;
	}
	public void setJumin_num1(String jumin_num1) {
		this.jumin_num1 = jumin_num1;
	}
	public String getJumin_num2() {
		return jumin_num2;
	}
	public void setJumin_num2(String jumin_num2) {
		this.jumin_num2 = jumin_num2;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmergency_name() {
		return emergency_name;
	}
	public void setEmergency_name(String emergency_name) {
		this.emergency_name = emergency_name;
	}
	public String getEmergency_relation() {
		return emergency_relation;
	}
	public void setEmergency_relation(String emergency_relation) {
		this.emergency_relation = emergency_relation;
	}
	public String getEmergency_phone() {
		return emergency_phone;
	}
	public void setEmergency_phone(String emergency_phone) {
		this.emergency_phone = emergency_phone;
	}
	public String getJoinClass() {
		return joinClass;
	}
	public void setJoinClass(String joinClass) {
		this.joinClass = joinClass;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public List<String> getGender() {
		return gender;
	}
	public void setGender(List<String> gender) {
		System.out.println(gender);
		this.gender = gender;
	}
	public String getMin_regist_date() {
		return min_regist_date;
	}
	public void setMin_regist_date(String min_regist_date) {
		this.min_regist_date = min_regist_date;
	}
	public String getMax_regist_date() {
		return max_regist_date;
	}
	public void setMax_regist_date(String max_regist_date) {
		this.max_regist_date = max_regist_date;
	}
	public String getMin_age() {
		return min_age;
	}
	public void setMin_age(String min_age) {
		this.min_age = min_age;
	}
	public String getMax_age() {
		return max_age;
	}
	public void setMax_age(String max_age) {
		this.max_age = max_age;
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
	public String getTake_charge_tea() {
		return take_charge_tea;
	}
	public void setTake_charge_tea(String take_charge_tea) {
		this.take_charge_tea = take_charge_tea;
	}
	public String getClass_subject() {
		return class_subject;
	}
	public void setClass_subject(String class_subject) {
		this.class_subject = class_subject;
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
