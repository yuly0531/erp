package com.naver.erp;

import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
 
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
   
   // 강사 등록, 수정, 삭제 -------------------------
   private String tea_id;
   private String tea_pwd;
   private String rePwd;
   private String tea_name;
   private String tea_jumin_num1;
   private String tea_jumin_num2;
   private String tea_phone;
   private String tea_emergency_name;
   private String tea_emergency_relation;
   private String tea_emergency_phone;
   private String past_company_name;
   private String salary;
   private String hire_date;
   private String fire_date;
   private String tea_joinClass;
   private String tea_etc;
   // -----------------------------------------

   // 강사 검색 ----------------------------------
   private String min_career;
   private String max_career;
   // -----------------------------------------
   
   // 수업 -------------------------------------
   private String class_id;
   
   /* 
   @Size(max=30, message="수업명은 2~30자 입니다.")
   @Pattern(regexp="^[^ ]{2,30}$",message="수업명은 2~30자 이고 <또는>단어가 들어갈수 없습니다.재입력 요망")*/
   private String class_name;
   
   /*@NotEmpty(message="개강일은 필수 입력입니다.")
   @NotNull (message="개강일은 필수 입력입니다.")*/
   private String class_start_date;

   /*@NotEmpty(message="종강일은 필수 입력입니다.")
   @NotNull (message="종강일은 필수 입력입니다.")*/
   private String class_end_date;

   /*@NotEmpty(message="담당 감사명은 필수 입력입니다.")
   @NotNull (message="담당 감사명은 필수 입력입니다.")*/
   private String take_charge_tea;

   /*@NotEmpty(message="수업내용은 필수 입력입니다.")
   @NotNull (message="수업내용은 필수 입력입니다.")
   @NotBlank(message="공백으로 구성되면 안됩니다.")
   @Size(min=1, max=500, message="수업내용은 1~500자 입니다.")	
   @Pattern(regexp="^[^><]{1,500}$", 
   message="수업 내용은 1~500자 이고 <또는>단어가 들어갈수 없습니다.재입력 요망")*/
   private String class_subject;
   private List<String> join_id;
   
   // 수업 검색 ---------------------------------
   private String keyword1;
   private String keyword2;
   private String keywordS;
   private String keywordE;
   private String orand;
   private String min_start_date;
   private String max_start_date;
   private String min_end_date;
   private String max_end_date;
   
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
   
   public List<String> getJoin_id() {
	return join_id;
}
public void setJoin_id(List<String> join_id) {
	this.join_id = join_id;
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
   
   
   public String getTea_id() {
      return tea_id;
   }
   public void setTea_id(String tea_id) {
      this.tea_id = tea_id;
   }
   public String getTea_pwd() {
      return tea_pwd;
   }
   public void setTea_pwd(String tea_pwd) {
      this.tea_pwd = tea_pwd;
   }
   public String getRePwd() {
      return rePwd;
   }
   public void setRePwd(String rePwd) {
      this.rePwd = rePwd;
   }
   public String getTea_name() {
      return tea_name;
   }
   public void setTea_name(String tea_name) {
      this.tea_name = tea_name;
   }
   public String getTea_jumin_num1() {
      return tea_jumin_num1;
   }
   public void setTea_jumin_num1(String tea_jumin_num1) {
      this.tea_jumin_num1 = tea_jumin_num1;
   }
   public String getTea_jumin_num2() {
      return tea_jumin_num2;
   }
   public void setTea_jumin_num2(String tea_jumin_num2) {
      this.tea_jumin_num2 = tea_jumin_num2;
   }
   public String getTea_phone() {
      return tea_phone;
   }
   public void setTea_phone(String tea_phone) {
      this.tea_phone = tea_phone;
   }
   public String getTea_emergency_name() {
      return tea_emergency_name;
   }
   public void setTea_emergency_name(String tea_emergency_name) {
      this.tea_emergency_name = tea_emergency_name;
   }
   public String getTea_emergency_relation() {
      return tea_emergency_relation;
   }
   public void setTea_emergency_relation(String tea_emergency_relation) {
      this.tea_emergency_relation = tea_emergency_relation;
   }
   public String getTea_emergency_phone() {
      return tea_emergency_phone;
   }
   public void setTea_emergency_phone(String tea_emergency_phone) {
      this.tea_emergency_phone = tea_emergency_phone;
   }
   public String getPast_company_name() {
      return past_company_name;
   }
   public void setPast_company_name(String past_company_name) {
      this.past_company_name = past_company_name;
   }
   public String getSalary() {
      return salary;
   }
   public void setSalary(String salary) {
      this.salary = salary;
   }
   public String getHire_date() {
      return hire_date;
   }
   public void setHire_date(String hire_date) {
      this.hire_date = hire_date;
   }
   public String getFire_date() {
      return fire_date;
   }
   public void setFire_date(String fire_date) {
      this.fire_date = fire_date;
   }
   public String getTea_joinClass() {
      return tea_joinClass;
   }
   public void setTea_joinClass(String tea_joinClass) {
      this.tea_joinClass = tea_joinClass;
   }
   public String getTea_etc() {
      return tea_etc;
   }
   public void setTea_etc(String tea_etc) {
      this.tea_etc = tea_etc;
   }
	   
	public String getMin_career() {
		return min_career;
	}
	public void setMin_career(String min_career) {
		this.min_career = min_career;
	}
	public String getMax_career() {
		return max_career;
	}
	public void setMax_career(String max_career) {
		this.max_career = max_career;
	}
	public String getKeyword1() {
		return keyword1;
	}
	public void setKeyword1(String keyword1) {
		this.keyword1 = keyword1;
	}
	public String getKeyword2() {
		return keyword2;
	}
	public void setKeyword2(String keyword2) {
		this.keyword2 = keyword2;
	}
	
	public String getKeywordS() {
		return keywordS;
	}
	public void setKeywordS(String keywordS) {
		System.out.println(keywordS+"keywordS");
		this.keywordS = keywordS;
	}
	public String getKeywordE() {
		return keywordE;
	}
	public void setKeywordE(String keywordE) {
		this.keywordE = keywordE;
	}
	public String getOrand() {
		return orand;
	}
	public void setOrand(String orand) {
		this.orand = orand;
	}
	public String getMin_start_date() {
		return min_start_date;
	}
	public void setMin_start_date(String min_start_date) {
		this.min_start_date = min_start_date;
	}
	public String getMax_start_date() {
		return max_start_date;
	}
	public void setMax_start_date(String max_start_date) {
		this.max_start_date = max_start_date;
	}
	public String getMin_end_date() {
		return min_end_date;
	}
	public void setMin_end_date(String min_end_date) {
		this.min_end_date = min_end_date;
	}
	public String getMax_end_date() {
		return max_end_date;
	}
	public void setMax_end_date(String max_end_date) {
		this.max_end_date = max_end_date;
	} 

   
}