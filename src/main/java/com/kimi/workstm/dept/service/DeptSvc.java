package com.kimi.workstm.dept.service;

import java.util.List;
import java.util.Map;

import com.kimi.workstm.common.domain.DeptVO;
import com.kimi.workstm.common.utils.TreeVO;

public interface DeptSvc {
	public List<TreeVO> deptTreeGrid();

	public String deptParentList() throws Exception;

	public Map<String, String>  insertDeptInfo(DeptVO pMap) throws Exception;

	public DeptVO deptInfo(Map<String, Object> pMap) throws Exception;

	public Map<String, String> deleteDept(DeptVO pMap) throws Exception;

	public Map<String, String> updateDept(DeptVO pMap) throws Exception;

	public Map<String, String> deleteDeptList(List<String> detpCodeList, DeptVO pMap) throws Exception;

}
