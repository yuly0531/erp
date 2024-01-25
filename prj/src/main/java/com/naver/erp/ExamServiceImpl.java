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
		// insert 테이블이 여러 개 나오면 추후 더 추가
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
	      // delete 테이블이 여러 개 나오면 추후 더 추가
	      deleteExamCnt = this.examDAO.deleteExamproblem(examDTO);
	      deleteExamCnt = this.examDAO.deleteExamInfo(examDTO);
	      return deleteExamCnt;
	   }

	
	@Override
	public int updateExamInfo(ExamDTO examDTO) {
		int updateExamCnt = 0;
		// update 테이블이 여러 개 나오면 추후 더 추가
		System.out.println(0);
		updateExamCnt = this.examDAO.updateExamInfo( examDTO );
		System.out.println(1);
		updateExamCnt = this.examDAO.updateExamproblem1( examDTO );
		System.out.println(2);
		updateExamCnt = this.examDAO.updateExamproblem2( examDTO );
		System.out.println(3);
		updateExamCnt = this.examDAO.updateExamproblem3( examDTO );
		System.out.println(4);
		updateExamCnt = this.examDAO.updateExamproblem4( examDTO );
		System.out.println(5);
		updateExamCnt = this.examDAO.updateExamproblem5( examDTO );
		System.out.println(6);
		updateExamCnt = this.examDAO.updateExamproblem6( examDTO );
		System.out.println(7);
		updateExamCnt = this.examDAO.updateExamproblem7( examDTO );
		System.out.println(8);
		updateExamCnt = this.examDAO.updateExamproblem8( examDTO );
		System.out.println(9);
		updateExamCnt = this.examDAO.updateExamproblem9( examDTO );
		System.out.println(10);
		updateExamCnt = this.examDAO.updateExamproblem10( examDTO );
		System.out.println(11);
		
		return updateExamCnt;
	}
}






















