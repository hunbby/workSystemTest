package com.kimi.workstm.commCd.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kimi.workstm.commCd.domain.CommCdVO;
import com.kimi.workstm.commCd.service.CommCdSvc;

@Controller
public class CommCdCtr {

	static final Logger LOGGER = LoggerFactory.getLogger(CommCdCtr.class);
	@Autowired
	private CommCdSvc commCdSvc;

	@RequestMapping(value = "/commCd/commCdList", method = RequestMethod.GET)
	public String commCdList(ModelMap modelMap) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		List<CommCdVO> getList = commCdSvc.commCdGetDtl(map);

		modelMap.addAttribute("list", getList);

		return "commCd/commCdList";
	}

	@RequestMapping(value = "/commCd/commCdRgst", method = { RequestMethod.GET, RequestMethod.POST })
	public String commCdRgst(Model model) throws Exception {

		return "commCd/commCdRgst";
	}

	@RequestMapping(value = "/commCd/commCdWrite")
	public String commCdWrite(CommCdVO commCdVo) throws Exception {

		int result = commCdSvc.commCdWrite(commCdVo);

		return "redirect:/commCd/commCdList";
	}

	@RequestMapping(value = "/commCd/commCdDetail", method = RequestMethod.GET)
	public String commCdDetail(CommCdVO commCdVo, Model model) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		CommCdVO getList = commCdSvc.commCdDetail(commCdVo);

		model.addAttribute("list", getList);

		return "commCd/commCdChg";
	}

	@RequestMapping(value = "/commCd/commCdUp")
	public String commCdUpdate(@ModelAttribute("CommCdVO") CommCdVO commCdVo, Model model) throws Exception {
		commCdSvc.commCdUpdate(commCdVo);

		return "redirect:/commCd/commCdList";
	}

	@RequestMapping(value = "/commCd/commCdDelete", method = { RequestMethod.POST })
	public String commCdDelete(@ModelAttribute("CommCdVO") CommCdVO commCdVo, Model model) throws Exception {

		int result = commCdSvc.commCdDelete(commCdVo);

		return "redirect:/commCd/commCdList";
	}

	@RequestMapping(value = "/commCd/cdChk", method = RequestMethod.POST) // URL과 메서드를 매핑할때 사용하며 POST로 파라미터를 받는다.
	public ModelAndView cdChk(@RequestBody Map<String, String> checkVal) {
		// 결과를 화면에 던져줘야된다.
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("checkVal", commCdSvc.cdChk(checkVal));
		return mav;
	}

}
