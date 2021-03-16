package com.kimi.workstm.member.controller;

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
import com.kimi.workstm.common.domain.UserVO;
import com.kimi.workstm.common.utils.TreeMaker;
import com.kimi.workstm.dept.service.DeptSvc;
import com.kimi.workstm.member.service.MemberSvc;

@Controller
public class MemberCtr {
	@Autowired
	private MemberSvc memberSvc;
	@Autowired
	private DeptSvc deptSvc;

	/**
	 * @메서드 명 	: popupUserForm
	 * @작성자 	: 정훈구
	 * @작성일 	: 2018. 11. 23.
	 * @param pMap
	 * @param modelMap
	 * 사용자 관리 팝업 생성
	 */
	@RequestMapping(value = "/popupUserForm", method = RequestMethod.POST)
	public ModelAndView popupUserForm(UserVO pMap ) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		TreeMaker tm = new TreeMaker();
		mav.addObject("userInfo", memberSvc.getUser(pMap));
		mav.addObject("treeStr", tm.makeTreeByHierarchy(deptSvc.deptTreeGrid()));
		
		return mav;
	}

	/**
	 * @메서드 명 	: userSave
	 * @작성자 	: 정훈구
	 * @작성일 	: 2018. 11. 23.
	 * @param pMap
	 * @param model
	 * 사용자 등록
	 */
	@RequestMapping(value = "/userSave", method = RequestMethod.POST)
	public ModelAndView userSave(UserVO pMap ) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		mav.addObject("result", memberSvc.userInsertInfo(pMap));

		return mav;
	}

	/**
	 * @메서드 명 	: userEdit
	 * @작성자 	: 정훈구
	 * @작성일 	: 2018. 11. 23.
	 * @param pMap
	 * @param model
	 * 사용자 수정
	 */
	@RequestMapping(value = "/userEdit", method = RequestMethod.POST)
	public ModelAndView userEdit(UserVO pMap ) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		mav.addObject("result", memberSvc.updateUserInfo(pMap));
		
		return mav;
	}

	/**
	 * @메서드 명 	: userDelete
	 * @작성자 	: 정훈구
	 * @작성일 	: 2018. 11. 23.
	 * @param pMap
	 * @param model
	 * 사용자 삭제
	 */
	@RequestMapping(value = "/userDelete", method = RequestMethod.POST)
	public ModelAndView userDelete(UserVO pMap ) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("result", memberSvc.deleteuserInfo(pMap));

		return mav;
	}

	/**
	 * @메서드 명 	: getDeptUserList
	 * @작성자 	: 정훈구
	 * @작성일 	: 2018. 11. 23.
	 * @param pMap
	 * @param modelMap
	 * 해당 부서 사용자 리스트
	 */
	@RequestMapping(value = "/getDeptUserList", method = RequestMethod.POST)
	public ModelAndView getDeptUserList(@RequestParam Map<String, Object> pMap ) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		Map<String, Object> rMap =  memberSvc.getDeptUserList(pMap);
		//mav.addObject("listview", memberSvc.getDeptUserList(pMap));
		mav.addObject("listview", rMap.get("userList"));
		mav.addObject("totalPageCnt", rMap.get("totalPageCnt"));
		return mav;
	}
	
	@RequestMapping(value = "/checkId", method = RequestMethod.POST)
	public ModelAndView checkId(UserVO pMap) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("result", memberSvc.checkId(pMap));
		return mav;
	}

}
