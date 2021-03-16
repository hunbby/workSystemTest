package com.kimi.workstm.notice.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kimi.workstm.notice.domain.NoticeVO;
import com.kimi.workstm.notice.service.NoticeSvc;

@Controller
public class NoticeCtr {

	static final Logger LOGGER = LoggerFactory.getLogger(NoticeCtr.class);

	@Autowired
	private NoticeSvc noticeSvc;

	@RequestMapping(value = "/notice/noticePage")
	public String noticePage() {
		return "notice/noticeList";
	}

	@RequestMapping("/notice/noticeList")
	public ModelAndView noticeList() throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		Map<String, Object> map = new HashMap<String, Object>();
		mav.addObject("list", noticeSvc.noticeGetDtl(map));
		return mav;
	}

	@RequestMapping(value = "/notice/noticeRgst", method = { RequestMethod.GET })
	public String noticeRgst(Model model) throws Exception {

		return "notice/noticeRgst";

	}

	@RequestMapping(value = "/notice/noticeWrite", method = { RequestMethod.POST })
	public ModelAndView noticeWrite(NoticeVO noticeVo, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		noticeVo.setUserCode((String) session.getAttribute("userCode"));

		ModelAndView mav = new ModelAndView("jsonView");
		Map<String, Object> map = new HashMap<String, Object>();
		mav.addObject("list", noticeSvc.noticeWrite(noticeVo));
		return mav;

	}

	@RequestMapping(value = "/notice/noticeDetail")
	public ModelAndView noticeDetail(NoticeVO noticeVo, Model model) throws Exception {

		ModelAndView mav = new ModelAndView("jsonView");
		Map<String, Object> map = noticeSvc.noticeDetail(noticeVo);
		mav.addObject("list", map.get("result"));
		mav.addObject("msg", map.get("msg"));

		System.out.println("치환하는과정:" + ((NoticeVO) map.get("result")).toString());

		return mav;
	}

	@RequestMapping(value = "/notice/noticeUp")
	public ModelAndView noticeUpdate(NoticeVO noticeVo, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("list", noticeSvc.noticeUpdate(noticeVo));
		return mav;

	}

	@RequestMapping(value = "/notice/noticeDelete", method = { RequestMethod.POST })
	public ModelAndView noticeDelete(NoticeVO noticeVo, Model model) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("list", noticeSvc.noticeDelete(noticeVo));
		return mav;

	}

	@RequestMapping(value = "/main/popupNotice")
	public ModelAndView popupNotice(NoticeVO noticeVo, ModelMap modelMap) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		Map<String, Object> map = noticeSvc.popupNotice(noticeVo);

		mav.addObject("list", map.get("result"));
		mav.addObject("msg", map.get("msg"));

		return mav;
	}

}
