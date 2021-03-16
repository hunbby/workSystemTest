package com.kimi.workstm.notice.service.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;

import com.kimi.workstm.common.domain.ProjectVO;
import com.kimi.workstm.notice.dao.NoticeDao;
import com.kimi.workstm.notice.domain.NoticeVO;
import com.kimi.workstm.notice.service.NoticeSvc;
import com.kimi.workstm.work.domain.WeekDtlVO;

@Service("notice/service/NoticeSvc")
public class NoticeSvcImpl implements NoticeSvc {

	@Resource(name="notice/dao/NoticeDao")	
	private NoticeDao noticeDao;
	
	//공지사항 리스트 ..
	@Override
	public Map<String, Object> noticeGetDtl(Map<String, Object> map) {
		List<NoticeVO> result = noticeDao.noticeGetDtl(map); //List<vo>타입의 result에 리스트 조회하는 데이터를 넣는다
	
		int cnt=result.size(); //List<vo>길이의 사이즈를 구하는방법 int 타입의 cnt변수에 넣는다
		String msg = ""; //(조회한 데이터의 사이즈가 0보다 크면  success  0보다 작으면 fail
			if(cnt > 0) {
				msg = "success";
			}else {
				msg = "fail";
			}
			
		Map<String, Object> pMap = new HashMap<String, Object>();
		
		pMap.put("result",result);
		pMap.put("msg",msg);
		return pMap;
	}
	
	//공지 등록 페이지
	@Override
	public List<NoticeVO>  noticeRgst(Map<String, Object> map) throws Exception {
		return noticeDao.noticeRgst(map);
	}
	
	//공지 등록기능
	@Override
	public Map<String, Object> noticeWrite(NoticeVO noticeVo) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		if(noticeDao.noticeWrite(noticeVo) > 0) {
			result.put("msg", "success");
		}else {
			result.put("msg", "fail");
		}
		return result;
		
		
	}
	//공지 상세
	@Override
	public Map<String, Object> noticeDetail(NoticeVO noticeVo) {		
		Map<String, Object> result = new HashMap<String, Object>();
		NoticeVO te = noticeDao.noticeDetail(noticeVo);
		
		String tempStr = te.getContent();
//		tempStr = tempStr.replaceAll("<", "&lt;");
//		tempStr = tempStr.replaceAll(">", "&gt");
//		tempStr = tempStr.replaceAll( "/\"/g", "quot;");
//		tempStr = tempStr.replaceAll("/\'/g", "&#39;");
//		tempStr = tempStr.replaceAll("", "\\r\\n");
//		te.setContent(tempStr);
	   
		System.out.println("치환:"+tempStr);
		if(te != null) {
			result.put("msg", "success");
			result.put("result", te);
		}else {
			result.put("msg", "fail");
		}
		return result;
	}
	
	//공지 수정 기능
	@Override
	public Map<String, Object> noticeUpdate(NoticeVO noticeVo) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		if(noticeDao.noticeUpdate(noticeVo) > 0) {
			result.put("msg", "success");
			
		} else {
			result.put("msg", "fail");				
		}
		return result;

	}
	
	//공지 삭제 기능
	@Override
	public Map<String, Object> noticeDelete(NoticeVO noticeVo) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		if(noticeDao.noticeDelete(noticeVo) > 0) {
			result.put("msg", "success");
			
		} else {
			result.put("msg", "fail");				
		}
		return result;

	}
	
	//공지사항 팝업
	@Override
	public Map<String, Object> popupNotice(NoticeVO noticeVo) {
		Map<String, Object> result = new HashMap<String, Object>();
		List<NoticeVO> te = noticeDao.popupNotice(noticeVo);

//		String tempStr = te.getContent();
//	   
//		System.out.println("치환:"+tempStr);
		if(te != null) {
			result.put("msg", "success");
			result.put("result", te);
		}else {
			result.put("msg", "fail");
		}
		return result;
		
		 
	}
}
