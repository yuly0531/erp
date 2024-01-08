package com.naver.erp;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.ibatis.annotations.Param;
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
public class CalendarController {
	@Autowired
	private CalendarDAO calendarDAO;
	@Autowired
	private MainDAO mainDAO;
	

	
	@RequestMapping(value="/studentMain.do")
	public ModelAndView studentMain(
			HttpSession session
			,CalendarDTO calendarDTO
			
	){
		Map<String, Object> studentMainMap = StudentMainList();
		Map<String, Object> selectCalendarMap = selectCalendar(calendarDTO);
		session.getAttribute("stu_id");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("studentMain.jsp");
	    mav.addObject("studentMainMap", studentMainMap);
	    mav.addObject("selectCalendarMap", selectCalendarMap);
	  System.out.println(studentMainMap);
	  System.out.println(selectCalendarMap);
		return mav;}
	

	   public Map<String, Object> StudentMainList(
			   ) {
		 Map<String, Object> resultMap = new HashMap<String, Object>();
		 List<Map<String, String>> StudentMainMap; 
		StudentMainMap = this.mainDAO.StudentMainList();
		resultMap.put("studentMainMap", StudentMainMap); 
		return resultMap; 
		 }
	
	@RequestMapping(value="/mark.do")
	public ModelAndView mark(
			HttpSession session,
			CalendarDTO calendarDTO){
		session.getAttribute("stu_id");
		Map<String,Object> selectCalendarMap = selectCalendar(calendarDTO);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mark.jsp");
		mav.addObject("selectCalendarMap",selectCalendarMap);
		return mav;
	}
	
	 
	
	
	@RequestMapping( value="/markTea.do")
	public ModelAndView markTea(HttpSession session,
			CalendarDTO calendarDTO){
		session.getAttribute("tea_id");
		Map<String,Object> getCalendarMap = getCalendar(calendarDTO);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("markTea.jsp");
		mav.addObject("getCalendarMap",getCalendarMap);
		return mav;
	}
	
	
	/// 일정 등록
	
			@RequestMapping(value = "/insertCalendar.do"
					,method=RequestMethod.POST
					,produces="application/json;charset=UTF-8")
			@ResponseBody
			public Map<String,String> insertCalendar(CalendarDTO calendarDTO) {
				Map<String,String> responseMap = new HashMap<String,String>();
				int calendarRegCnt = 0;
				
						try{
							calendarRegCnt = this.calendarDAO.insertCalendar(calendarDTO);
				}
				
				catch(Exception ex){
					calendarRegCnt = -1;
				}
				responseMap.put("calendarRegCnt" , calendarRegCnt+"" );
				return responseMap;
			}
			
// 모든 일정 불러오기
		// 성공함	
			public Map<String, Object> getCalendar(
					 CalendarDTO calendarDTO   ) {
				 Map<String, Object> resultMap = new HashMap<String, Object>();
				 List<Map<String, Object>> getCalendar; 
				 getCalendar = this.calendarDAO.getCalendar(calendarDTO);
				resultMap.put("getCalendar", getCalendar); 
				return resultMap; 
				 }
			
// 선택된 일정 불러오기 (학생페이지)
			//이거안되네..
			 public Map<String, Object> selectCalendar(
					 CalendarDTO calendarDTO   ) {
				 Map<String, Object> resultMap = new HashMap<String, Object>();
				 List<Map<String, Object>> selectCalendar; 
				 selectCalendar = this.calendarDAO.selectCalendar(calendarDTO);
				resultMap.put("selectCalendar", selectCalendar); 
				return resultMap; 
				 }
			
			
}
