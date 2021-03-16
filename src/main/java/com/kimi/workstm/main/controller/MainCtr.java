package com.kimi.workstm.main.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kimi.workstm.common.domain.UserVO;
import com.kimi.workstm.main.service.serviceImpl.MainSvcImpl;
import com.kimi.workstm.notice.service.serviceImpl.NoticeSvcImpl;
import com.kimi.workstm.projects.service.ProjectSvc;


@Controller 
public class MainCtr {

	@Autowired
	 private MainSvcImpl mainSvc;
	@Autowired
	private NoticeSvcImpl noticeSvc;
	@Autowired
	private ProjectSvc pjtSvc;

	 @RequestMapping(value = "/main/mainList", method = RequestMethod.GET)
	 public String mainList(ModelMap modelMap) throws Exception {
	/*	 	Map<String, Object> map = new HashMap<String, Object>(); 
			List<WeekDtlVO> getList = mainSvc.mainGetDtl(map); */
	
	/*		Date today = Util4calen.getToday(); 
		    calCalen(today, modelMap);*/
		     
	/*	    modelMap.addAttribute("list", getList); */
		 
		 return "main/mainList";
	 }
 
	 @RequestMapping(value = "/main/pjtTerm", method = RequestMethod.POST)
	 public ModelAndView getPjtTerm(UserVO pMap, HttpSession session) throws Exception {
		 ModelAndView mav = new ModelAndView("jsonView");
		 pMap.setUserCode((String)session.getAttribute("userCode"));
		 mav.addObject("pjtTerm", pjtSvc.pjtTerms(pMap));
		 return mav;
	 }

}
