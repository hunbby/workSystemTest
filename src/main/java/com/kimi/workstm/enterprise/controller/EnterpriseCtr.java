package com.kimi.workstm.enterprise.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kimi.workstm.common.domain.EnterpriseVO;
import com.kimi.workstm.common.utils.CommandMap;
import com.kimi.workstm.enterprise.service.EnterpriseSvc;

@Controller
public class EnterpriseCtr {
	@Autowired
	private EnterpriseSvc enterprisesvc;
	
	
	/**
	 * @메서드 명 	: enterprisePage
	 * @작성자 	: 정훈구
	 * @작성일 	: 2018. 11. 23.
	 * 업체 관리 페이지 이동
	 */
	@RequestMapping(value = "/enterprisePage")
	public String enterprisePage() throws Exception {
		return "enterprise/enterpriseList";
	}

	/**
	 * @메서드 명 	: enterpriseList
	 * @작성자 	: 정훈구
	 * @작성일 	: 2018. 11. 23.
	 * @param modelMap
	 * 업체 리스트
	 */
	@RequestMapping(value = "/enterpriseList", method = RequestMethod.POST)
	public ModelAndView enterpriseList(@RequestParam Map<String, Object> pMap) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		Map<String, Object> rMap = enterprisesvc.enterpriseList(pMap);
		mav.addObject("listView", rMap.get("enList"));
		mav.addObject("totalPageCnt", rMap.get("totalPageCnt"));

		return mav;
	}
	
	/**
	 * @메서드 명 	: getEnterprise
	 * @작성자 	: 정훈구
	 * @작성일 	: 2018. 11. 23.
	 * @param pMap
	 * @param modelMap
	 * 업체 단일 데이터
	 */
	@RequestMapping(value = "/getEnterprise", method = RequestMethod.POST)
	public ModelAndView getEnterprise(EnterpriseVO pMap ) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");

		mav.addObject("result", enterprisesvc.getEnterPrise(pMap));
		
		return mav;
	}
	
	/**
	 * @메서드 명 	: enterpriseSave
	 * @작성자 	: 정훈구
	 * @작성일 	: 2018. 11. 23.
	 * @param pMap
	 * @param modelMap
	 * 업체 저장
	 */
	@RequestMapping(value = "/enterpriseSave", method = RequestMethod.POST)
	public ModelAndView enterpriseSave(EnterpriseVO pMap ) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		mav.addObject("result", enterprisesvc.insertEnterprise(pMap));
		
		return mav;
	}
	
	/**
	 * @메서드 명 	: enterpriseDelete
	 * @작성자 	: 정훈구
	 * @작성일 	: 2018. 11. 23.
	 * @param pMap
	 * @param modelMap
	 * 업체 삭제
	 */
	@RequestMapping(value = "/enterpriseDelete", method = RequestMethod.POST)
	public ModelAndView enterpriseDelete(EnterpriseVO pMap ) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("result", enterprisesvc.deleteEnterprise(pMap));
		return mav;
	}
	
	/**
	 * @메서드 명 	: enterpriseEdit
	 * @작성자 	: 정훈구
	 * @작성일 	: 2018. 11. 23.
	 * @param pMap
	 * @param modelMap
	 * 업체 수정
	 */
	@RequestMapping(value = "/enterpriseEdit", method = RequestMethod.POST)
	public ModelAndView enterpriseEdit(EnterpriseVO pMap) throws Exception {
		System.out.println("------------ " + pMap);
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("result", enterprisesvc.updateEnterprise(pMap));
		
		return mav;
	}
}
