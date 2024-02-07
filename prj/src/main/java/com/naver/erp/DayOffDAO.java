package com.naver.erp;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;


@MapperScan
@Mapper
public interface DayOffDAO {

	//학생 결재
	int getStuOffCnt(DayOffDTO dayoffDTO);
	int getStuOffCntAll();
	List<Map<String,String>> getStuOff(DayOffDTO dayoffDTO);
	DayOffDTO getStuOffDetail(String day_id);
	int insertStuOff(DayOffDTO dayoffDTO);
	int deleteStuOff(DayOffDTO dayoffDTO);
	int upStuOff(DayOffDTO dayoffDTO);
	List<Map<String,String>> getStuOffMain(DayOffDTO dayoffDTO);
	
	int updateStuDayoffStatus (DayOffDTO dayoffDTO);
	int updateTeaDayoffStatus (DayOffDTO dayoffDTO);
	
	//강사 결재
	int getTeaOffCnt(DayOffDTO dayoffDTO);
	int getTeaOffCntAll();
	List<Map<String,String>> getTeaOff(DayOffDTO dayoffDTO);
	DayOffDTO getTeaOffDetail(String tea_day_id);
	int insertTeaOff(DayOffDTO dayoffDTO);
	int deleteTeaOff(DayOffDTO dayoffDTO);
	int upTeaOff(DayOffDTO dayoffDTO);
}
