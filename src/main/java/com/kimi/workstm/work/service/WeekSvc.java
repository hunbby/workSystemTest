package com.kimi.workstm.work.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kimi.workstm.work.domain.WeekDtlVO;

@Service
public interface WeekSvc {
	//업무 리스트
	public List<WeekDtlVO> weekGetDtl(WeekDtlVO weekDtlVo);
	//업무 등록페이지 호출
	public List<WeekDtlVO>  weekRgst(Map<String, Object> map) throws Exception;
    //업무 등록 기능
	public int weekWrite(WeekDtlVO weekDtlVo) throws Exception;
	//업무 상세페이지 
	public  WeekDtlVO weekDetail(WeekDtlVO weekDtlVo);
	//업무 수정기능
	public int weekUpdate(WeekDtlVO weekDtlVo);
	//업무 삭제기능
	public int weekDelete(WeekDtlVO weekDtlVo);
	

	
}
