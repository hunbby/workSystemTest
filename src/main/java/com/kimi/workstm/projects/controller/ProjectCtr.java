package com.kimi.workstm.projects.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kimi.workstm.common.domain.PageVO;
import com.kimi.workstm.common.domain.ProjectVO;
import com.kimi.workstm.common.domain.UserVO;
import com.kimi.workstm.common.utils.TreeMaker;
import com.kimi.workstm.dept.service.DeptSvc;
import com.kimi.workstm.enterprise.service.EnterpriseSvc;
import com.kimi.workstm.member.service.MemberSvc;
import com.kimi.workstm.projects.service.ProjectSvc;

@Controller
public class ProjectCtr {
	@Autowired
	private ProjectSvc projectSvc;
	@Autowired
	private EnterpriseSvc enSvc;
	@Autowired
	private MemberSvc memberSvc;
	@Autowired
	private DeptSvc deptSvc;

	
	@RequestMapping(value = "/projectMgmt")
	public String projectMgmt() {
		return "projects/projectList";
	}
	
	@RequestMapping(value = "/projectForm")
	public String projectForm() {
		return "projects/projectForm";
	}
	
	@RequestMapping(value = "/projectList", method = RequestMethod.POST)
	public ModelAndView projectList(@RequestParam Map<String, Object> pMap, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");

		pMap.put("userAuth", (String)session.getAttribute("userAuth"));
		pMap.put("userCode", (String)session.getAttribute("userCode"));
		Map<String, Object> rMap = projectSvc.listProject(pMap);
		mav.addObject("listView", rMap.get("pjtList"));
		mav.addObject("totalPageCnt", rMap.get("totalPageCnt"));
		return mav;
	}
	
	@RequestMapping(value = "/getProjectInfo", method = RequestMethod.POST)
	public ModelAndView getProjectInfo(ProjectVO pMap) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("projectInfo", projectSvc.getProjectInfo(pMap));
		return mav;
	}
	
	/**
	 * @param pMap
	 * @return
	 * @throws Exception
	 * 2018-01-01 에러 뜰거임
	 */
	@RequestMapping(value = "/popupEnterprise", method = RequestMethod.POST)
	public ModelAndView popupEnterprise(@RequestParam Map<String, Object> pMap) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		Map<String, Object> rMap =  enSvc.enterpriseList(pMap);
		
		mav.addObject("epListView", rMap.get("enList"));
		mav.addObject("totalPageCnt", rMap.get("totalPageCnt"));

		return mav;
	}

	@RequestMapping(value = "/popupUserList", method = RequestMethod.POST)
	public ModelAndView popupUserList(@RequestParam Map<String, Object> pMap) throws Exception {
		TreeMaker tm = new TreeMaker();
		Map<String, Object> rMap = memberSvc.getDeptUserList(pMap);
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("treeStr", tm.makeTreeByHierarchy(deptSvc.deptTreeGrid()));
		mav.addObject("userListView", rMap.get("userList"));
		mav.addObject("totalPageCnt", rMap.get("totalPageCnt"));

		return mav;
	}
	
	@RequestMapping(value = "/projectSave", method = RequestMethod.POST)
	public ModelAndView projectSave(@RequestParam Map<String, Object> pMap) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("result", projectSvc.insertProject(pMap));
		return mav;
	}
	
	@RequestMapping(value = "/projectEdit", method = RequestMethod.POST)
	public ModelAndView projectEdit(@RequestParam Map<String, Object> pMap) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("result", projectSvc.updateProjectInfo(pMap));
		return mav;
	}
	
	@RequestMapping(value = "/projectDelete", method = RequestMethod.POST)
	public ModelAndView projectDelete(@RequestParam Map<String, Object> pMap) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("result", projectSvc.deleteProjectInfo(pMap));
		return mav;
	}
}
