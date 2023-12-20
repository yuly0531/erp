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
public class StuController {

//	@Autowired
//	private FreelancerDAO freelancerDAO;  

	@Autowired
	private StuService stuService; 

	
//	@RequestMapping( value="/searchStu.do")
//	public ModelAndView searchStu(
//			FreelancerSearchDTO freelancerSearchDTO
//			,HttpSession session
//	){
//		Map<String,Object> freelancerListMap = getFreelancerListMap( freelancerSearchDTO );
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName( "searchFreeDev.jsp" );
//		mav.addObject(   "freelancerListMap" , freelancerListMap     );
//		
//		return  mav;
//	}
//
//	@RequestMapping(
//		 value="/searchStuDetail.do",
//		 method = RequestMethod.POST,
//		 produces ="application/json;charset=UTF-8"
//	)
//	@ResponseBody
//	public Map<String, Object> searchStuDetail(
//			FreelancerSearchDTO freelancerSearchDTO,
//			@RequestParam(value="free_uid") String free_uid
//	){
//
//		Map<String, Object> getStuListDetailMap = getStuListDetailMap( freelancerSearchDTO );
//		return getStuListDetailMap;
//	}
//
//	public Map<String, Object> getStuListDetailMap(FreelancerSearchDTO freelancerSearchDTO){
//		Map<String, Object> resultMap = new HashMap<String, Object>();
//		List<Map<String, Object>> freelancerList;
//		int freelancerListCnt;
//		int freelancerListCntAll;
//		Map<String,Integer> pagingMap;
//		
//		freelancerListCntAll =  this.freelancerDAO.getFreelancerListCntAll(   );
//		freelancerListCnt =  this.freelancerDAO.getFreelancerListCnt(freelancerSearchDTO);
//
//		pagingMap = Util.getPagingMap(
//				freelancerSearchDTO.getSelectPageNo()
//				, freelancerSearchDTO.getRowCntPerPage()
//				, freelancerListCnt
//		);
//
//		freelancerSearchDTO.setSelectPageNo((int)pagingMap.get("selectPageNo"));
//		freelancerSearchDTO.setRowCntPerPage((int)pagingMap.get("rowCntPerPage"));
//		freelancerSearchDTO.setBegin_rowNo((int)pagingMap.get("begin_rowNo"));
//		freelancerSearchDTO.setEnd_rowNo((int)pagingMap.get("end_rowNo"));
//		
//		freelancerList = this.freelancerDAO.getFreeDetailInfo( freelancerSearchDTO  );
//
//		resultMap.put("freelancerList", freelancerList);
//		
//		return resultMap;
//	}
// 
//	@RequestMapping(
//			value="/deleteFreeInfo.do"
//			,method=RequestMethod.POST
//			,produces="application/json;charset=UTF-8"
//			)
//	@ResponseBody
//	public int deleteFreeInfo(
//			FreelancerDTO freelancerDTO,
//			@RequestParam(value="del_free_uid") int del_free_uid
//			) throws Exception {
//
//		int deleteBoardCnt = 0;
//				
//		try {
//			deleteBoardCnt = this.freelancerService.deleteFreeInfo(freelancerDTO);
//		} catch (Exception e) {
//			deleteBoardCnt = -1;
//		}
//		
//		return deleteBoardCnt;
//	}
// 
//	@RequestMapping(
//			value="/updateFreeInfo.do"
//			,method=RequestMethod.POST
//			,produces="application/json;charset=UTF-8"
//			)
//	@ResponseBody
//	public int updateFreeInfo(
//			FreelancerDTO freelancerDTO,
//			@RequestParam(value="del_free_uid") int del_free_uid
//			) throws Exception {
//				
//		int updateFreeCnt = 0;
//		
//		try {
//				updateFreeCnt = this.freelancerService.updateFreeInfo(freelancerDTO);
//		} catch (Exception e) {
//			updateFreeCnt = -1;
//		}
//
//		return updateFreeCnt;
//	}
//	
//	public Map<String,Object> getFreelancerListMap(FreelancerSearchDTO freelancerSearchDTO){
//		Map<String,Object> resultMap = new HashMap<String,Object>();
//		List<Map<String,String>> freelancerList;
//		int freelancerListCnt;
//		int freelancerListCntAll;
//		Map<String,Integer> pagingMap;
//		
//		freelancerListCntAll =  this.freelancerDAO.getFreelancerListCntAll(   );
//		freelancerListCnt =  this.freelancerDAO.getFreelancerListCnt(  freelancerSearchDTO );
//		
//		pagingMap = Util.getPagingMap(
//				freelancerSearchDTO.getSelectPageNo()
//				, freelancerSearchDTO.getRowCntPerPage()
//				, freelancerListCnt
//		);
//		
//
//		freelancerSearchDTO.setSelectPageNo((int)pagingMap.get("selectPageNo"));
//		freelancerSearchDTO.setRowCntPerPage((int)pagingMap.get("rowCntPerPage"));
//		freelancerSearchDTO.setBegin_rowNo((int)pagingMap.get("begin_rowNo"));
//		freelancerSearchDTO.setEnd_rowNo((int)pagingMap.get("end_rowNo"));
//		
//		
//		freelancerList       =  this.freelancerDAO.getFreelancerList( freelancerSearchDTO  );
//
//		resultMap.put(  "freelancerList"       , freelancerList        );
//		resultMap.put(  "freelancerListCnt"    , freelancerListCnt     );
//		resultMap.put(  "freelancerListCntAll" , freelancerListCntAll  );
//		resultMap.put(  "freelancerSearchDTO"  , freelancerSearchDTO );
//		
//		resultMap.put(  "begin_pageNo"          , pagingMap.get("begin_pageNo")        );
//		resultMap.put(  "end_pageNo"            , pagingMap.get("end_pageNo")          );
//		resultMap.put(  "selectPageNo"          , pagingMap.get("selectPageNo")        );
//		resultMap.put(  "last_pageNo"           , pagingMap.get("last_pageNo")         );
//		resultMap.put(  "begin_serialNo_asc"    , pagingMap.get("begin_serialNo_asc")  );
//		resultMap.put(  "begin_serialNo_desc"   , pagingMap.get("begin_serialNo_desc") );
//		
//		return resultMap;
//	}
//	

	
//	@RequestMapping(
//			value="/registStuProc.do" 
//			,method=RequestMethod.POST
//			,produces="application/json;charset=UTF-8"
//	)
//	@ResponseBody
//	public Map<String,String> registStuProc(  
//			FreelancerDTO  freelancerDTO
//
//	){
//		Map<String,String> responseMap = new HashMap<String,String>();
//		int stuRegCnt = 0;
//		
//				try{
//					stuRegCnt = this.stuService.insertStuInfo(freelancerDTO);
//		}
//		
//		catch(Exception ex){
//			stuRegCnt = -1;
//		}
//		responseMap.put("stuRegCnt" , stuRegCnt+"" );
//		return responseMap;
//	}
	
	
	

}
