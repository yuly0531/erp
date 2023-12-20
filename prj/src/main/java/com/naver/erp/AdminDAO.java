package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
@Mapper
public interface AdminDAO {
	// 학생
	int getStuListCnt(AdminDTO adminDTO);
	int getStuListCntAll();
	List<Map<String,String>> getStuList(AdminDTO adminDTO);
	List<Map<String,String>> getStuDetailInfo(String stu_no);
	int insertStuInfo(AdminDTO adminDTO);
	int deleteStuInfo(String stu_no);
	int updateStuInfo(String stu_no);

	// 강사
	int getTeaListCnt(AdminDTO adminDTO);
	int getTeaListCntAll();
	List<Map<String,String>> getTeaList(AdminDTO adminDTO);
	List<Map<String,String>> getTeaDetailInfo(String tea_no);
	int insertTeaInfo(AdminDTO adminDTO);
	int deleteTeaInfo(String tea_no);
	int updateTeaInfo(String tea_no);

	// 수업
	int getClassListCnt(AdminDTO adminDTO);
	int getClassListCntAll();
	List<Map<String,String>> getClassList(AdminDTO adminDTO);
	List<Map<String,String>> getClassDetailInfo(String class_no);
	int insertClassInfo(AdminDTO adminDTO);
	int deleteClassInfo(String class_no);
	int updateClassInfo(String class_no);

}