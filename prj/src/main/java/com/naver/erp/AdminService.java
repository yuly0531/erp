package com.naver.erp;
 
public interface AdminService {
	// 학생
	int insertStuInfo(AdminDTO adminDTO)  throws Exception;
	int deleteStuInfo(AdminDTO adminDTO) throws Exception;
	int updateStuInfo(AdminDTO adminDTO) throws Exception;

	// 강사
	int insertTeaInfo(AdminDTO adminDTO)  throws Exception;
	int deleteTeaInfo(String id) throws Exception;
	int updateTeaInfo(String id) throws Exception;

	// 수업
	int insertClassInfo(AdminDTO adminDTO)  throws Exception;
	int deleteClassInfo(String id) throws Exception;
	int updateClassInfo(String id) throws Exception;
}









