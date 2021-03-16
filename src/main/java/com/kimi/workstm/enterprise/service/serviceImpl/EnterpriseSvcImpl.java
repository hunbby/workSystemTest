package com.kimi.workstm.enterprise.service.serviceImpl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kimi.workstm.common.domain.EnterpriseVO;
import com.kimi.workstm.common.domain.PageVO;
import com.kimi.workstm.common.utils.PaginationCal;
import com.kimi.workstm.enterprise.dao.EnterpriseDao;
import com.kimi.workstm.enterprise.service.EnterpriseSvc;

@Service
@Transactional
public class EnterpriseSvcImpl implements EnterpriseSvc {
	@Autowired
	private EnterpriseDao enDao;

	@Override
	public Map<String, Object> enterpriseList(Map<String, Object> pMap) throws Exception {
		PaginationCal paginationCal = new PaginationCal();
		
		//페이지 셋팅
		int totalDataCnt = enDao.listEnterpriseCnt();
		PageVO pageSet = new PageVO();
		pageSet.setTotRow(totalDataCnt);
		pageSet.setDisplayRowCount(3);
		pageSet.setPage(Integer.parseInt(pMap.get("pageStart").toString())); // 현재 페이지
		pageSet = paginationCal.paginationInfo(pageSet); // 시작 게시글 번호, 종료 게시글 번호
		
		pMap.put("pageStart", pageSet.getPageStart());
		pMap.put("pageEnd", pageSet.getPageEnd());
		
		Map<String, Object> rMap = new HashMap<String, Object>();
		rMap.put("enList", enDao.enterpriseList(pMap));
		rMap.put("totalPageCnt", pageSet.getTotPage());
		return rMap;
	}

	@Override
	public Map<String, String> insertEnterprise(EnterpriseVO pMap) throws Exception {
		Map<String, String> result = new HashMap<String, String>();
		int cnt = enDao.insertEnterprise(pMap);
		
		if(cnt > 0) {
			result.put("result", "success");
			result.put("msg", "업체 등록 성공");
		}else {
			result.put("result", "fail");
			result.put("msg", "업체 등록 실패");
		}
		return result;
	}

	@Override
	public EnterpriseVO getEnterPrise(EnterpriseVO pMap) throws Exception {
		return enDao.getEnterPrise(pMap);
	}

	@Override
	public Map<String, String> updateEnterprise(EnterpriseVO pMap) throws Exception {
		Map<String, String> result = new HashMap<String, String>();
		int cnt = enDao.updateEnterprise(pMap);
		
		if(cnt > 0) {
			result.put("result", "success");
			result.put("msg", "업체 수정 성공");
		}else {
			result.put("result", "fail");
			result.put("msg", "업체 수정 실패");
		}
		return result;
	}

	@Override
	public Map<String, String> deleteEnterprise(EnterpriseVO pMap) throws Exception {
		Map<String, String> result = new HashMap<String, String>();
		
		if(enDao.deleteEnterprise(pMap) > 0) {
			result.put("result", "success");
			result.put("msg", "업체 삭제 성공");
			
		}else {
			result.put("result", "fail");
			result.put("msg", "업체 삭제 실패");
			
		}
		return result;
	}

}
