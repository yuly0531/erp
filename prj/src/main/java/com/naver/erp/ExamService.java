package com.naver.erp;
 
public interface ExamService {

	int insertExamInfo(ExamDTO examDTO)  throws Exception;
	int insertExamScore(ExamDTO examDTO)  throws Exception;
	int deleteExamInfo(ExamDTO examDTO) throws Exception;
	int updateExamInfo(ExamDTO examDTO) throws Exception;
}









