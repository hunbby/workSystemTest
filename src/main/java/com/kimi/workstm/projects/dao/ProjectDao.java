package com.kimi.workstm.projects.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kimi.workstm.common.domain.ProjectVO;
import com.kimi.workstm.common.domain.UserVO;

@Repository
public class ProjectDao {
	@Autowired
	private SqlSession sqlSession;

	public int insertProject(Map<String, Object> pMap) {
		return sqlSession.insert("Projects.insertProject", pMap);
	}

	public List<ProjectVO> listProject(Map<String, Object> pMap) {
		return sqlSession.selectList("Projects.listProject", pMap);
	}

	public ProjectVO getProjectInfo(ProjectVO pMap) {
		return sqlSession.selectOne("Projects.getProjectInfo", pMap);
	}

	public int updateProjectInfo(Map<String, Object> pMap) {
		return sqlSession.update("Projects.updateProjectInfo", pMap);
	}

	public int deleteProjectInfo(Map<String, Object> pMap) {
		return sqlSession.delete("Projects.deleteProjectInfo", pMap);
	}

	public List<ProjectVO> pjtTerms(UserVO pMap) {
		return sqlSession.selectList("Projects.pjtTerms", pMap);
	}
	
	public int listProjectCnt(Map<String, Object> pMap) {
		return sqlSession.selectOne("Projects.listProjectCnt", pMap);
	}
	
}
