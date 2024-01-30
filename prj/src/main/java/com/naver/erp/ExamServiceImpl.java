package com.naver.erp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
 
@Service
@Transactional
public class ExamServiceImpl implements ExamService{
	@Autowired
	private ExamDAO examDAO;
 
	
	// 시험
	@Override
	public int insertExamInfo(ExamDTO examDTO)  throws Exception {
		int examRegCnt  = 0;
		examRegCnt = this.examDAO.insertExamInfo(examDTO);
		examRegCnt = this.examDAO.examproblem(examDTO);
		return examRegCnt;
	}
	
	@Override
	public int insertExamScore(ExamDTO examDTO)  throws Exception {
		int examScoreRegCnt  = 0;
		examScoreRegCnt = this.examDAO.insertExamScore(examDTO);
		return examScoreRegCnt;
	}
	

	@Override
	   public int deleteExamInfo(ExamDTO examDTO) {
	      int deleteExamCnt = 0;
	      deleteExamCnt = this.examDAO.deleteExamproblem(examDTO);
	      deleteExamCnt = this.examDAO.deleteExamInfo(examDTO);
	      return deleteExamCnt;
	   }

	
	@Override
	public int updateExamInfo(ExamDTO examDTO) {
		int updateExamCnt = 0;
		updateExamCnt = this.examDAO.updateExamInfo( examDTO );
		updateExamCnt = this.examDAO.updateExamproblem1( examDTO );
		updateExamCnt = this.examDAO.updateExamproblem2( examDTO );
		updateExamCnt = this.examDAO.updateExamproblem3( examDTO );
		updateExamCnt = this.examDAO.updateExamproblem4( examDTO );
		updateExamCnt = this.examDAO.updateExamproblem5( examDTO );
		updateExamCnt = this.examDAO.updateExamproblem6( examDTO );
		updateExamCnt = this.examDAO.updateExamproblem7( examDTO );
		updateExamCnt = this.examDAO.updateExamproblem8( examDTO );
		updateExamCnt = this.examDAO.updateExamproblem9( examDTO );
		updateExamCnt = this.examDAO.updateExamproblem10( examDTO );
		
		return updateExamCnt;
	}
}






















