package com.kimi.workstm.dept.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kimi.workstm.common.domain.DeptVO;
import com.kimi.workstm.common.utils.TreeVO;

@Repository
public class DeptDao {
	@Autowired
	private SqlSession sqlSession;

	public List<TreeVO> deptTreeGrid() {
		return sqlSession.selectList("Dept.deptTreeGrid");
	}

	public List<DeptVO> deptParentList() {
		return sqlSession.selectList("Dept.deptParentInfo");
	}

	public int insertDeptInfo(DeptVO pMap) {
		return sqlSession.insert("Dept.insertDeptInfo", pMap);
	}

	public DeptVO deptInfo(Map<String, Object> pMap) {
		return sqlSession.selectOne("Dept.deptInfo", pMap);
	}

	public int deleteDept(DeptVO pMap) {
		return sqlSession.delete("Dept.deleteDept", pMap);
	}
	
	public int updateDeptUser(DeptVO pMap) {
		return sqlSession.update("Dept.updateDeptUser", pMap);
	}

	public int updateDept(DeptVO pMap) {
		return sqlSession.update("Dept.updateDept", pMap);
	}

	public int deleteDeptList(Map<String, Object> pMap) {
		return sqlSession.delete("Dept.deleteDeptList", pMap);
	}
	
	public int updateDeptUserList(Map<String, Object> pMap) {
		return sqlSession.update("Dept.updateDeptUserList", pMap);
	}

}
