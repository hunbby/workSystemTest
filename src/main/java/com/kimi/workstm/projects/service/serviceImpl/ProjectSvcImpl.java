package com.kimi.workstm.projects.service.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kimi.workstm.common.domain.PageVO;
import com.kimi.workstm.common.domain.ProjectVO;
import com.kimi.workstm.common.domain.UserVO;
import com.kimi.workstm.common.utils.PaginationCal;
import com.kimi.workstm.projects.dao.ProjectDao;
import com.kimi.workstm.projects.service.ProjectSvc;

@Service
public class ProjectSvcImpl implements ProjectSvc {
	@Autowired
	private ProjectDao dao;

	@Override
	public Map<String, Object> listProject(Map<String, Object> pMap) throws Exception {
		PaginationCal paginationCal = new PaginationCal();
		
		// 페이징 셋팅
		int totalDataCnt = dao.listProjectCnt(pMap);
		PageVO pageSet = new PageVO();
		pageSet.setTotRow(totalDataCnt); // 전체 데이터 수
		pageSet.setDisplayRowCount(3); // 보여줄 리스트 수
		pageSet.setPage(Integer.parseInt(pMap.get("pageStart").toString())); // 현재 페이지
		pageSet = paginationCal.paginationInfo(pageSet); // 시작 게시글 번호, 종료 게시글 번호
		
		pMap.put("pageStart", pageSet.getPageStart());
		pMap.put("pageEnd", pageSet.getPageEnd());
		
		Map<String, Object> rMap = new HashMap<String, Object>();
		rMap.put("pjtList", dao.listProject(pMap));
		rMap.put("totalPageCnt", pageSet.getTotPage());
		return rMap;
	}

	@Override
	public ProjectVO getProjectInfo(ProjectVO pMap) throws Exception {
		return dao.getProjectInfo(pMap);
	}
	
	@Override
	public Map<String, String> insertProject(Map<String, Object> pMap) throws Exception {
		Map<String, String> result = new HashMap<String, String>();
		
		pMap.put("pjtTermTo", pMap.get("pjtTermTo").toString().replaceAll("-", ""));
		pMap.put("pjtTermFrom", pMap.get("pjtTermFrom").toString().replaceAll("-", ""));
		int rCnt = dao.insertProject(pMap);
		if (rCnt > 0) {
			result.put("result", "success");
			result.put("msg", "프로젝트 등록 성공");
		} else {
			result.put("result", "fail");
			result.put("msg", "프로젝트 등록 실패");
		}
		return result;
	}
	
	@Override
	public Map<String, String> updateProjectInfo(Map<String, Object> pMap) throws Exception {
		Map<String, String> result = new HashMap<String, String>();
		
		pMap.put("pjtTermTo", pMap.get("pjtTermTo").toString().replaceAll("-", ""));
		pMap.put("pjtTermFrom", pMap.get("pjtTermFrom").toString().replaceAll("-", ""));
		int rCnt = dao.updateProjectInfo(pMap);
		if (rCnt > 0) {
			result.put("result", "success");
			result.put("msg", "프로젝트 수정 성공");
		} else {
			result.put("result", "fail");
			result.put("msg", "프로젝트 수정 실패");
		}
		return result;
	}

	@Override
	public Map<String, String> deleteProjectInfo(Map<String, Object> pMap) throws Exception {
		Map<String, String> result = new HashMap<String, String>();
		int rCnt = dao.deleteProjectInfo(pMap);
		if (rCnt > 0) {
			result.put("result", "success");
			result.put("msg", "프로젝트 삭제 성공");
		} else {
			result.put("result", "fail");
			result.put("msg", "프로젝트 삭제 실패");
		}
		return result;
	}

	@Override
	public List<ProjectVO> pjtTerms(UserVO pMap) throws Exception {
		return dao.pjtTerms(pMap);
	}

	@Override
	public int listProjectCnt(Map<String, Object> pMap) throws Exception {
		return dao.listProjectCnt(pMap);
	}

}
