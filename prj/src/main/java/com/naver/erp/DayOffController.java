package com.naver.erp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DayOffController {

	@Autowired
	private MainDAO mainDAO;
	@Autowired
	private DayOffDAO dayoffDAO;
	
	
	
	
	//페이지
	@RequestMapping( value="/dayOff.do")
	public ModelAndView dayOff(
			DayOffDTO dayoffDTO,
			HttpSession session
		){
		String mid;
		if((String)session.getAttribute("stu_id")!=null) {
			mid = (String)session.getAttribute("stu_id");
		}
		else if((String)session.getAttribute("tea_id")!=null) {
			mid = (String)session.getAttribute("tea_id");
		}
		else {
			mid = (String)session.getAttribute("mana_id");
		}
		String whatRole = mainDAO.whatRole(mid);
		ModelAndView mav = new ModelAndView();
		Map<String, Object> getStuOff = getStuOff(dayoffDTO);
		Map<String, Object> getTeaOff = getTeaOff(dayoffDTO);
		
		mav.setViewName("dayOff.jsp");
		mav.addObject("whatRole",whatRole);
		mav.addObject("getStuOff",getStuOff);
		mav.addObject("getTeaOff",getTeaOff);

		return mav;
	}
	
	// 선생 결재리스트 불러오는 메소드
			public Map<String,Object> getTeaOff(DayOffDTO dayoffDTO){
				Map<String,Object> resultMap = new HashMap<String,Object>();
				List<Map<String,String>> tea_dayoffList;
				int tea_dayoffListCnt;
				int tea_dayoffListCntAll;
				Map<String,Integer> pagingMap;
				
				tea_dayoffListCntAll =  this.dayoffDAO.getTeaOffCntAll();
				tea_dayoffListCnt =  this.dayoffDAO.getTeaOffCnt(dayoffDTO );
				
				pagingMap = Util.getPagingMap(
						dayoffDTO.getSelectPageNo()
						, dayoffDTO.getRowCntPerPage()
						, tea_dayoffListCnt
				);
				

				dayoffDTO.setSelectPageNo((int)pagingMap.get("selectPageNo"));
				dayoffDTO.setRowCntPerPage((int)pagingMap.get("rowCntPerPage"));
				dayoffDTO.setBegin_rowNo((int)pagingMap.get("begin_rowNo"));
				dayoffDTO.setEnd_rowNo((int)pagingMap.get("end_rowNo"));
				
				
				tea_dayoffList       =  this.dayoffDAO.getTeaOff(dayoffDTO);

				resultMap.put(  "tea_dayoffList"       , tea_dayoffList        );
				resultMap.put(  "tea_dayoffListCnt"    , tea_dayoffListCnt     );
				resultMap.put(  "tea_dayoffListCntAll" , tea_dayoffListCntAll  );
				resultMap.put(  "dayoffDTO"  , dayoffDTO );
				
				resultMap.put(  "begin_pageNo"          , pagingMap.get("begin_pageNo")        );
				resultMap.put(  "end_pageNo"            , pagingMap.get("end_pageNo")          );
				resultMap.put(  "selectPageNo"          , pagingMap.get("selectPageNo")        );
				resultMap.put(  "last_pageNo"           , pagingMap.get("last_pageNo")         );
				resultMap.put(  "begin_serialNo_asc"    , pagingMap.get("begin_serialNo_asc")  );
				resultMap.put(  "begin_serialNo_desc"   , pagingMap.get("begin_serialNo_desc") );
				
				return resultMap;
			}

		// 선생 결재 상세 정보
		@RequestMapping(
			 value="/tea_dayoffDetail.do",
			 method = RequestMethod.POST,
			 produces ="application/json;charset=UTF-8"
		)
		@ResponseBody
		public Map<String, Object> tea_dayoffDetail(
				DayOffDTO dayoffDTO
		){

			Map<String, Object> tea_dayoffDetailMap = getTeaDayOffDetailMap(dayoffDTO);
			return tea_dayoffDetailMap;
		}

		public Map<String, Object> getTeaDayOffDetailMap(DayOffDTO dayoffDTO){
			Map<String, Object> resultMap = new HashMap<String, Object>();
			List<Map<String, String>> tea_dayoffList;
			
			tea_dayoffList = dayoffDAO.getTeaOffDetail(dayoffDTO);
			resultMap.put("tea_dayoffList", tea_dayoffList);
			return resultMap;
		}
	
		
		//선생 결재 삭제
		@RequestMapping(
				value="/deleteTeaOff.do"
				,method=RequestMethod.POST
				,produces="application/json;charset=UTF-8"
				)
		@ResponseBody
		public int deleteTeaOff(
				DayOffDTO dayoffDTO
				) throws Exception {

			int deleteTeaOffCnt = 0;
					
			try {
				deleteTeaOffCnt = this.dayoffDAO.deleteTeaOff(dayoffDTO);
			} catch (Exception e) {
				deleteTeaOffCnt = -1;
			}
			
			return deleteTeaOffCnt;
		}
	 
		//선생 결재 수정
		@RequestMapping(
				value="/updateTeaOff.do"
				,method=RequestMethod.POST
				,produces="application/json;charset=UTF-8"
				)
		@ResponseBody
		public int upTeaOff(
				DayOffDTO dayoffDTO
				) throws Exception {
					
			int updateTeaOffCnt = 0;
			
			try {
				updateTeaOffCnt = this.dayoffDAO.upTeaOff(dayoffDTO);
			} catch (Exception e) {
				updateTeaOffCnt = -1;
			}

			return updateTeaOffCnt;
		}
		
		
		//선생 결재 등록
		@RequestMapping(
				value="/insertTeaOff.do" 
				,method=RequestMethod.POST
				,produces="application/json;charset=UTF-8"
		)
		@ResponseBody
		public Map<String,String> insertTeaOff(  
				@Valid
				DayOffDTO dayoffDTO
				,BindingResult bindingResult

		){
			Map<String,String> responseMap = new HashMap<String,String>();
			String errorMsg = "";
			int TeaOffRegCnt = 0;
			
			try{
				errorMsg = Util.getErrorMsgFromBindingResult(bindingResult);
				if( errorMsg!=null && errorMsg.length()>0 ) {
					TeaOffRegCnt = -21;
				}
				else {
					TeaOffRegCnt = this.dayoffDAO.insertTeaOff(dayoffDTO);
				}
			}
			
			catch(Exception ex){
				TeaOffRegCnt = -1;
			}
			responseMap.put("errorMsg", errorMsg);
			responseMap.put("TeaOffRegCnt" , TeaOffRegCnt+"" );
			return responseMap;
		}
	
		///////////////////////여기서부터 학생 결재!!!!!
		// 학생 결재리스트 불러오는 메소드
					public Map<String,Object> getStuOff(DayOffDTO dayoffDTO){
						Map<String,Object> resultMap = new HashMap<String,Object>();
						List<Map<String,String>> dayoffList;
						int dayoffListCnt;
						int dayoffListCntAll;
					
						Map<String,Integer> pagingMap;
						
						dayoffListCntAll =  this.dayoffDAO.getStuOffCntAll();
						dayoffListCnt =  this.dayoffDAO.getStuOffCnt(dayoffDTO);
						
						
						pagingMap = Util.getPagingMap(
								dayoffDTO.getSelectPageNo()
								, dayoffDTO.getRowCntPerPage()
								, dayoffListCnt
						);
						

						dayoffDTO.setSelectPageNo((int)pagingMap.get("selectPageNo"));
						dayoffDTO.setRowCntPerPage((int)pagingMap.get("rowCntPerPage"));
						dayoffDTO.setBegin_rowNo((int)pagingMap.get("begin_rowNo"));
						dayoffDTO.setEnd_rowNo((int)pagingMap.get("end_rowNo"));
						
						
						dayoffList       =  this.dayoffDAO.getStuOff(dayoffDTO);

						resultMap.put(  "dayoffList"       , dayoffList        );
						resultMap.put(  "dayoffListCnt"    , dayoffListCnt     );
						resultMap.put(  "dayoffListCntAll" , dayoffListCntAll  );
						resultMap.put(  "dayoffDTO"  , dayoffDTO );
						
						resultMap.put(  "begin_pageNo"          , pagingMap.get("begin_pageNo")        );
						resultMap.put(  "end_pageNo"            , pagingMap.get("end_pageNo")          );
						resultMap.put(  "selectPageNo"          , pagingMap.get("selectPageNo")        );
						resultMap.put(  "last_pageNo"           , pagingMap.get("last_pageNo")         );
						resultMap.put(  "begin_serialNo_asc"    , pagingMap.get("begin_serialNo_asc")  );
						resultMap.put(  "begin_serialNo_desc"   , pagingMap.get("begin_serialNo_desc") );
						
						return resultMap;
					}

				// 학생결재 상세 정보
				@RequestMapping(
					 value="/dayoffDetail.do",
					 method = RequestMethod.POST,
					 produces ="application/json;charset=UTF-8"
				)
				@ResponseBody
				public Map<String, Object> dayoffDetail(
						DayOffDTO dayoffDTO
				){

					Map<String, Object> dayoffDetailMap = getDayOffDetailMap(dayoffDTO);
					return dayoffDetailMap;
				}

				public Map<String, Object> getDayOffDetailMap(DayOffDTO dayoffDTO){
					Map<String, Object> resultMap = new HashMap<String, Object>();
					List<Map<String, String>> dayoffList;
					
					dayoffList = dayoffDAO.getStuOffDetail(dayoffDTO);
					resultMap.put("dayoffList", dayoffList);
					return resultMap;
				}
			
				
				//학생 결재 삭제
				@RequestMapping(
						value="/deleteStuOff.do"
						,method=RequestMethod.POST
						,produces="application/json;charset=UTF-8"
						)
				@ResponseBody
				public int deleteStuOff(
						DayOffDTO dayoffDTO
						) throws Exception {

					int deleteStuOffCnt = 0;
							
					try {
						deleteStuOffCnt = this.dayoffDAO.deleteStuOff(dayoffDTO);
					} catch (Exception e) {
						deleteStuOffCnt = -1;
					}
					
					return deleteStuOffCnt;
				}
			 
				//학생 결재 수정
				@RequestMapping(
						value="/updateStuOff.do"
						,method=RequestMethod.POST
						,produces="application/json;charset=UTF-8"
						)
				@ResponseBody
				public int upStuOff(
						DayOffDTO dayoffDTO
						) throws Exception {
							
					int updateStuOffCnt = 0;
					
					try {
						updateStuOffCnt = this.dayoffDAO.upStuOff(dayoffDTO);
					} catch (Exception e) {
						updateStuOffCnt = -1;
					}

					return updateStuOffCnt;
				}
				
				
				//학생 결재 등록
				@RequestMapping(
						value="/insertStuOff.do" 
						,method=RequestMethod.POST
						,produces="application/json;charset=UTF-8"
				)
				@ResponseBody
				public Map<String,String> insertStuOff(  
						@Valid
						DayOffDTO dayoffDTO
						,BindingResult bindingResult

				){
					Map<String,String> responseMap = new HashMap<String,String>();
					String errorMsg = "";
					int StuOffRegCnt = 0;
					
					try{
						errorMsg = Util.getErrorMsgFromBindingResult(bindingResult);
						if( errorMsg!=null && errorMsg.length()>0 ) {
							StuOffRegCnt = -21;
						}
						else {
							StuOffRegCnt = this.dayoffDAO.insertStuOff(dayoffDTO);
						}
					}
					
					catch(Exception ex){
						System.out.println(ex);
						StuOffRegCnt = -1;
					}
					responseMap.put("errorMsg", errorMsg);
					responseMap.put("StuOffRegCnt" , StuOffRegCnt+"" );
					return responseMap;
				}
			
		
		
		
		
		
		
}
