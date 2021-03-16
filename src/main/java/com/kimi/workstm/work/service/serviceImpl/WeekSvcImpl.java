package com.kimi.workstm.work.service.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kimi.workstm.work.dao.WeekDao;
import com.kimi.workstm.work.domain.WeekDtlVO;
import com.kimi.workstm.work.service.WeekSvc;

@Service("work/service/WeekSvc")
public class WeekSvcImpl implements  WeekSvc  {
	
	@Autowired
	private WeekDao weekDao;
	
	//업무 리스트 
	@Override
	public List<WeekDtlVO> weekGetDtl(WeekDtlVO weekDtlVo) {
		return weekDao.weekGetDtl(weekDtlVo);
	}
	//업무 등록 페이지
	@Override
	public List<WeekDtlVO>  weekRgst(Map<String, Object> map) throws Exception {
		return weekDao.weekRgst(map);
	}
	//업무 등록기능
	@Override
	public int weekWrite(WeekDtlVO weekDtlVo) throws Exception {
		return weekDao.weekWrite(weekDtlVo);
	}
	//업무 상세
	@Override
	public WeekDtlVO weekDetail(WeekDtlVO weekDtlVo) {
		return weekDao.weekDetail(weekDtlVo);
	}
	//업무 수정 기능
	@Override
	public int weekUpdate(WeekDtlVO weekDtlVo) {
		return weekDao.weekUpdate(weekDtlVo);
		
	}
	//업무 삭제 기능
	@Override
	public int weekDelete(WeekDtlVO weekDtlVo) {
		return weekDao.weekDelete(weekDtlVo);
	}

/*************************************차주업무 관리*****************************//*
	
	//차주업무 리스트 
	@Override
	public List<NtWeekDtlVO> ntWeekGetDtl(Map<String, Object> map) {
		return weekDao.ntWeekGetDtl(map);
	}
	
	//차주업무 등록 페이지
	@Override
	public List<NtWeekDtlVO>  ntWeekRgst(Map<String, Object> map) throws Exception {
		return weekDao.ntWeekRgst(map);
	}
	//차주업무 등록기능
	@Override
	public int 	ntWeekWrite(NtWeekDtlVO ntWeekDtlVo) throws Exception {
		return weekDao.	ntWeekWrite(ntWeekDtlVo);
	}
	
	//차주업무 상세
	@Override
	public NtWeekDtlVO 	ntWeekDetail(NtWeekDtlVO ntWeekDtlVo) throws Exception {
		return weekDao.	ntWeekDetail(ntWeekDtlVo);
	}
	
	//차주업무 수정 기능
	@Override
	public int ntWeekUpdate(NtWeekDtlVO ntWeekDtlVo) {
		return weekDao.ntWeekUpdate(ntWeekDtlVo);
		
	}

	//차주업무 삭제 기능
	@Override
	public int ntWeekDelete(NtWeekDtlVO ntWeekDtlVo) {
		return weekDao.ntWeekDelete(ntWeekDtlVo);
	}*/
}
