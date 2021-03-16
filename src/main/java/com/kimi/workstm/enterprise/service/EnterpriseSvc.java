package com.kimi.workstm.enterprise.service;

import java.util.List;
import java.util.Map;

import com.kimi.workstm.common.domain.EnterpriseVO;

public interface EnterpriseSvc {
	public Map<String, Object> enterpriseList(Map<String, Object> pMap) throws Exception;
	public EnterpriseVO getEnterPrise(EnterpriseVO pMap) throws Exception;
	public Map<String, String> insertEnterprise(EnterpriseVO pMap) throws Exception;
	public Map<String, String> updateEnterprise(EnterpriseVO pMap) throws Exception;
	public Map<String, String> deleteEnterprise(EnterpriseVO pMap) throws Exception;
}
