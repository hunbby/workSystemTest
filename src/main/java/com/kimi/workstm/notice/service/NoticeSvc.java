package com.kimi.workstm.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kimi.workstm.common.domain.ProjectVO;
import com.kimi.workstm.notice.domain.NoticeVO;
import com.kimi.workstm.work.domain.WeekDtlVO;

@Service
public interface NoticeSvc {
	//공지사항 리스트
	public Map<String, Object> noticeGetDtl(Map<String, Object> map);
	//공지사항 등록페이지 호출
	public List<NoticeVO>  noticeRgst(Map<String, Object> map) throws Exception;
	//공지사항 등록 기능
	public  Map<String, Object> noticeWrite(NoticeVO pMap);
	//공지사항 상세
	public Map<String, Object> noticeDetail(NoticeVO noticeVo);
	//공지사항 수정
	public Map<String, Object> noticeUpdate(NoticeVO noticeVo);
	//공지사항 삭제기능
	public Map<String, Object> noticeDelete(NoticeVO noticeVo);
	//홈에서 공지사항 팝업
	public Map<String, Object> popupNotice(NoticeVO noticeVo);
	
}
