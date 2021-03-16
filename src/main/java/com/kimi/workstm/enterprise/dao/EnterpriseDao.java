package com.kimi.workstm.enterprise.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kimi.workstm.common.domain.EnterpriseVO;

@Repository
public class EnterpriseDao {
	@Autowired
	private SqlSession sqlSession;

	public List<EnterpriseVO> enterpriseList(Map<String, Object> pMap) {
		return sqlSession.selectList("Enterprise.listEnterprise", pMap);
	}

	public int insertEnterprise(EnterpriseVO pMap) {
		return sqlSession.insert("Enterprise.insertEnterprise", pMap);
	}

	public EnterpriseVO getEnterPrise(EnterpriseVO pMap) {
		return sqlSession.selectOne("Enterprise.getEnterpriseInfo", pMap);
	}

	public int updateEnterprise(EnterpriseVO pMap) {
		return sqlSession.update("Enterprise.updateEnterpriseInfo", pMap);
	}

	public int deleteEnterprise(EnterpriseVO pMap) {
		return sqlSession.delete("Enterprise.deleteEnterpriseInfo", pMap);
	}
	
	public int listEnterpriseCnt() {
		return sqlSession.selectOne("Enterprise.listEnterpriseCnt");
	}
}
