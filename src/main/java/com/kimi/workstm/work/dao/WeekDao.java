package com.kimi.workstm.work.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.kimi.workstm.work.domain.WeekDtlVO;

@Repository
public class WeekDao extends SqlSessionDaoSupport {

	// 업무 리스트
	public List<WeekDtlVO> weekGetDtl(WeekDtlVO weekDtlVO) {

		return getSqlSession().selectList("weekGetDtl", weekDtlVO);
	}

	// 업무 등록 페이지 호출,상세(나중에 이름 바꾸기)
	public List<WeekDtlVO> weekRgst(Map<String, Object> map) {
		return getSqlSession().selectList("weekRgst", map);
	}

	// 업무 등록 기능
	public int weekWrite(WeekDtlVO weekDtlVO) {
		return getSqlSession().insert("weekWrite", weekDtlVO);
	}

	// 업무 상세조회
	public WeekDtlVO weekDetail(WeekDtlVO weekDtlVo) {

		return getSqlSession().selectOne("weekDetail", weekDtlVo);
	}

	// 업무 수정 기능
	public int weekUpdate(WeekDtlVO weekDtlVo) {
		return getSqlSession().update("weekUpdate", weekDtlVo);
	}

	// 업무 삭제
	public int weekDelete(WeekDtlVO weekDtlVo) {
		return getSqlSession().delete("weekDelete", weekDtlVo);
	}

	/************************************* 차주업무 관리 *****************************//*
																					 * 
																					 * //차주업무 리스트 public
																					 * List<NtWeekDtlVO>
																					 * ntWeekGetDtl(Map<String, Object>
																					 * map) {
																					 * 
																					 * return sqlSession.selectList(
																					 * "week.ntWeekGetDtl", map); }
																					 * 
																					 * //차주업무 등록 페이지 호출,상세(나중에 이름 바꾸기)
																					 * public List<NtWeekDtlVO>
																					 * ntWeekRgst(Map<String, Object>
																					 * map) { return
																					 * sqlSession.selectList(
																					 * "week.ntWeekRgst", map); }
																					 * 
																					 * //차주업무 등록 public int ntWeekWrite
																					 * (NtWeekDtlVO ntWeekDtlVo) {
																					 * return sqlSession.insert(
																					 * "week.ntWeekWrite", ntWeekDtlVo);
																					 * } //차주업무 상세 기능 public NtWeekDtlVO
																					 * ntWeekDetail (NtWeekDtlVO
																					 * ntWeekDtlVo) { return
																					 * sqlSession.selectOne(
																					 * "week.ntWeekDetail",
																					 * ntWeekDtlVo); }
																					 * 
																					 * //차주업무 수정 기능 public int
																					 * ntWeekUpdate(NtWeekDtlVO
																					 * ntWeekDtlVo) { return
																					 * sqlSession.update(
																					 * "week.ntWeekUpdate",
																					 * ntWeekDtlVo); }
																					 * 
																					 * //차주업무 삭제 public int
																					 * ntWeekDelete(NtWeekDtlVO
																					 * ntWeekDtlVo) { return
																					 * sqlSession.delete(
																					 * "week.ntWeekDelete",
																					 * ntWeekDtlVo); }
																					 */
}
