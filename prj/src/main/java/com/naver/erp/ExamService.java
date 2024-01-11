package com.naver.erp;
 
public interface ExamService {

	ExamDTO getExamDetailInfo(int exam_id);
	int insertExamInfo(ExamDTO examDTO)  throws Exception;
	int deleteExamInfo(ExamDTO examDTO) throws Exception;
	int updateExamInfo(ExamDTO examDTO) throws Exception;
}









