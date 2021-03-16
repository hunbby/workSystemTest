package com.kimi.workstm.dept.service.serviceImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kimi.workstm.common.domain.DeptVO;
import com.kimi.workstm.common.utils.TreeVO;
import com.kimi.workstm.dept.dao.DeptDao;
import com.kimi.workstm.dept.service.DeptSvc;

@Service
public class DeptSvcImpl implements DeptSvc {
	@Autowired
	private DeptDao deptDao;

	@Override
	public List<TreeVO> deptTreeGrid() {

		return deptDao.deptTreeGrid();
	}

	@Override
	public String deptParentList() throws Exception {
		ObjectMapper jsonMapper = new ObjectMapper();
		return jsonMapper.writeValueAsString(deptDao.deptParentList());
//		return null;
	}

	@Override
	public Map<String, String> insertDeptInfo(DeptVO pMap) throws Exception {
		Map<String, String> result = new HashMap<String, String>();

		if (pMap.getDeptParent() == null) {
			pMap.setDeptParent("root01");
		}
		
		int rCnt = deptDao.insertDeptInfo(pMap);
		if (rCnt > 0) {
			result.put("result", "success");
			result.put("msg", "부서 등록 성공");
		} else {
			result.put("result", "fail");
			result.put("msg", "부서 등록 실패");
		}

		return result;
	}

	@Override
	public DeptVO deptInfo(Map<String, Object> pMap) throws Exception {
		return deptDao.deptInfo(pMap);
	}

	@Override
	public Map<String, String> deleteDept(DeptVO pMap) throws Exception {
		Map<String, String> result = new HashMap<String, String>();
		int rCnt = deptDao.deleteDept(pMap);
		if (rCnt > 0) {
			result.put("result", "success");
			result.put("msg", "부서 삭제 성공");
			deptDao.updateDeptUser(pMap);
		} else {
			result.put("result", "fail");
			result.put("msg", "부서 삭제 실패");
		}

		return result;
	}

	@Override
	public Map<String, String> updateDept(DeptVO pMap) throws Exception {
		Map<String, String> result = new HashMap<String, String>();
		if(pMap.getDeptLV().equals("1")) {
			pMap.setDeptParent("root01");
		}
		
		if (pMap.getDeptParent().equals(pMap.getDeptCode())) {
			result.put("result", "fail");
			result.put("msg", "부서 등록 실패\n현재부서를 현재부서의 하위부서로 등록할 수 없습니다.");
			return result;
		}
		
		int rCnt = deptDao.updateDept(pMap);
		if (rCnt > 0) {
			result.put("result", "success");
			result.put("msg", "부서 수정 성공");

		} else {
			result.put("result", "fail");
			result.put("msg", "부서 수정 실패");
		}

		return result;
	}

	@Override
	public Map<String, String> deleteDeptList(List<String> detpCodeList, DeptVO pMap) throws Exception {
		Map<String, String> result = new HashMap<String, String>();
		List<String> cList = new ArrayList<String>();

		Map<String, Object> cMap = new HashMap<String, Object>();
		if (detpCodeList.size() == 0) {
			String getDeptCode = pMap.getDeptCode();
			cList.add(getDeptCode);
			cMap.put("deptCodeList", cList);
		} else {
			cMap.put("deptCodeList", detpCodeList);
		}
		int rCnt = deptDao.deleteDeptList(cMap);
		if (rCnt > 0) {
			result.put("result", "success");
			result.put("msg", "부서 리스트 삭제 성공");
			deptDao.updateDeptUserList(cMap);
		} else {
			result.put("result", "fail");
			result.put("msg", "부서 리스트 삭제 실패");
		}

		return result;
	}

}
