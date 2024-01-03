package com.naver.erp;
 
public interface AdminService {
	// 학생
	int insertStuInfo(AdminDTO adminDTO)  throws Exception;
	int deleteStuInfo(AdminDTO adminDTO) throws Exception;
	int updateStuInfo(AdminDTO adminDTO) throws Exception;

	// 강사
	int insertTeaInfo(AdminDTO adminDTO)  throws Exception;
	int deleteTeaInfo(AdminDTO adminDTO) throws Exception;
	int updateTeaInfo(AdminDTO adminDTO) throws Exception;

	// 수업
	int insertClassInfo(AdminDTO adminDTO)  throws Exception;
	int deleteClassInfo(AdminDTO adminDTO) throws Exception;
	int updateClassInfo(AdminDTO adminDTO) throws Exception;
}









