package com.naver.erp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
 
@Service
@Transactional
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDAO adminDAO;
 
	
	// 학생
	@Override
	public int insertStuInfo(AdminDTO adminDTO)  throws Exception {
		int stuRegCnt  = 0;
		stuRegCnt = this.adminDAO.insertStuInfo(adminDTO);
		stuRegCnt = this.adminDAO.insertStuEmegency(adminDTO);
		stuRegCnt = this.adminDAO.insertClassJoinStu(adminDTO);
		
		return stuRegCnt;
	}


	@Override
	public int deleteStuInfo(AdminDTO adminDTO) {
		int deleteStuCnt = 0;
		
		if(adminDTO.getJoinClass()!=null) {
			deleteStuCnt = this.adminDAO.deleteClassJoinStu(adminDTO);
		}
		if(adminDTO.getEmergency_name()!=null) {
			deleteStuCnt = this.adminDAO.deleteStuEmegency(adminDTO);
		}
		deleteStuCnt = this.adminDAO.deleteStuInfo(adminDTO);
		
		return deleteStuCnt;
	}

	
	@Override
	public int updateStuInfo(AdminDTO adminDTO) {
		int updateStuCnt = 0;
		updateStuCnt = this.adminDAO.upStuInfo( adminDTO );
		updateStuCnt = this.adminDAO.upStuEmegency( adminDTO );
		updateStuCnt = this.adminDAO.upClassJoinStu( adminDTO );
		
		return updateStuCnt;
	}

	
	// 강사
	@Override
	public int insertTeaInfo(AdminDTO adminDTO)  throws Exception {
		int teaRegCnt  = 0;
		teaRegCnt = this.adminDAO.insertTeaInfo(adminDTO);
		teaRegCnt = this.adminDAO.insertTeaEmegency(adminDTO);
		teaRegCnt = this.adminDAO.insertExpMatter(adminDTO);
		return teaRegCnt;
	}

	@Override
	public int deleteTeaInfo(AdminDTO adminDTO) {
		int deleteTeaCnt = 0;
		deleteTeaCnt = this.adminDAO.updateClass_take_charge_tea(adminDTO);
		deleteTeaCnt = this.adminDAO.deleteExpMatter(adminDTO);
		deleteTeaCnt = this.adminDAO.deleteTeaEmegency(adminDTO);
		deleteTeaCnt = this.adminDAO.deleteTeaInfo(adminDTO);
		
		return deleteTeaCnt;
	}

	
	@Override
	public int updateTeaInfo(AdminDTO adminDTO) {
		int updateTeaCnt = 0;
		updateTeaCnt = this.adminDAO.updateTeaInfo( adminDTO );
		updateTeaCnt = this.adminDAO.upTeaEmegency( adminDTO );
		updateTeaCnt = this.adminDAO.upExpMatter( adminDTO );
		return updateTeaCnt;
	}

	
	// 수업
	@Override
	public int insertClassInfo(AdminDTO adminDTO)  throws Exception {
		int classRegCnt  = 0;
		classRegCnt = this.adminDAO.insertClassInfo(adminDTO);
		
		return classRegCnt;
	}
	
	@Override
	public int insertJoinStu(AdminDTO adminDTO)  throws Exception {
		int insertJoinStuCnt  = 0;
		insertJoinStuCnt = this.adminDAO.delectJoinStu(adminDTO);
		insertJoinStuCnt = this.adminDAO.insertJoinStu(adminDTO);
		
		return insertJoinStuCnt;
	}
	

	@Override
	public int deleteClassInfo(AdminDTO adminDTO) {
		int deleteClassCnt = 0;
		deleteClassCnt = this.adminDAO.deleteClassInfo(adminDTO);
		
		return deleteClassCnt;
	}

	
	@Override
	public int updateClassInfo(AdminDTO adminDTO) {
		int updateClassCnt = 0;
		updateClassCnt = this.adminDAO.updateClassInfo( adminDTO );
		
		return updateClassCnt;
	}
}






















