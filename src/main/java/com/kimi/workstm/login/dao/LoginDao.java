package com.kimi.workstm.login.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.kimi.workstm.common.domain.LoginVO;
import com.kimi.workstm.common.domain.UserVO;

@Repository
public class LoginDao extends SqlSessionDaoSupport {

   public LoginVO loginCheck(LoginVO loginInfo) {
      return getSqlSession().selectOne("Login.loginCheck", loginInfo);
   }
}