package com.naver.erp;


public interface DayOffService {

	
	int insertStuOff(DayOffDTO dayoffDTO)throws Exception;
	int deleteStuOff(DayOffDTO dayoffDTO)throws Exception ;
	int upStuOff(DayOffDTO dayoffDTO)throws Exception;
	
	int updateStuDayoffStatus (DayOffDTO dayoffDTO)throws Exception;
	int updateTeaDayoffStatus (DayOffDTO dayoffDTO)throws Exception;
	
	int insertTeaOff(DayOffDTO dayoffDTO)throws Exception;
	int deleteTeaOff(DayOffDTO dayoffDTO)throws Exception ;
	int upTeaOff(DayOffDTO dayoffDTO)throws Exception;
	DayOffDTO getTeaOffDetail(String tea_day_id);
	DayOffDTO getStuOffDetail(String day_id);
}
