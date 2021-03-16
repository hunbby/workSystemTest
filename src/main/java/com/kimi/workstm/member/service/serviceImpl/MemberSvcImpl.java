package com.kimi.workstm.member.service.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kimi.workstm.common.domain.DeptVO;
import com.kimi.workstm.common.domain.PageVO;
import com.kimi.workstm.common.domain.UserVO;
import com.kimi.workstm.common.utils.PaginationCal;
import com.kimi.workstm.member.dao.MemberDao;
import com.kimi.workstm.member.service.MemberSvc;

@Service
public class MemberSvcImpl implements MemberSvc {
	@Autowired
	private MemberDao dao;

	@Override
	public List<UserVO> listUser() {
//		return dao.listUser();
		return null;
	}

	@Override
	public UserVO getUser(UserVO pMap) {
		return dao.getUser(pMap);
	}

	@Override
	public Map<String, String> userInsertInfo(UserVO pMap) throws Exception {
		Map<String, String> result = new HashMap<String, String>();
		int rCnt = dao.userInsertInfo(pMap);
		if (rCnt > 0) {
			result.put("result", "success");
			result.put("msg", "사용자 등록 성공");
		} else {
			result.put("result", "fail");
			result.put("msg", "사용자 등록 실패");
		}

		return result;
	}

	@Override
	public Map<String, String> updateUserInfo(UserVO pMap) throws Exception {
		Map<String, String> result = new HashMap<String, String>();
		int rCnt = dao.updateUserInfo(pMap);
		if (rCnt > 0) {
			result.put("result", "success");
			result.put("msg", "사용자 수정 성공");
		} else {
			result.put("result", "fail");
			result.put("msg", "사용자 수정 실패");
		}

		return result;
	}

	@Override
	public Map<String, String> deleteuserInfo(UserVO pMap) throws Exception {
		Map<String, String> result = new HashMap<String, String>();
		int rCnt = dao.deleteuserInfo(pMap);
		if (rCnt > 0) {
			result.put("result", "success");
			result.put("msg", "사용자  삭제 성공");
		} else {
			result.put("result", "fail");
			result.put("msg", "사용자 삭제 실패");
		}

		return result;
	}

	@Override
	public Map<String, Object> getDeptUserList(Map<String, Object> pMap) throws Exception {
		PaginationCal paginationCal = new PaginationCal();
		PageVO pageSet = new PageVO();
		
		pageSet.setDisplayRowCount(10);
		pageSet.setPage(Integer.parseInt(pMap.get("pageStart").toString())); // 현재 페이지

		Map<String, Object> rMap = new HashMap<String, Object>();
		// root폴더 구분
		if (pMap.get("deptCode").toString().equals("root")) {
			
			int totalDataCnt = dao.listUserCnt();
			pageSet.setTotRow(totalDataCnt);
			pageSet = paginationCal.paginationInfo(pageSet); // 시작 게시글 번호, 종료 게시글 번호
			
			pMap.put("pageStart", pageSet.getPageStart());
			pMap.put("pageEnd", pageSet.getPageEnd());
			
			rMap.put("userList", dao.listUser(pMap));
			rMap.put("totalPageCnt", pageSet.getTotPage());
			
			return rMap;
		} else {
			List<UserVO> isFolder = dao.getDeptUserList(pMap);
			// 폴더 구분
			if (isFolder.size() == 0) {// 폴더에는 사용자가 없어야하니까 사이즈는 0 (현재는 폴더에도 사용자 등록이 가능하지만 추후 막을 것)
				//pMap.setDeptParent(pMap.getDeptCode());
				//pMap.setDeptCode("");
				pMap.put("deptParent", pMap.get("deptCode"));
				pMap.put("deptCode", "");
				int totalDataCnt = dao.deptUserListCnt(pMap);
				
				pageSet.setTotRow(totalDataCnt);
				pageSet = paginationCal.paginationInfo(pageSet); // 시작 게시글 번호, 종료 게시글 번호
				
				pMap.put("pageStart", pageSet.getPageStart());
				pMap.put("pageEnd", pageSet.getPageEnd());
				
				rMap.put("userList", dao.getDeptUserList(pMap));
				rMap.put("totalPageCnt", pageSet.getTotPage());
			} else { // 부서 없음 은 폴더인데 여기로 빠진다.
				//pMap.setDeptParent("");
				pMap.put("deptParent", "");
				int totalDataCnt = dao.deptUserListCnt(pMap);
				
				pageSet.setTotRow(totalDataCnt);
				pageSet = paginationCal.paginationInfo(pageSet); // 시작 게시글 번호, 종료 게시글 번호
				
				pMap.put("pageStart", pageSet.getPageStart());
				pMap.put("pageEnd", pageSet.getPageEnd());
				
				rMap.put("userList", dao.getDeptUserList(pMap));
				rMap.put("totalPageCnt", pageSet.getTotPage());
			}
		}
		return rMap;
	}

	@Override
	public Map<String, String> checkId(UserVO pMap) throws Exception {
		Map<String, String> result = new HashMap<String, String>();
		int chk = dao.checkId(pMap);
		if (chk == 0) {
			result.put("result", "success");
			result.put("msg", "등록 가능한 ID 입니다.");
		} else {
			result.put("result", "fail");
			result.put("msg", "이미 등록된 ID 입니다.");
		}
		
		return result;
	}

}
