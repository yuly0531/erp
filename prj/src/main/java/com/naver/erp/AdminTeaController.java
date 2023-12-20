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
public class AdminTeaController {

	@Autowired
	private AdminDAO adminDAO;  

	@Autowired
	private AdminService adminService; 

	
	// 강사 관리(리스트) 접속, 검색
	@RequestMapping( value="/teaList.admin.do")
	public ModelAndView searchFreeDev(
			AdminDTO adminDTO
			,HttpSession session
	){
		Map<String,Object> teaListMap = getTeaListMap( adminDTO );
		ModelAndView mav = new ModelAndView();
		mav.setViewName( "teaListAdmin.jsp" );
		mav.addObject(   "teaListMap" , teaListMap     );
		
		return  mav;
	}
	
	// 강사 리스트 불러오는 메소드
		public Map<String,Object> getTeaListMap(AdminDTO adminDTO){
			Map<String,Object> resultMap = new HashMap<String,Object>();
			List<Map<String,String>> teaList;
			int teaListCnt;
			int teaListCntAll;
			Map<String,Integer> pagingMap;
			
			teaListCntAll =  this.adminDAO.getTeaListCntAll(   );
			teaListCnt =  this.adminDAO.getTeaListCnt(  adminDTO );
			
			pagingMap = Util.getPagingMap(
					adminDTO.getSelectPageNo()
					, adminDTO.getRowCntPerPage()
					, teaListCnt
			);
			

			adminDTO.setSelectPageNo((int)pagingMap.get("selectPageNo"));
			adminDTO.setRowCntPerPage((int)pagingMap.get("rowCntPerPage"));
			adminDTO.setBegin_rowNo((int)pagingMap.get("begin_rowNo"));
			adminDTO.setEnd_rowNo((int)pagingMap.get("end_rowNo"));
			
			
			teaList       =  this.adminDAO.getTeaList( adminDTO  );

			resultMap.put(  "teaList"       , teaList        );
			resultMap.put(  "teaListCnt"    , teaListCnt     );
			resultMap.put(  "teaListCntAll" , teaListCntAll  );
			resultMap.put(  "adminDTO"  , adminDTO );
			
			resultMap.put(  "begin_pageNo"          , pagingMap.get("begin_pageNo")        );
			resultMap.put(  "end_pageNo"            , pagingMap.get("end_pageNo")          );
			resultMap.put(  "selectPageNo"          , pagingMap.get("selectPageNo")        );
			resultMap.put(  "last_pageNo"           , pagingMap.get("last_pageNo")         );
			resultMap.put(  "begin_serialNo_asc"    , pagingMap.get("begin_serialNo_asc")  );
			resultMap.put(  "begin_serialNo_desc"   , pagingMap.get("begin_serialNo_desc") );
			
			return resultMap;
		}

	// 강사 상세 정보
	@RequestMapping(
		 value="/teaDetail.admin.do",
		 method = RequestMethod.POST,
		 produces ="application/json;charset=UTF-8"
	)
	@ResponseBody
	public Map<String, Object> teaDetail(
			AdminDTO adminDTO,
			@RequestParam(value="tea_no") String tea_no
	){

		Map<String, Object> teaDetailMap = getTeaDetailMap( tea_no );
		return teaDetailMap;
	}

	public Map<String, Object> getTeaDetailMap(String tea_no){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<Map<String, String>> teaList;
		
		teaList = this.adminDAO.getTeaDetailInfo(tea_no);

		resultMap.put("teaList", teaList);
		
		return resultMap;
	}
 
	// 강사 삭제
	@RequestMapping(
			value="/deleteTeaInfo.admin.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
			)
	@ResponseBody
	public int deleteTeaInfo(
			AdminDTO adminDTO,
			@RequestParam(value="tea_no") String tea_no
			) throws Exception {

		int deleteTeaCnt = 0;
				
		try {
			deleteTeaCnt = this.adminService.deleteTeaInfo(tea_no);
		} catch (Exception e) {
			deleteTeaCnt = -1;
		}
		
		return deleteTeaCnt;
	}
 
	// 강사 수정
	@RequestMapping(
			value="/updateTeaInfo.admin.do"
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
			)
	@ResponseBody
	public int updateTeaInfo(
			AdminDTO adminDTO,
			@RequestParam(value="tea_no") String tea_no
			) throws Exception {
				
		int updateTeaCnt = 0;
		
		try {
			updateTeaCnt = this.adminService.updateTeaInfo(tea_no);
		} catch (Exception e) {
			updateTeaCnt = -1;
		}

		return updateTeaCnt;
	}
	
	
	// 강사 등록
	@RequestMapping(
			value="/registTeaProc.admin.do" 
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public Map<String,String> registTeaProc(  
			AdminDTO  adminDTO

	){
		Map<String,String> responseMap = new HashMap<String,String>();
		int teaRegCnt = 0;
		
				try{
					teaRegCnt = this.adminService.insertTeaInfo(adminDTO);
		}
		
		catch(Exception ex){
			teaRegCnt = -1;
		}
		responseMap.put("teaRegCnt" , teaRegCnt+"" );
		return responseMap;
	}
	
	
	

}
