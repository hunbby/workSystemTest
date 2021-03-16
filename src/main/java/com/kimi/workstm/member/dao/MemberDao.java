package com.kimi.workstm.member.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.kimi.workstm.common.domain.DeptVO;
import com.kimi.workstm.common.domain.UserVO;

@Repository
public class MemberDao extends SqlSessionDaoSupport {

	public List<UserVO> listUser(Map<String, Object> pMap) {
		return getSqlSession().selectList("listUser", pMap);
	}

	public UserVO getUser(UserVO pMap) {
		return getSqlSession().selectOne("Member.getUser", pMap);
	}

	public int userInsertInfo(UserVO pMap) {
		return getSqlSession().insert("Member.userInsertInfo", pMap);
	}

	public int updateUserInfo(UserVO pMap) {
		return getSqlSession().update("Member.updateUserInfo", pMap);
	}

	public int deleteuserInfo(UserVO pMap) {
		return getSqlSession().delete("Member.deleteuserInfo", pMap);
	}

	public List<UserVO> getDeptUserList(Map<String, Object> pMap) {
		return getSqlSession().selectList("Member.getDeptUserList", pMap);
	}
	
	public int checkId(UserVO pMap) {
		return getSqlSession().selectOne("Member.checkId", pMap);
	}
	
	public int listUserCnt() {
		return getSqlSession().selectOne("Member.listUserCnt");
	}
	
	public int deptUserListCnt(Map<String, Object> pMap) {
		return getSqlSession().selectOne("Member.deptUserListCnt", pMap);
	}
	
}
