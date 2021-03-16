package com.kimi.workstm.login.service;

import com.kimi.workstm.common.domain.LoginVO;
import com.kimi.workstm.common.domain.UserVO;

public interface LoginSvc {
	public LoginVO loginCheck(LoginVO loginInfo);
}
