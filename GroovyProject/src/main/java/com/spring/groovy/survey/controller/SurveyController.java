package com.spring.groovy.survey.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.groovy.management.model.MemberVO;
import com.spring.groovy.survey.model.AskVO;
import com.spring.groovy.survey.model.JoinSurveyVO;
import com.spring.groovy.survey.model.SurveyVO;
import com.spring.groovy.survey.service.InterSurveyService;

@Controller
public class SurveyController {

	@Autowired   // Type 에 따라 알아서 Bean 을 주입해준다.
	private InterSurveyService service;
	
	
	// 설문리스트 목록
	@RequestMapping(value="/survey/surveyList.on")
	public ModelAndView surveyList(ModelAndView mav, HttpServletRequest request, JoinSurveyVO jvo) {
		
		Map<String,Object> paramap = new HashMap<>();
		paramap.put("jvo",jvo);
		
		List<SurveyVO> surveyList = service.surveyList(paramap);
		mav.addObject("surveyList", surveyList);
		
		mav.setViewName("survey/public/surveyList.tiles");
		return mav;
	}
	
	// 설문리스트 - 설문참여
	@RequestMapping(value="/survey/surveyJoin.on")
	public String surveyJoin(HttpServletRequest request) {
		
		
		return "survey/public/surveyJoin.tiles";
	}
	
	
	// 관리자 - 설문작성1
	@RequestMapping(value="/survey/surveyWriting.on")
	public ModelAndView surveyWriting(ModelAndView mav, HttpServletRequest request,MemberVO mvo) {
		mav.setViewName("survey/admin/surveyWriting.tiles");
		return mav;
	}
	
	// 관리자 - 설문작성2
	@RequestMapping(value="/survey/surveyWritingEnd.on")
	public ModelAndView surveyWritingEnd(ModelAndView mav, HttpServletRequest request,SurveyVO svo, MemberVO mvo) {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		String empno = loginuser.getEmpno();
		
		String surtitle = request.getParameter("surtitle");
		String surexplain = request.getParameter("surexplain");
		String surstart = request.getParameter("surstart");
		String surend = request.getParameter("surend");
		String surtarget = request.getParameter("surtarget");
		String suropenstatus = request.getParameter("suropenstatus");
		String fk_department_no = request.getParameter("fk_department_no");
	
		Map<String,Object> paramap = new HashMap<>();
		paramap.put("empno", empno);
		paramap.put("surtitle", surtitle);
		paramap.put("surexplain", surexplain);
		paramap.put("surstart", surstart);
		paramap.put("surend", surend);
		paramap.put("surtarget", surtarget);
		paramap.put("suropenstatus", suropenstatus);
		paramap.put("fk_department_no", fk_department_no);
		
		mav.addObject("paramap", paramap);
		mav.setViewName("survey/admin/surveyWritingEnd.tiles");
		
		return mav;
	}
	
	// 관리자 - 설문작성(설문번호)
		@ResponseBody
		@RequestMapping(value="/survey/surveyWritingNo.on")
		public String surveyWritingNo( HttpServletRequest request,SurveyVO svo, MemberVO mvo) {
	
			// 관리자 - 설문작성(설문조사 번호 insert하기)
			Map<String, Object>paramap = new HashMap<>();
			paramap.put("svo", svo);
			
			// 관리자 - 설문작성(설문번호) 이곳에서 결과값이 true인지 아닌지 설정
			String fk_surno = service.addSurvey(paramap);
			
			JSONObject json = new JSONObject();
			json.put("fk_surno", fk_surno);
			
			return json.toString();
		}
		

	// 관리자 - 설문작성(질문번호)
	@ResponseBody
	@RequestMapping(value="/survey/surveyWritingFinish.on")
	public String surveyWritingFinish( HttpServletRequest request, AskVO avo) {
		
		String ajax_fk_surno = request.getParameter("ajax_fk_surno");
	
		System.out.println(ajax_fk_surno);
		
		// 관리자 - 설문작성(한 문항씩 insert하기)
		Map<String,Object> paramap = new HashMap<>();
		paramap.put("avo", avo);
		paramap.put("ajax_fk_surno", ajax_fk_surno);
				
		// 관리자 - 설문작성(한 문항씩 insert하기)
		int p = service.getAskList(paramap);
		
		JSONObject json = new JSONObject();
		json.put("p", p);
	
		return json.toString();
	}
	
	
	
	
	
	// 관리자 - 설문관리
	@RequestMapping(value="/survey/surveyManage.on")
	public ModelAndView surveyManage(ModelAndView mav, HttpServletRequest request,SurveyVO svo) {
		
		
		mav.setViewName("survey/admin/surveyManage.tiles");
		return mav;
	}
	
	// 관리자 - 설문관리
	@RequestMapping(value="/survey/surveyManageView.on")
	public String surveyManageView(HttpServletRequest request) {
		
		return "survey/admin/surveyManageView.tiles";
	}
	
	
	// ================================================================================= //

	
	@ExceptionHandler(org.springframework.validation.BindException.class)
	public String error(Exception e) {
		e.printStackTrace();
		return "error";
	}


	
}
