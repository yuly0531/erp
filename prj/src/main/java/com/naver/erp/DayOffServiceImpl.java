package com.naver.erp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class DayOffServiceImpl implements DayOffService {

	@Autowired
	private DayOffDAO dayOffDAO;
	@Override
	public int insertStuOff(DayOffDTO dayoffDTO)throws Exception {
		int StuOffRegCnt  = 0;
		StuOffRegCnt = this.dayOffDAO.insertStuOff(dayoffDTO);
		return StuOffRegCnt;
	}
	@Override
	public int deleteStuOff(DayOffDTO dayoffDTO) throws Exception {
		int deleteStuOffCnt  = 0;
		deleteStuOffCnt = this.dayOffDAO.deleteStuOff(dayoffDTO);
		return deleteStuOffCnt;
	}
	@Override
	public int upStuOff(DayOffDTO dayoffDTO)throws Exception {
		int updateStuOffCnt  = 0;
		updateStuOffCnt = this.dayOffDAO.upStuOff(dayoffDTO);
		return updateStuOffCnt;
	}
	@Override
	public int updateStuDayoffStatus(DayOffDTO dayoffDTO)throws Exception {
		int updateTeaOffCnt  = 0;
		updateTeaOffCnt = this.dayOffDAO.updateStuDayoffStatus(dayoffDTO);
		return updateTeaOffCnt;
	}
	@Override
	public int updateTeaDayoffStatus(DayOffDTO dayoffDTO)throws Exception {
		int updateTeaOffCnt  = 0;
		updateTeaOffCnt = this.dayOffDAO.updateTeaDayoffStatus(dayoffDTO);
		return updateTeaOffCnt;
	}
	@Override
	public int insertTeaOff(DayOffDTO dayoffDTO)throws Exception {
		int TeaOffRegCnt  = 0;
		TeaOffRegCnt = this.dayOffDAO.insertTeaOff(dayoffDTO);
		return TeaOffRegCnt;
	}
	@Override
	public int deleteTeaOff(DayOffDTO dayoffDTO) throws Exception {
		int deleteTeaOffCnt  = 0;
		deleteTeaOffCnt = this.dayOffDAO.deleteTeaOff(dayoffDTO);
		return deleteTeaOffCnt;
	}
	@Override
	public int upTeaOff(DayOffDTO dayoffDTO)throws Exception {
		int updateTeaOffCnt  = 0;
		updateTeaOffCnt = this.dayOffDAO.upTeaOff(dayoffDTO);
		return updateTeaOffCnt;
	}
	@Override
	public DayOffDTO getStuOffDetail(String day_id) { 
		DayOffDTO StuOffDetail = this.dayOffDAO.getStuOffDetail(day_id);
		return StuOffDetail;
	}
	@Override
	public DayOffDTO getTeaOffDetail(String tea_day_id) { 
		DayOffDTO TeaOffDetail = this.dayOffDAO.getTeaOffDetail(tea_day_id);
		return TeaOffDetail;
	}
	
	
}
