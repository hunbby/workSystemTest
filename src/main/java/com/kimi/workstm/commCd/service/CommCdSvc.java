package com.kimi.workstm.commCd.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kimi.workstm.commCd.domain.CommCdVO;


@Service
public interface CommCdSvc {
	//공통코드 리스트
	public List<CommCdVO> commCdGetDtl(Map<String, Object> map);
	//공통코드 등록페이지 호출
	public List<CommCdVO>  commCdRgst(Map<String, Object> map) throws Exception;
	//공통코드 등록 기능
	public int commCdWrite(CommCdVO commCdVo) throws Exception;
	//공통코드 상세
	public CommCdVO commCdDetail(CommCdVO commCdVo);
	//공통코드 수정
	public int commCdUpdate(CommCdVO commCdVo);
	//공통코드 삭제
	public int commCdDelete(CommCdVO commCdVo);
	//공통코드 중복
	public String cdChk(Map<String, String>checkVal);		

}
