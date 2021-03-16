package com.kimi.workstm.test;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class testDao extends SqlSessionDaoSupport {

	public int test(Map<String, Object> pMap) {
		return getSqlSession().insert("Test.insertTest",pMap);
	}

}
