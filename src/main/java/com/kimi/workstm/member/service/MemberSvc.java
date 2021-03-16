package com.kimi.workstm.member.service;

import java.util.List;
import java.util.Map;

import com.kimi.workstm.common.domain.DeptVO;
import com.kimi.workstm.common.domain.UserVO;

public interface MemberSvc {

	public List<UserVO> listUser() throws Exception;
	public Map<String, Object> getDeptUserList(Map<String, Object> pMap) throws Exception;
	public UserVO getUser(UserVO pMap) throws Exception;
	public Map<String, String> userInsertInfo(UserVO pMap) throws Exception;
	public Map<String, String> updateUserInfo(UserVO pMap) throws Exception;
	public Map<String, String> deleteuserInfo(UserVO pMap) throws Exception;
	public Map<String, String> checkId(UserVO pMap) throws Exception;
}
