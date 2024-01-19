package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
@Mapper
public interface ExamDAO {

	int getExamListCnt(ExamDTO examDTO);
	List<Map<String,String>> getExamList(ExamDTO examDTO);
	List<Map<String,String>> getExamDetailInfo(ExamDTO examDTO);
	List<Map<String,String>> getExamDetailProblem(ExamDTO examDTO);
	List<Map<String,String>> getExamDetailAnswer(ExamDTO examDTO);
	int insertExamInfo(ExamDTO examDTO);
	int examproblem(ExamDTO examDTO);
	int deleteExamInfo(ExamDTO examDTO);
	int updateExamInfo(ExamDTO examDTO);
	int updateExamproblem1(ExamDTO examDTO);
	int updateExamproblem2(ExamDTO examDTO);
	int updateExamproblem3(ExamDTO examDTO);
	int updateExamproblem4(ExamDTO examDTO);
	int updateExamproblem5(ExamDTO examDTO);
	int updateExamproblem6(ExamDTO examDTO);
	int updateExamproblem7(ExamDTO examDTO);
	int updateExamproblem8(ExamDTO examDTO);
	int updateExamproblem9(ExamDTO examDTO);
	int updateExamproblem10(ExamDTO examDTO);

}