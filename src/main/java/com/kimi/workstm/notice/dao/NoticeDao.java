package com.kimi.workstm.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kimi.workstm.common.domain.ProjectVO;
import com.kimi.workstm.notice.domain.NoticeVO;

@Repository("notice/dao/NoticeDao")
public class NoticeDao extends SqlSessionDaoSupport {
	
	//리스트	
	public List<NoticeVO> noticeGetDtl(Map<String, Object> map) {
		return getSqlSession().selectList("notice.noticeGetDtl", map);
	}
	
	//등록 페이지 호출,상세(나중에 이름 바꾸기)	 
	public List<NoticeVO>  noticeRgst(Map<String, Object> map) {
		return getSqlSession().selectList("notice.noticeRgst", map);
	}

	// 등록 기능	 
	public int noticeWrite (NoticeVO noticeVo) {
		return getSqlSession().insert("notice.noticeWrite", noticeVo);
	}
	
	//상세조회
	public NoticeVO noticeDetail(NoticeVO noticeVo) {
		return getSqlSession().selectOne("notice.noticeDetail", noticeVo);
	}

	//수정 기능
	public int noticeUpdate(NoticeVO noticeVo) {
		return getSqlSession().update("notice.noticeUpdate", noticeVo);
	}
	
	//삭제 기능
	public int noticeDelete(NoticeVO noticeVo) {
		return getSqlSession().delete("notice.noticeDelete", noticeVo);
	}
	//팝업
	public List<NoticeVO> popupNotice(NoticeVO noticeVo) {
		return getSqlSession().selectList("notice.popupNotice", noticeVo);
	}
}
