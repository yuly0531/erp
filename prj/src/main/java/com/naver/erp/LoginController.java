package com.naver.erp;

import java.io.Console;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	@Autowired
	private LoginDAO loginDAO;   
	@RequestMapping( value="/loginForm.do")
	public ModelAndView loginForm(
			HttpSession session){
		ModelAndView mav = new ModelAndView();
		mav.setViewName( "loginForm.jsp" );
		return mav;
	}

	@RequestMapping( 
			value="/stu_loginProc.do" 
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public int stu_loginProc( 
			@RequestParam( value="stu_id") String stu_id
			,@RequestParam( value="stu_pwd") String stu_pwd
			,@RequestParam( value="autoLogin", required=false  ) String autoLogin
			,HttpSession session
			,HttpServletResponse response
	){

		Map<String,String> map = new HashMap<String,String>();
		map.put("stu_id", stu_id);
		map.put("stu_pwd", stu_pwd);	
		int stu_loginIdCnt = this.loginDAO.stu_LoginIdCnt(map);
		if(stu_loginIdCnt==1){
			session.setAttribute( "stu_id", stu_id );
			if(autoLogin==null ||  autoLogin == ""){
				Cookie cookie1 = new Cookie("stu_id",null);
				cookie1.setMaxAge(0);
				Cookie cookie2 = new Cookie("stu_pwd",null);
				cookie2.setMaxAge(0);
				response.addCookie(cookie1);
				response.addCookie(cookie2);
			}
			else {
				Cookie cookie1 = new Cookie("stu_id",stu_id);
				cookie1.setMaxAge(60*60*24);
				Cookie cookie2 = new Cookie("stu_pwd",stu_pwd);
				cookie2.setMaxAge(60*60*24);
				response.addCookie(cookie1);
				response.addCookie(cookie2);
			}
		}
		return stu_loginIdCnt;
	}
	//////////////////////////////////////////
	@RequestMapping( 
			value="/tea_loginProc.do" 
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public int tea_loginProc( 
			@RequestParam( value="tea_id" ) String tea_id
			,@RequestParam( value="tea_pwd") String tea_pwd
			,@RequestParam( value="autoLogin", required=false  ) String autoLogin
			,HttpSession session
			,HttpServletResponse response
	){
		
	
		Map<String,String> map = new HashMap<String,String>();
		map.put("tea_id", tea_id);
		map.put("tea_pwd", tea_pwd);
		int tea_loginIdCnt = this.loginDAO.tea_LoginIdCnt(map);
		
		if(tea_loginIdCnt==1){
			session.setAttribute( "tea_id", tea_id );
			if(autoLogin==null ||  autoLogin == ""){
				Cookie cookie1 = new Cookie("tea_id",null);
				cookie1.setMaxAge(0);
				Cookie cookie2 = new Cookie("tea_pwd",null);
				cookie2.setMaxAge(0);
				response.addCookie(cookie1);
				response.addCookie(cookie2);
			}
			else {
				Cookie cookie1 = new Cookie("tea_id",tea_id);
				cookie1.setMaxAge(60*60*24);
				Cookie cookie2 = new Cookie("tea_pwd",tea_pwd);
				cookie2.setMaxAge(60*60*24);
				response.addCookie(cookie1);
				response.addCookie(cookie2);
			}
		}
		System.out.println(tea_id);
		return tea_loginIdCnt;
	}
	
	//////////////////////////////////////////////
	@RequestMapping( 
			value="/mana_loginProc.do" 
			,method=RequestMethod.POST
			,produces="application/json;charset=UTF-8"
	)
	@ResponseBody
	public int mana_loginProc( 
			@RequestParam( value="mana_id" ) String mana_id
			,@RequestParam( value="mana_pwd") String mana_pwd
			,@RequestParam( value="autoLogin", required=false  ) String autoLogin
			,HttpSession session
			,HttpServletResponse response
	){
		
	
		Map<String,String> map = new HashMap<String,String>();
		map.put("mana_id", mana_id);
		map.put("mana_pwd", mana_pwd);
		int mana_loginIdCnt = this.loginDAO.mana_LoginIdCnt(map);
		
		if(mana_loginIdCnt==1){
			session.setAttribute( "mana_id", mana_id );
			if(autoLogin==null ||  autoLogin == ""){
				Cookie cookie1 = new Cookie("mana_id",null);
				cookie1.setMaxAge(0);
				Cookie cookie2 = new Cookie("mana_pwd",null);
				cookie2.setMaxAge(0);
				response.addCookie(cookie1);
				response.addCookie(cookie2);
			}
			else {
				Cookie cookie1 = new Cookie("mana_id",mana_id);
				cookie1.setMaxAge(60*60*24);
				Cookie cookie2 = new Cookie("mana_pwd",mana_pwd);
				cookie2.setMaxAge(60*60*24);
				response.addCookie(cookie1);
				response.addCookie(cookie2);
			}
		}
		System.out.println(mana_id);
		return mana_loginIdCnt;
	}
}