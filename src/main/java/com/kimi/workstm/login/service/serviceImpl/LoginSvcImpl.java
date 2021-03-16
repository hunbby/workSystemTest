package com.kimi.workstm.login.service.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kimi.workstm.common.domain.LoginVO;
import com.kimi.workstm.common.domain.UserVO;
import com.kimi.workstm.login.dao.LoginDao;
import com.kimi.workstm.login.service.LoginSvc;



@Service
public class LoginSvcImpl implements LoginSvc {
	@Autowired
	private LoginDao loginDao;

	@Override
	public LoginVO loginCheck(LoginVO loginInfo) {
		return loginDao.loginCheck(loginInfo);
	}

}
