package com.naver.erp;

import lombok.Data;

@Data
public class DayOffDTO {
	
	//학생 결재 
	private String DAY_ID;
	private String STU_ID;
	private String APPLICATION_DATE;
	private String DAYOFF_START;
	private String DAYOFF_END;
	private String PAYMENT_STATUS;
	private String ETC;
	private String DAYOFF_KIND;
	private String stu_name;
	
	
	
	//선생 결재
	private String TEA_DAY_ID;
	private String TEA_ID;
	private String tea_name;
	private String TEA_APPLICATION_DATE;
	private String TEA_DAYOFF_START;
	private String TEA_DAYOFF_END;
	private String TEA_PAYMENT_STATUS;
	private String TEA_ETC;
	private String TEA_DAYOFF_KIND;
	
	//페이지
	 private int selectPageNo;    
	 private int rowCntPerPage;                       
	 private int begin_rowNo;                           
	 private int end_rowNo;
	
	 
	 //결재 검색
	 private String keyword1;
	   private String keyword2;
	   private String keywordS;
	   private String keywordE;
	   private String orand;
	   private String min_start_date;
	   private String max_start_date;
	   private String min_end_date;
	   private String max_end_date;
	
	   
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
	   public String getDAYOFF_KIND() {
			return DAYOFF_KIND;
		}
		public void setDAYOFF_KIND(String dAYOFF_KIND) {
			DAYOFF_KIND = dAYOFF_KIND;
		}
		public String getTEA_DAYOFF_KIND() {
			return TEA_DAYOFF_KIND;
		}
		public void setTEA_DAYOFF_KIND(String tEA_DAYOFF_KIND) {
			TEA_DAYOFF_KIND = tEA_DAYOFF_KIND;
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
	public String getKeywordS() {
		return keywordS;
	}
	public void setKeywordS(String keywordS) {
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
	
	public String getTEA_DAY_ID() {
		return TEA_DAY_ID;
	}
	public void setTEA_DAY_ID(String tEA_DAY_ID) {
		TEA_DAY_ID = tEA_DAY_ID;
	}
	public String getTEA_ID() {
		return TEA_ID;
	}
	public void setTEA_ID(String tEA_ID) {
		TEA_ID = tEA_ID;
	}
	public String getTEA_APPLICATION_DATE() {
		return TEA_APPLICATION_DATE;
	}
	public void setTEA_APPLICATION_DATE(String tEA_APPLICATION_DATE) {
		TEA_APPLICATION_DATE = tEA_APPLICATION_DATE;
	}
	public String getTEA_DAYOFF_START() {
		return TEA_DAYOFF_START;
	}
	public void setTEA_DAYOFF_START(String tEA_DAYOFF_START) {
		TEA_DAYOFF_START = tEA_DAYOFF_START;
	}
	public String getTEA_DAYOFF_END() {
		return TEA_DAYOFF_END;
	}
	public void setTEA_DAYOFF_END(String tEA_DAYOFF_END) {
		TEA_DAYOFF_END = tEA_DAYOFF_END;
	}
	public String getTEA_PAYMENT_STATUS() {
		return TEA_PAYMENT_STATUS;
	}
	public void setTEA_PAYMENT_STATUS(String tEA_PAYMENT_STATUS) {
		TEA_PAYMENT_STATUS = tEA_PAYMENT_STATUS;
	}
	public String getTEA_ETC() {
		return TEA_ETC;
	}
	public void setTEA_ETC(String tEA_ETC) {
		TEA_ETC = tEA_ETC;
	}
	
	
	public String getDAY_ID() {
		return DAY_ID;
	}
	public void setDAY_ID(String dAY_ID) {
		DAY_ID = dAY_ID;
	}
	public String getSTU_ID() {
		return STU_ID;
	}
	public void setSTU_ID(String sTU_ID) {
		STU_ID = sTU_ID;
	}
	public String getAPPLICATION_DATE() {
		return APPLICATION_DATE;
	}
	public void setAPPLICATION_DATE(String aPPLICATION_DATE) {
		APPLICATION_DATE = aPPLICATION_DATE;
	}
	public String getDAYOFF_START() {
		return DAYOFF_START;
	}
	public void setDAYOFF_START(String dAYOFF_START) {
		DAYOFF_START = dAYOFF_START;
	}
	public String getDAYOFF_END() {
		return DAYOFF_END;
	}
	public void setDAYOFF_END(String dAYOFF_END) {
		DAYOFF_END = dAYOFF_END;
	}
	public String getPAYMENT_STATUS() {
		return PAYMENT_STATUS;
	}
	public void setPAYMENT_STATUS(String pAYMENT_STATUS) {
		PAYMENT_STATUS = pAYMENT_STATUS;
	}
	public String getETC() {
		return ETC;
	}
	public void setETC(String eTC) {
		ETC = eTC;
	}
	
	
	
}
