package com.kimi.workstm.commCd.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kimi.workstm.commCd.domain.CommCdVO;

@Repository("commCd/dao/CommCdDao")
public class CommCdDao {
	
	@Autowired						
	private SqlSession sqlSession;	//mysql을 사용할 수 있게 해준다.
	
	public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;			//sql문의 생성자
    }
	
	//리스트
	public List<CommCdVO> commCdGetDtl(Map<String, Object> map) {
		return sqlSession.selectList("commCd.commCdGetDtl", map);
	}
	//등록 페이지 호출,상세	 
	public List<CommCdVO>  commCdRgst(Map<String, Object> map) {
		return sqlSession.selectList("commCd.commCdeRgst", map);
	}
	//등록 기능	 
	public int commCdWrite (CommCdVO commCdVO) {
		return sqlSession.insert("commCd.commCdWrite", commCdVO);
	}
	//상세조회
	public CommCdVO commCdDetail(CommCdVO commCdVo) {
		return sqlSession.selectOne("commCd.commCdDetail", commCdVo);
	}
	//수정 기능
	public int commCdUpdate(CommCdVO commCdVO) {
		return sqlSession.update("commCd.commCdUpdate", commCdVO);
	}
	//업무 삭제
	public int commCdDelete(CommCdVO commCdVO) {
		return sqlSession.delete("commCd.commCdDelete", commCdVO);
	}

	//아이디 중복체크
	public int cdChk(Map<String, String> checkVal) {
		return sqlSession.selectOne("commCd.cdChk", checkVal);
	}

	

}
