package com.kimi.workstm.dept.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kimi.workstm.common.domain.DeptVO;
import com.kimi.workstm.common.utils.TreeMaker;
import com.kimi.workstm.dept.service.DeptSvc;
import com.kimi.workstm.member.service.MemberSvc;

@Controller
public class DeptCtr {
	
	@Autowired
	private DeptSvc deptSvc;
	@Autowired
	private MemberSvc memberSvc;
	
	TreeMaker tm = new TreeMaker();
	
	/**
	 * @메서드 명 	: deptList
	 * @작성자 	: 정훈구
	 * @작성일 	: 2018. 11. 23.
	 * @param modelMap
	 * 조직 관리 페이지
	 */
	@RequestMapping(value = "/deptMgmt", method = RequestMethod.GET)
	public String deptMgmt() throws Exception {
		return "dept/deptMgmt";
	}
	
	/**
	 * @메서드 명 	: getDeptDate
	 * @작성자 	: 정훈구
	 * @작성일 	: 2018. 11. 23.
	 * @param modelMap
	 * 현재 모든 부서 목록 리스트
	 */
	@RequestMapping(value = "/getTreeData", method = RequestMethod.POST)
	public ModelAndView getDeptDate() throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("treeStr", tm.makeTreeByHierarchy(deptSvc.deptTreeGrid()));
		return mav;
	}
	
	/**
	 * @메서드 명 	: popupDeptForm
	 * @작성자 	: 정훈구
	 * @작성일 	: 2018. 11. 23.
	 * @param pMap
	 * @param modelMap
	 * 부서 팝업 생성
	 */
	@RequestMapping(value = "/popupDeptForm", method = RequestMethod.POST)
	public ModelAndView popupDeptForm(@RequestParam Map<String, Object> pMap ) throws  Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		mav.addObject("treeStr", tm.makeTreeByHierarchy(deptSvc.deptTreeGrid()));
		mav.addObject("selectDept", deptSvc.deptInfo(pMap));
		
		return mav; 
	}
	
	/**
	 * @메서드 명 	: deptParentList
	 * @작성자 	: 정훈구
	 * @작성일 	: 2018. 11. 23.
	 * 부모 부서 리스트 가져오기
	 */
	@RequestMapping(value = "/deptParentList", method = RequestMethod.POST)
	public ModelAndView deptParentList() throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("deptParentList", deptSvc.deptParentList());
		return mav;
	}
	
	/**
	 * @메서드 명 	: deptSave
	 * @작성자 	: 정훈구
	 * @작성일 	: 2018. 11. 23.
	 * @param pMap
	 * @param model
	 * 부서 등록
	 */
	@RequestMapping(value = "/deptSave", method = RequestMethod.POST)
	public ModelAndView deptSave(DeptVO pMap ) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		Map<String, String> result = deptSvc.insertDeptInfo(pMap);
		mav.addObject("result", result);
		mav.addObject("treeStr", tm.makeTreeByHierarchy(deptSvc.deptTreeGrid()));
		return mav;
	}
	
	/**
	 * @메서드 명 	: deptDelete
	 * @작성자 	: 정훈구
	 * @작성일 	: 2018. 11. 23.
	 * @param pMap
	 * @param modelMap
	 * 부서 삭제
	 */
	@RequestMapping(value = "/deptDelete", method = RequestMethod.POST)
	public ModelAndView deptDelete(DeptVO pMap ) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		Map<String, String> result = deptSvc.deleteDept(pMap);
		mav.addObject("result", result);
		mav.addObject("treeStr", tm.makeTreeByHierarchy(deptSvc.deptTreeGrid()));
		return mav;
	}
	
	/**
	 * @메서드 명 	: deptEdit
	 * @작성자 	: 정훈구
	 * @작성일 	: 2018. 11. 23.
	 * @param pMap
	 * @param modelMap
	 * 부서 수정
	 */
	@RequestMapping(value = "/deptEdit", method = RequestMethod.POST)
	public ModelAndView deptEdit(DeptVO pMap ) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		Map<String, String> result = deptSvc.updateDept(pMap);
		mav.addObject("result", result);
		mav.addObject("treeStr", tm.makeTreeByHierarchy(deptSvc.deptTreeGrid()));
		return mav;
	}
	
	/**
	 * @메서드 명 	: deptListDelete
	 * @작성자 	: 정훈구
	 * @작성일 	: 2018. 11. 23.
	 * @param deptCodeList
	 * @param pMap
	 * @param modelMap
	 * 부서 체크 목록 삭제
	 */
	@RequestMapping(value = "/deptListDelete", method = RequestMethod.POST)
	public ModelAndView deptListDelete(@RequestParam List<String> deptCodeList, DeptVO pMap ) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		Map<String, String> result = deptSvc.deleteDeptList(deptCodeList, pMap);
		mav.addObject("result", result);
		mav.addObject("treeStr", tm.makeTreeByHierarchy(deptSvc.deptTreeGrid()));
		return mav;
	}
}
