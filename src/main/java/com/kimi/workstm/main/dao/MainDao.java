package com.kimi.workstm.main.dao;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("main/dao/MainDao")
public class MainDao {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired						
	private SqlSession sqlSession;	//mysql을 사용할 수 있게 해준다.
	
	public void setSqlSession(SqlSession sqlSession){
        this.sqlSession = sqlSession;			//sql문의 생성자
    }
	

}
