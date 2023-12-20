package com.naver.erp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
 
@Service
@Transactional
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDAO adminDAO;
 
	
	// 학생
	@Override
	public int insertStuInfo(AdminDTO adminDTO)  throws Exception {
		int stuRegCnt  = 0;
		// insert 테이블이 여러 개 나오면 추후 더 추가
		stuRegCnt = this.adminDAO.insertStuInfo(adminDTO);
		
		return stuRegCnt;
	}


	@Override
	public int deleteStuInfo(String stu_no) {
		int deleteStuCnt = 0;
		// delete 테이블이 여러 개 나오면 추후 더 추가
		deleteStuCnt = this.adminDAO.deleteStuInfo(stu_no);
		
		return deleteStuCnt;
	}

	
	@Override
	public int updateStuInfo(String stu_no) {
		int updateStuCnt = 0;
		// update 테이블이 여러 개 나오면 추후 더 추가
		updateStuCnt = this.adminDAO.updateStuInfo( stu_no );
		
		return updateStuCnt;
	}

	
	// 강사
	@Override
	public int insertTeaInfo(AdminDTO adminDTO)  throws Exception {
		int teaRegCnt  = 0;
		// insert 테이블이 여러 개 나오면 추후 더 추가
		teaRegCnt = this.adminDAO.insertTeaInfo(adminDTO);
		
		return teaRegCnt;
	}


	@Override
	public int deleteTeaInfo(String tea_no) {
		int deleteTeaCnt = 0;
		// delete 테이블이 여러 개 나오면 추후 더 추가
		deleteTeaCnt = this.adminDAO.deleteTeaInfo(tea_no);
		
		return deleteTeaCnt;
	}

	
	@Override
	public int updateTeaInfo(String tea_no) {
		int updateTeaCnt = 0;
		// update 테이블이 여러 개 나오면 추후 더 추가
		updateTeaCnt = this.adminDAO.updateTeaInfo( tea_no );
		
		return updateTeaCnt;
	}

	
	// 수업
	@Override
	public int insertClassInfo(AdminDTO adminDTO)  throws Exception {
		int classRegCnt  = 0;
		// insert 테이블이 여러 개 나오면 추후 더 추가
		classRegCnt = this.adminDAO.insertClassInfo(adminDTO);
		
		return classRegCnt;
	}


	@Override
	public int deleteClassInfo(String class_no) {
		int deleteClassCnt = 0;
		// delete 테이블이 여러 개 나오면 추후 더 추가
		deleteClassCnt = this.adminDAO.deleteClassInfo(class_no);
		
		return deleteClassCnt;
	}

	
	@Override
	public int updateClassInfo(String class_no) {
		int updateClassCnt = 0;
		// update 테이블이 여러 개 나오면 추후 더 추가
		updateClassCnt = this.adminDAO.updateClassInfo( class_no );
		
		return updateClassCnt;
	}
}






















