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
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	@Autowired
	private MainDAO mainDAO;
	
	 @RequestMapping( value="/adminMain.do")
		public ModelAndView manaList(
		){
			Map<String, Object> ManaListMap = getManaList();
			ModelAndView mav = new ModelAndView();
			mav.setViewName("adminMain.jsp");
		      mav.addObject("ManaListMap", ManaListMap);
			return mav;}
		

		   public Map<String, Object> getManaList() {
			 Map<String, Object> resultMap = new HashMap<String, Object>();
			 List<Map<String, String>> ManaList; 
			 
			 
			 ManaList = this.mainDAO.getManaList();
			 
			 resultMap.put("ManaList", ManaList); 

			 return resultMap; 
			 }
		   
	@RequestMapping( value="/checkGrade.do")
	public ModelAndView checkGrade(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("checkGrade.jsp");
		return mav;
	}
	
	@RequestMapping( value="/teaMain.do")
	public ModelAndView teaMain(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("teaMain.jsp");
		return mav;
	}
	
	
	@RequestMapping( value="/registExample.do")
	public ModelAndView registExample(
			ExamDTO examDTO,
			HttpSession session){
		String tea_id = (String) session.getAttribute("mid");
	    examDTO.setTea_id(tea_id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("registExample.jsp");
		return mav;
	}
	@RequestMapping( value="/dayOff.do")
	public ModelAndView dayOff(
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
		mav.setViewName("dayOff.jsp");
		mav.addObject("whatRole",whatRole);
		return mav;
	}
	   
	@RequestMapping( value="/teacherMain.do")
	public ModelAndView TeacherMain(
	){
		Map<String, Object> TeacherMainMap = TeacherMainList();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("teacherMain.jsp");
	      mav.addObject("TeacherMainMap", TeacherMainMap);
		return mav;}
	

	   public Map<String, Object> TeacherMainList() {
		 Map<String, Object> resultMap = new HashMap<String, Object>();
		 List<Map<String, String>> teacherMainList; 
		 
		 
		 teacherMainList = this.mainDAO.TeacherMainList();
		 
		 resultMap.put("teacherMainList", teacherMainList); 

		 return resultMap; 
		 }
		   
	@RequestMapping( value="/registStu.do")
	public ModelAndView registStu(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("registStu.jsp");
		return mav;
	}
	
	@RequestMapping( value="/registTea.do")
	public ModelAndView registTea(
			){
				ModelAndView mav = new ModelAndView();
				mav.setViewName("registTea.jsp");
				return mav;
	}
	@RequestMapping( value="/registClass.do")
	public ModelAndView registClass( 
			){
				ModelAndView mav = new ModelAndView();
				mav.setViewName("registClass.jsp");
				return mav;
	}
	

	
}


