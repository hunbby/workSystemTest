package com.kimi.workstm.projects.service;

import java.util.List;
import java.util.Map;

import com.kimi.workstm.common.domain.ProjectVO;
import com.kimi.workstm.common.domain.UserVO;

public interface ProjectSvc {
	public Map<String, String> insertProject(Map<String, Object> pMap) throws Exception;
	public Map<String, String> updateProjectInfo(Map<String, Object> pMap) throws Exception;
	public Map<String, String> deleteProjectInfo(Map<String, Object> pMap) throws Exception;
	public Map<String, Object> listProject(Map<String, Object> pMap) throws Exception;
	public ProjectVO getProjectInfo(ProjectVO pMap) throws Exception;
	public List<ProjectVO> pjtTerms(UserVO pMap) throws Exception;
	public int listProjectCnt(Map<String, Object> pMap) throws Exception;
}
