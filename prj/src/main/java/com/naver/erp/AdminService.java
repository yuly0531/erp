package com.naver.erp;
 
public interface AdminService {
	// 학생
	int insertStuInfo(AdminDTO adminDTO)  throws Exception;
	int deleteStuInfo(String stu_no) throws Exception;
	int updateStuInfo(String stu_no) throws Exception;

	// 강사
	int insertTeaInfo(AdminDTO adminDTO)  throws Exception;
	int deleteTeaInfo(String tea_no) throws Exception;
	int updateTeaInfo(String tea_no) throws Exception;

	// 수업
	int insertClassInfo(AdminDTO adminDTO)  throws Exception;
	int deleteClassInfo(String class_no) throws Exception;
	int updateClassInfo(String class_no) throws Exception;
}









