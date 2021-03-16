package com.kimi.workstm.work.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kimi.workstm.common.domain.DateVO;
import com.kimi.workstm.common.domain.UserVO;
import com.kimi.workstm.common.utils.Util4calen;
import com.kimi.workstm.member.service.MemberSvc;
import com.kimi.workstm.projects.service.ProjectSvc;
import com.kimi.workstm.work.domain.WeekDtlVO;
import com.kimi.workstm.work.service.serviceImpl.WeekSvcImpl;

@Controller 
public class WeekCtr {
	
	static final Logger LOGGER = LoggerFactory.getLogger(WeekCtr.class);
	@Autowired
	 private WeekSvcImpl weekSvc;
	@Autowired
	private ProjectSvc projectSvc;
	@Autowired
	private MemberSvc memberSvc;
		/**
		 * 
		 * <pre>
		 * 1. 메소드명	: weekList
		 * 2. 작성일	: 2018. 11. 06. 오후 18:25:00	 
		 * 3. 작성자	: 정훈구
		 * 4. 설명	:  업무 리스트
		 * </pre>
		 * 
		 */
	 @RequestMapping(value = "/work/week", method = RequestMethod.GET)
	 public String weekList(WeekDtlVO weekDtlVo, HttpServletRequest request, ModelMap modelMap) throws Exception {
		 	
		 HttpSession session = request.getSession();
		 weekDtlVo.setUserCode((String) session.getAttribute("userCode"));
		 weekDtlVo.setUserAuth((String) session.getAttribute("userAuth")); // 2018-12-26 정훈구 사용자 권한 추가
		 
		 Map<String, Object> map = new HashMap<String, Object>();
		 List<WeekDtlVO> getList = weekSvc.weekGetDtl(weekDtlVo); 
	
		 modelMap.addAttribute("list", getList); 
		 
		 return "work/week";
	 }
	 
	 

	    
	 
		/**
		 * 
		 * <pre>
		 * 1. 메소드명	: weekRgst
		 * 2. 작성일	: 2018. 11. 07
		 * 3. 작성자	: 정훈구
		 * 4. 설명	: 리스트 등록 페이지
		 * </pre>
		 * @param map
		 * @param req
		 * @param session
		 * @return
		 */	
		@RequestMapping(value = "/work/weekRgst"  , method = {RequestMethod.GET, RequestMethod.POST})
		public String weekRgst(Model model) throws Exception {
	
			return "work/weekRgst";
		}

		/**
		 * 
		 * <pre>
		 * 1. 메소드명	: weekWrite
		 * 2. 작성일	: 2018. 11. 07
		 * 3. 작성자	: 정훈구
		 * 4. 설명	: 리스트 등록 기능
		 * </pre>
		 * @param map
		 * @param req
		 * @param session
		 * @return
		 */	
		@RequestMapping(value = "/work/weekWrite")
		public String weekWrite(WeekDtlVO weekDtlVo, HttpServletRequest request) throws Exception {
			System.out.println("------------------------------------------" + weekDtlVo);
			
			 HttpSession session = request.getSession();
			 weekDtlVo.setUserCode((String) session.getAttribute("userCode"));
			 
			 int result = weekSvc.weekWrite(weekDtlVo);
		
			return "redirect:/work/week";
		}
		
		
		/**
		 * 
		 * <pre>
		 * 1. 메소드명	: weekDetail
		 * 2. 작성일	: 2018. 11. 08
		 * 3. 작성자	: 정훈구
		 * 4. 설명	: 리스트 상세 페이지+db정보 조회
		 * </pre>
		 * @param map
		 * @param req
		 * @param session
		 * @return
		 */	

		@RequestMapping(value = "/work/weekDetail" , method = RequestMethod.GET)
		public String weekDetail( HttpServletRequest request , WeekDtlVO weekDtlVo ,Model model) throws Exception{
			
			HttpSession session = request.getSession();
			weekDtlVo.setUserCode((String) session.getAttribute("userCode"));
			
			Map<String, Object> map = new HashMap<String, Object>(); 
			WeekDtlVO getList = weekSvc.weekDetail(weekDtlVo);  
			
		    model.addAttribute("list", getList); 
		    
			return "work/weekChg";
		}	
		
		/**
		 * 
		 * <pre>
		 * 1. 메소드명	: weekUpdate
		 * 2. 작성일	: 2018. 11. 09
		 * 3. 작성자	: 정훈구
		 * 4. 설명	: 수정기능
		 * </pre>
		 * @param map
		 * @param req
		 * @param session
		 * @return
		 */	
		
		
		@RequestMapping(value="/work/weekUp" )
		public String weekUpdate(@ModelAttribute("WeekDtlVO") WeekDtlVO weekDtlVo,  HttpServletRequest request, Model model) throws Exception{
			 
			HttpSession session = request.getSession();
			weekDtlVo.setUserCode((String) session.getAttribute("userCode"));
			
			weekSvc.weekUpdate(weekDtlVo);

			return "redirect:/work/week";
		}
		
		
		/**
		 * 
		 * <pre>
		 * 1. 메소드명	: weekDelete
		 * 2. 작성일	: 2018. 7. 26
		 * 3. 작성자	: 정훈구
		 * 4. 설명	: 삭제 기능(상세 페이지에서 삭제)
		 * </pre>
		 * @param map
		 * @param req
		 * @param session
		 * @return
		 */	
		
		@RequestMapping(value = "/work/weekDelete"  , method = {RequestMethod.POST})
		public String weekDelete(@ModelAttribute("WeekDtlVO") WeekDtlVO weekDtlVo,  HttpServletRequest request, Model model) throws Exception{
			
			HttpSession session = request.getSession();
			weekDtlVo.setUserCode((String) session.getAttribute("userCode"));

			int result = weekSvc.weekDelete(weekDtlVo);	
			return "redirect:/work/week";
		}
		
		
		/**
		 * 
		 * <pre>
		 * 1. 메소드명	: projectList
		 * 2. 작성일	: 2018. 11. 12
		 * 3. 작성자	: 정훈구
		 * 4. 설명	: 프로젝트명(코드) 클릭시 팝업화면
		 * </pre>
		 * @param map
		 * @param req
		 * @param session
		 * @return
		 * @throws Exception 
		 */	
		
		@RequestMapping(value = "/work/popupProject")
		public String projectList(@RequestParam Map<String, Object> pMap, ModelMap modelMap, HttpSession session) throws Exception {
			pMap.put("userAuth", (String)session.getAttribute("userAuth"));
			pMap.put("userCode", (String)session.getAttribute("userCode"));
			Map<String, Object> rMap = projectSvc.listProject(pMap);
			modelMap.addAttribute("list", rMap.get("pjtList"));
			modelMap.addAttribute("totalPageCnt", rMap.get("totalPageCnt"));
			return "work/popupProject";
		}
		
		/**
		 * 
		 * <pre>
		 * 1. 메소드명	: userList
		 * 2. 작성일	: 2018. 11. 20
		 * 3. 작성자	: 정훈구
		 * 4. 설명	: 작성자 클릭시 팝업화면
		 * </pre>
		 * @param map
		 * @param req
		 * @param session
		 * @return
		 * @throws Exception 
		 */	
		
		@RequestMapping(value = "/work/popupUser")
		public String userList(HttpServletRequest request, ModelMap modelMap) throws Exception {
			modelMap.addAttribute("list", memberSvc.listUser());
			
			return "work/popupUser";
		}
		

//	    private void ntCalCalen(Date targetDay, ModelMap modelMap) {
//	        List<DateVO> calenList = new ArrayList<DateVO>();
//	        
//	        Date today = Util4calen.getToday();
//	        SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
//	        Calendar cal = Calendar.getInstance();
//	        cal.add(Calendar.DATE, 8); 
//	        String ntTime = format.format(cal.getTime());
//	        System.out.println("담주날짜:"+ntTime);
//	        
//	        int month = Util4calen.getMonth(targetDay);
//	        int week = Util4calen.getWeekOfMonth(targetDay);
//	        
//	        Date fweek = Util4calen.getFirstOfWeek(targetDay);
//	        Date lweek = Util4calen.getLastOfWeek(targetDay);
//	        
//	        Date preWeek = Util4calen.dateAdd(fweek, -1);
//	        Date nextWeek = Util4calen.dateAdd(lweek, 1);
//	        
//	        while (fweek.compareTo(lweek) <= 0) {
//	            DateVO dvo = Util4calen.date2VO(fweek);
//	            dvo.setIstoday(Util4calen.dateDiff(fweek, today) == 0);
//	            calenList.add(dvo);
//	            
//	            fweek = Util4calen.dateAdd(fweek, 1);
//	        }
//	        
//	        modelMap.addAttribute("month", month);
//	        modelMap.addAttribute("week", week);
//	        modelMap.addAttribute("calenList", calenList);
//	        modelMap.addAttribute("preWeek", Util4calen.date2Str(preWeek)); 	//이전달
//	        modelMap.addAttribute("nextWeek", Util4calen.date2Str(nextWeek));	//다음달
//
//	    }
//		
		



		
}
