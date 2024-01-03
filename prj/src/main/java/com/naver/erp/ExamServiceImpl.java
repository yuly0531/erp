package com.naver.erp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
 
@Service
@Transactional
public class ExamServiceImpl implements ExamService{
	@Autowired
	private ExamDAO examDAO;
 

	
	// 수업
	@Override
	public int insertExamInfo(ExamDTO examDTO)  throws Exception {
		int examRegCnt  = 0;
		// insert 테이블이 여러 개 나오면 추후 더 추가
		examRegCnt = this.examDAO.insertExamInfo(examDTO);
		
		return examRegCnt;
	}


	@Override
	public int deleteExamInfo(ExamDTO examDTO) {
		int deleteExamCnt = 0;
		// delete 테이블이 여러 개 나오면 추후 더 추가
		deleteExamCnt = this.examDAO.deleteExamInfo(examDTO);
		
		return deleteExamCnt;
	}

	
	@Override
	public int updateExamInfo(ExamDTO examDTO) {
		int updateExamCnt = 0;
		// update 테이블이 여러 개 나오면 추후 더 추가
		updateExamCnt = this.examDAO.updateExamInfo( examDTO );
		
		return updateExamCnt;
	}
}






















