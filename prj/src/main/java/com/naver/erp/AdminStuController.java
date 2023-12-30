package com.naver.erp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@Controller
public class AdminStuController {

	@Autowired
	private AdminDAO adminDAO;  

	@Autowired
	private AdminService adminService; 

	
	// 학생 관리(리스트) 접속, 검색
	@RequestMapping( value="/stuList.do")
	public ModelAndView searchFreeDev(
			AdminDTO adminDTO
			,HttpSession session
	){
		Map<String,Object> stuListMap = getStuListMap( adminDTO );
		ModelAndView mav = new ModelAndView();
		mav.setViewName( "stuList.jsp" );
		mav.addObject(   "stuListMap" , stuListMap     );
		
		return  mav;
	}
	
	// 학생 리스트 불러오는 메소드
		public Map<String,Object> getStuListMap(AdminDTO adminDTO){
			Map<String,Object> resultMap = new HashMap<String,Object>();
			List<Map<String,String>> stuList;
			int stuListCnt;
			int stuListCntAll;
			Map<String,Integer> pagingMap;
			
			stuListCntAll =  this.adminDAO.getStuListCntAll();
			stuListCnt =  this.adminDAO.getStuListCnt(adminDTO);
			
			pagingMap = Util.getPagingMap(
					adminDTO.getSelectPageNo()
					, adminDTO.getRowCntPerPage()
					, stuListCnt
			);
			

			adminDTO.setSelectPageNo((int)pagingMap.get("selectPageNo"));
			adminDTO.setRowCntPerPage((int)pagingMap.get("rowCntPerPage"));
			adminDTO.setBegin_rowNo((int)pagingMap.get("begin_rowNo"));
			adminDTO.setEnd_rowNo((int)pagingMap.get("end_rowNo"));
			
			
			stuList       =  this.adminDAO.getStuList( adminDTO  );
			resultMap.put(  "stuList"       , stuList        );
			resultMap.put(  "stuListCnt"    , stuListCnt     );
			resultMap.put(  "stuListCntAll" , stuListCntAll  );
			resultMap.put(  "adminDTO"  , adminDTO );
			
			resultMap.put(  "begin_pageNo"          , pagingMap.get("begin_pageNo")        );
			resultMap.put(  "end_pageNo"            , pagingMap.get("end_pageNo")          );
			resultMap.put(  "selectPageNo"          , pagingMap.get("selectPageNo")        );
			resultMap.put(  "last_pageNo"           , pagingMap.get("last_pageNo")         );
			resultMap.put(  "begin_serialNo_asc"    , pagingMap.get("begin_serialNo_asc")  );
			resultMap.put(  "begin_serialNo_desc"   , pagingMap.get("begin_serialNo_desc") );
			
			return resultMap;
		}

	// 학생 상세 정보
	@RequestMapping(
		 value="/stuDetail.do",
		 method = RequestMethod.POST,
		 produces ="application/json;charset=UTF-8"
	)
	@ResponseBody
	public Map<String, Object> stuDetail(
			AdminDTO adminDTO
	){

		Map<String, Object> stuDetailMap = getStuDetailMap(adminDTO);
		return stuDetailMap;
	}

	public Map<String, Object> getStuDetailMap(AdminDTO adminDTO){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, String>> stuList;
		
		stuList = this.adminDAO.getStuDetailInfo(adminDTO);

		resultMap.put("stuList", stuList);
		
		return resultMap;
	}
 
	// 학생 삭제
	@RequestMapping(
			value="/deleteStuInfo.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
			)
	@ResponseBody
	public int deleteStuInfo(
			AdminDTO adminDTO
			) throws Exception {
		int deleteStuCnt = 0;
		try {
			deleteStuCnt = this.adminService.deleteStuInfo(adminDTO);
		} 
		catch (Exception e) {
			deleteStuCnt = -1;
		}
		
		return deleteStuCnt;
	}
 
	// 학생 수정
	@RequestMapping(
			value="/updateStuInfo.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
			)
	@ResponseBody
	public int updateStuInfo(
			AdminDTO adminDTO
			) throws Exception {
				
		int updateStuCnt = 0;
		
		try {
			updateStuCnt = this.adminService.updateStuInfo(adminDTO);
		} 
		catch (Exception e) {
			updateStuCnt = -1;
		}

		return updateStuCnt;
	}
	
	
	// 학생 등록
	@RequestMapping(
			value="/registStuProc.admin.do" 
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public Map<String,String> registStuProc(  
			AdminDTO  adminDTO

	){
		Map<String,String> responseMap = new HashMap<String,String>();
		int stuRegCnt = 0;
		
				try{
					stuRegCnt = this.adminService.insertStuInfo(adminDTO);
		}
		
		catch(Exception ex){
			stuRegCnt = -1;
		}
		responseMap.put("stuRegCnt" , stuRegCnt+"" );
		return responseMap;
	}
	
	
	

}
