package com.kimi.workstm.login.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kimi.workstm.common.domain.DateVO;
import com.kimi.workstm.common.domain.LoginVO;
import com.kimi.workstm.common.domain.UserVO;
import com.kimi.workstm.common.utils.Util4calen;
import com.kimi.workstm.login.service.LoginSvc;


/**
 * Handles requests for the application home page.
 */
@Controller
public class LoginCtr {

	@Autowired
	private LoginSvc loginService;

	/**
	 * @메서드 명 	: index
	 * @작성자 	: 정훈구
	 * @작성일 	: 2018. 11. 6.
	 * @param locale
	 * @param model
	 * 첫 페이지 (로그인 화면)
	 */
	@RequestMapping(value = "/")
	public String index(Locale locale, Model model) {
		return "login/login";
	}
	@RequestMapping(value = "/loginPage")
	public String loginPage(Locale locale, Model model) {
		return "login/login";
	}
	
	/**
	 * @메서드 명 	: LoginCheck
	 * @작성자 	: 정훈구
	 * @작성일 	: 2018. 11. 6.
	 * @param request
	 * @param response
	 * @param loginInfo
	 * @param modelMap
	 * 
	 * 로그인 체크
	 * 로그인 여부만 session 에 저장하도록 변경 예정
	 */
	@RequestMapping(value = "/memberLoginChk", method = RequestMethod.POST)
	public ModelAndView LoginCheck(HttpServletRequest request,HttpServletResponse response
			,LoginVO loginInfo ) throws Exception {
		
		ModelAndView mav = new ModelAndView("jsonView");
		LoginVO mdo = loginService.loginCheck(loginInfo);
        if (mdo  == null) {
        	mav.addObject("result", "fail");
        	mav.addObject("msg", "로그인 정보를 확인하세요");
        } else {
        	mav.addObject("result", "success");
            HttpSession session = request.getSession();
            session.setAttribute("userID", mdo.getUserID());
            session.setAttribute("userCode",  mdo.getUserCode());
            session.setAttribute("userNm",  mdo.getUserNm());
            session.setAttribute("deptCode",  mdo.getDeptCode());
            session.setAttribute("userAuth",  mdo.getUserAuth());
            //로그인 여부만 session 에 저장하도록 변경 예정
        }
//        return "redirect:/main/mainList";
        return mav;
	}
	

	
	/**
	 * @메서드 명 	: memberLogout
	 * @작성자 	: 정훈구
	 * @작성일 	: 2018. 11. 9.
	 * @param request
	 * @param modelMap
	 * 로그아웃
	 */
	@RequestMapping(value = "/memberLogout", method = RequestMethod.GET)
	public String memberLogout(HttpServletRequest request, ModelMap modelMap) {
        HttpSession session = request.getSession();
        
        session.removeAttribute("userID"); 
        session.removeAttribute("userCode");        
        session.removeAttribute("userNm");        
        session.removeAttribute("deptCode");
        
        return "redirect:/";
	}
	

}
