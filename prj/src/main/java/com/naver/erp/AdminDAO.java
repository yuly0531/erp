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
	List<Map<String,String>> getStuDetailInfo(AdminDTO adminDTO);
	
	int insertStuInfo(AdminDTO adminDTO);
	int insertStuEmegency(AdminDTO adminDTO);
	int insertClassJoinStu(AdminDTO adminDTO);
	
	int deleteStuInfo(AdminDTO adminDTO);
	int deleteStuEmegency(AdminDTO adminDTO);
	int deleteClassJoinStu(AdminDTO adminDTO);
	
	int upStuInfo(AdminDTO adminDTO);
	int upStuEmegency(AdminDTO adminDTO);
	int upClassJoinStu(AdminDTO adminDTO);

	// 강사
	int getTeaListCnt(AdminDTO adminDTO);
	int getTeaListCntAll();
	List<Map<String,String>> getTeaList(AdminDTO adminDTO);
	List<Map<String,String>> getTeaDetailInfo(AdminDTO adminDTO);
	
	int insertTeaInfo(AdminDTO adminDTO);
	int insertTeaEmegency(AdminDTO adminDTO);
	int insertExpMatter(AdminDTO adminDTO);
	
	int updateClass_take_charge_tea(AdminDTO adminDTO);
	int deleteExpMatter(AdminDTO adminDTO);
	int deleteTeaEmegency(AdminDTO adminDTO);
	int deleteTeaInfo(AdminDTO adminDTO);

	int updateTeaInfo(AdminDTO adminDTO);
	int upTeaEmegency(AdminDTO adminDTO);
	int upExpMatter(AdminDTO adminDTO);

	// 수업
	int getClassListCnt(AdminDTO adminDTO);
	int getClassListCntAll();
	List<Map<String,String>> getClassList(AdminDTO adminDTO);
	List<Map<String,String>> getClassDetailInfo(AdminDTO adminDTO);
	List<Map<String,String>> getStuJoinList(AdminDTO adminDTO);
	int insertClassInfo(AdminDTO adminDTO);
	int insertJoinStu(AdminDTO adminDTO);
	int delectJoinStu(AdminDTO adminDTO);
	int deleteClassInfo(AdminDTO adminDTO);
	int updateClassInfo(AdminDTO adminDTO);

}