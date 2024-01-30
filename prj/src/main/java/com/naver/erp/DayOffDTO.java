package com.naver.erp;

import lombok.Data;

@Data
public class DayOffDTO {
	
		// 학생 결재 
		private String day_id;
		private String stu_id;
		private String application_date;
		private String dayoff_start;
		private String dayoff_end;
		private String payment_status;
		private String etc;
		private String dayoff_kind;
		private String stu_name;
		
		
		
		// 강사 결재
		private String tea_day_id;
		private String tea_id;
		private String tea_name;
		private String tea_application_date;
		private String tea_dayoff_start;
		private String tea_dayoff_end;
		private String tea_payment_status;
		private String tea_etc;
		private String tea_dayoff_kind;
		
		// 페이지
		private int selectPageNo;    
		private int rowCntPerPage;                       
		private int begin_rowNo;                           
		private int end_rowNo;
		
		 
		 // 결재 검색
		private String keyword1;
		private String keyword2;
		  
		private String payment;
		private String orand;
		private String min_start_date;
		private String max_start_date;
		private String min_end_date;
		private String max_end_date;
		   
		   
		public String getPayment() {
			return payment;
		}
		public void setPayment(String payment) {
			this.payment = payment;
		}
		public String getDay_id() {
			return day_id;
		}
		public void setDay_id(String day_id) {
			this.day_id = day_id;
		}
		public String getStu_id() {
			return stu_id;
		}
		public void setStu_id(String stu_id) {
			this.stu_id = stu_id;
		}
		public String getApplication_date() {
			return application_date;
		}
		public void setApplication_date(String application_date) {
			this.application_date = application_date;
		}
		public String getDayoff_start() {
			return dayoff_start;
		}
		public void setDayoff_start(String dayoff_start) {
			this.dayoff_start = dayoff_start;
		}
		public String getDayoff_end() {
			return dayoff_end;
		}
		public void setDayoff_end(String dayoff_end) {
			this.dayoff_end = dayoff_end;
		}
		public String getPayment_status() {
			return payment_status;
		}
		public void setPayment_status(String payment_status) {
			this.payment_status = payment_status;
		}
		public String getEtc() {
			return etc;
		}
		public void setEtc(String etc) {
			this.etc = etc;
		}
		public String getDayoff_kind() {
			return dayoff_kind;
		}
		public void setDayoff_kind(String dayoff_kind) {
			this.dayoff_kind = dayoff_kind;
		}
		public String getStu_name() {
			return stu_name;
		}
		public void setStu_name(String stu_name) {
			this.stu_name = stu_name;
		}
		public String getTea_day_id() {
			return tea_day_id;
		}
		public void setTea_day_id(String tea_day_id) {
			this.tea_day_id = tea_day_id;
		}
		public String getTea_id() {
			return tea_id;
		}
		public void setTea_id(String tea_id) {
			this.tea_id = tea_id;
		}
		public String getTea_name() {
			return tea_name;
		}
		public void setTea_name(String tea_name) {
			this.tea_name = tea_name;
		}
		public String getTea_application_date() {
			return tea_application_date;
		}
		public void setTea_application_date(String tea_application_date) {
			this.tea_application_date = tea_application_date;
		}
		public String getTea_dayoff_start() {
			return tea_dayoff_start;
		}
		public void setTea_dayoff_start(String tea_dayoff_start) {
			this.tea_dayoff_start = tea_dayoff_start;
		}
		public String getTea_dayoff_end() {
			return tea_dayoff_end;
		}
		public void setTea_dayoff_end(String tea_dayoff_end) {
			this.tea_dayoff_end = tea_dayoff_end;
		}
		public String getTea_payment_status() {
			return tea_payment_status;
		}
		public void setTea_payment_status(String tea_payment_status) {
			this.tea_payment_status = tea_payment_status;
		}
		public String getTea_etc() {
			return tea_etc;
		}
		public void setTea_etc(String tea_etc) {
			this.tea_etc = tea_etc;
		}
		public String getTea_dayoff_kind() {
			return tea_dayoff_kind;
		}
		public void setTea_dayoff_kind(String tea_dayoff_kind) {
			this.tea_dayoff_kind = tea_dayoff_kind;
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
