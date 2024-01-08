package com.naver.erp;

import java.util.List;
 
public class ExamDTO {

   // 시험 -------------------------------------
   private String exam_id;
   private String exam_name;
   private String exam_date;
   private String tea_id;
   private String exam_no;
   private String exam_question1;
   private String exam_question2;
   private String exam_question3;
   private String exam_question4;
   private String exam_question5;
   private String exam_question6;
   private String exam_question7;
   private String exam_question8;
   private String exam_question9;
   private String exam_question10;
   private String exam_answer1;
   private String exam_answer2;
   private String exam_answer3;
   private String exam_answer4;
   private String exam_answer5;
   private String exam_answer6;
   private String exam_answer7;
   private String exam_answer8;
   private String exam_answer9;
   private String exam_answer10;
   private String exam_sequence;
   private String stu_id;
   private String score;
   // -----------------------------------------
   // 페이지 ------------------------------------
   private int selectPageNo;                              
   private int rowCntPerPage;                       
   private int begin_rowNo;                           
   private int end_rowNo;
   // -----------------------------------------
public String getExam_id() {
	return exam_id;
}
public void setExam_id(String exam_id) {
	System.out.println(exam_id);
	this.exam_id = exam_id;
}
public String getExam_name() {
	return exam_name;
}
public void setExam_name(String exam_name) {
	System.out.println(exam_name);
	this.exam_name = exam_name;
}
public String getExam_date() {
	return exam_date;
}
public void setExam_date(String exam_date) {
	System.out.println(exam_date);
	this.exam_date = exam_date;
}
public String getTea_id() {
	return tea_id;
}
public void setTea_id(String tea_id) {
	System.out.println(tea_id);
	this.tea_id = tea_id;
}
public String getExam_no() {
	return exam_no;
}
public void setExam_no(String exam_no) {
	System.out.println(exam_no);
	this.exam_no = exam_no;
}
public String getExam_question1() {
	return exam_question1;
}
public void setExam_question1(String exam_question1) {
	System.out.println(exam_question1);
	this.exam_question1 = exam_question1;
}
public String getExam_question2() {
	return exam_question2;
}
public void setExam_question2(String exam_question2) {
	System.out.println(exam_question2);
	this.exam_question2 = exam_question2;
}
public String getExam_question3() {
	return exam_question3;
}
public void setExam_question3(String exam_question3) {
	System.out.println(exam_question3);
	this.exam_question3 = exam_question3;
}
public String getExam_question4() {
	return exam_question4;
}
public void setExam_question4(String exam_question4) {
	System.out.println(exam_question4);
	this.exam_question4 = exam_question4;
}
public String getExam_question5() {
	return exam_question5;
}
public void setExam_question5(String exam_question5) {
	System.out.println(exam_question5);
	this.exam_question5 = exam_question5;
}
public String getExam_question6() {
	return exam_question6;
}
public void setExam_question6(String exam_question6) {
	System.out.println(exam_question6);
	this.exam_question6 = exam_question6;
}
public String getExam_question7() {
	return exam_question7;
}
public void setExam_question7(String exam_question7) {
	System.out.println(exam_question7);
	this.exam_question7 = exam_question7;
}
public String getExam_question8() {
	return exam_question8;
}
public void setExam_question8(String exam_question8) {
	System.out.println(exam_question8);
	this.exam_question8 = exam_question8;
}
public String getExam_question9() {
	return exam_question9;
}
public void setExam_question9(String exam_question9) {
	System.out.println(exam_question9);
	this.exam_question9 = exam_question9;
}
public String getExam_question10() {
	return exam_question10;
}
public void setExam_question10(String exam_question10) {
	System.out.println(exam_question10);
	this.exam_question10 = exam_question10;
}
public String getExam_answer1() {
	return exam_answer1;
}
public void setExam_answer1(String exam_answer1) {
	System.out.println(exam_answer1);
	this.exam_answer1 = exam_answer1;
}
public String getExam_answer2() {
	return exam_answer2;
}
public void setExam_answer2(String exam_answer2) {
	System.out.println(exam_answer2);
	this.exam_answer2 = exam_answer2;
}
public String getExam_answer3() {
	return exam_answer3;
}
public void setExam_answer3(String exam_answer3) {
	System.out.println(exam_answer3);
	this.exam_answer3 = exam_answer3;
}
public String getExam_answer4() {
	return exam_answer4;
}
public void setExam_answer4(String exam_answer4) {
	System.out.println(exam_answer4);
	this.exam_answer4 = exam_answer4;
}
public String getExam_answer5() {
	return exam_answer5;
}
public void setExam_answer5(String exam_answer5) {
	System.out.println(exam_answer5);
	this.exam_answer5 = exam_answer5;
}
public String getExam_answer6() {
	return exam_answer6;
}
public void setExam_answer6(String exam_answer6) {
	System.out.println(exam_answer6);
	this.exam_answer6 = exam_answer6;
}
public String getExam_answer7() {
	return exam_answer7;
}
public void setExam_answer7(String exam_answer7) {
	System.out.println(exam_answer7);
	this.exam_answer7 = exam_answer7;
}
public String getExam_answer8() {
	return exam_answer8;
}
public void setExam_answer8(String exam_answer8) {
	System.out.println(exam_answer8);
	this.exam_answer8 = exam_answer8;
}
public String getExam_answer9() {
	return exam_answer9;
}
public void setExam_answer9(String exam_answer9) {
	System.out.println(exam_answer9);
	this.exam_answer9 = exam_answer9;
}
public String getExam_answer10() {
	return exam_answer10;
}
public void setExam_answer10(String exam_answer10) {
	System.out.println(exam_answer10);
	this.exam_answer10 = exam_answer10;
}
public String getExam_sequence() {
	return exam_sequence;
}
public void setExam_sequence(String exam_sequence) {
	System.out.println(exam_sequence);
	this.exam_sequence = exam_sequence;
}
public String getStu_id() {
	return stu_id;
}
public void setStu_id(String stu_id) {
	this.stu_id = stu_id;
}
public String getScore() {
	return score;
}
public void setScore(String score) {
	this.score = score;
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