package com.kimi.workstm.commCd.service.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kimi.workstm.commCd.dao.CommCdDao;
import com.kimi.workstm.commCd.domain.CommCdVO;
import com.kimi.workstm.commCd.service.CommCdSvc;

@Service("commCd/service/CommCdSvc")
public class CommCdSvcImpl  implements CommCdSvc {

	@Resource(name="commCd/dao/CommCdDao")	
	private CommCdDao commCdDao;

	//공통코드 리스트
	@Override
	public List<CommCdVO> commCdGetDtl(Map<String, Object> map) {
		return commCdDao.commCdGetDtl(map);
	}
	//공통코드 등록 페이지
	@Override
	public List<CommCdVO>  commCdRgst(Map<String, Object> map) throws Exception {
		return commCdDao.commCdRgst(map);
	}
	//공통코드 등록기능
	@Override
	public int commCdWrite(CommCdVO commCdVo) throws Exception {
		return commCdDao.commCdWrite(commCdVo);
	}
	
	//공통코드 상세
	@Override
	public CommCdVO commCdDetail(CommCdVO commCdVo) {
		return commCdDao.commCdDetail(commCdVo);
	}
	//공통코드 수정 기능
	@Override
	public int commCdUpdate(CommCdVO commCdVo) {
		return commCdDao.commCdUpdate(commCdVo);
	}
	//공통코드 삭제 기능
	@Override
	public int commCdDelete(CommCdVO commCdVo) {
		return commCdDao.commCdDelete(commCdVo);
	}
	//공통코드 중복 체크
	@Override
	public String cdChk(Map<String, String> checkVal) {
		String result=null;
		try {
			int chkCnt = commCdDao.cdChk(checkVal);
		
			if(chkCnt == 0) {
				result= "success";
			
			}else {
				result= "overlap";
			}
			System.out.println("ㅇㅅㅇ"+chkCnt);
		}catch(Exception e){
	
		}
				
		return result;
	}	
	
	
}
