package com.kimi.workstm.common.utils;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;

public class TreeMaker {

	/**
	 * 부모코드를 이용하여 계층형 트리 구성.
	 * 
	 * @throws Exception
	 */
	public String makeTreeByHierarchy(List<TreeVO> listview) throws Exception {
		List<TreeVO> rootList = new ArrayList<TreeVO>();

		for (int i = 0; i < listview.size(); i++) {
			TreeVO mtDO = (TreeVO) listview.get(i); // 부서 하나하나 정보 값

			if (mtDO.getParent().equals("root01") ) { // 부모 부서가 없다 = 최상위 부서
				mtDO.setIsFolder(true);
				rootList.add(mtDO);			// 리스트에 바로 추가
				continue;
			}
			
			// 1LV 이상의 부서만 들어감!
			for (int j = 0; j < listview.size(); j++) {
				TreeVO ptDO = (TreeVO) listview.get(j); // 다시한번 부서 하나하나의 정보 값을 가져온다
				List<Object> childList = new ArrayList<Object>();
				// mtDO 처음 가져온 부서의 부모값과 이후에 가져온 ptDO의 부모값이 같은지 검사후
				// 같지 않으면 2번째 ptDO를 가져온다
				// * 바깥 for문에서 최상위 폴더를 구분 안쪽 for문에서 하위 폴더를 구분
				// * 하위 폴더들중 최상위 부서값과 하위폴더의 부모값이 같을때까지 for문을 실행한다.
				if (mtDO.getParent().equals(ptDO.getKey())) {
					// 상위 부서와 하위부서의 부모값이 같을때 들어온다.
					
					// 하위 부서의 자식 부서가 있는지 검사한다.
					if (ptDO.getChildren() == null) {
						// 자식 부서가 없으면 빈 배열 하나를 생성하여 추가한다. ([] 값이 들어감)
						// 이 이후 부터는 null값이 아님
						ptDO.setChildren(childList);
					}
					
					childList = ptDO.getChildren(); // 부모 부서의 자식부서리스트(처음은 []값)
					childList.add(mtDO);
					ptDO.setIsFolder(true);
					break;
				}
			}
		}

		ObjectMapper mapper = new ObjectMapper();

		return mapper.writeValueAsString(rootList);
	}
	
	public String makeTreeVer2(List<TreeVO> listview) throws Exception {
		List<TreeVO> rootList = new ArrayList<TreeVO>(); // 최상위 데이터 (1레벨 데이터)
		List<TreeVO> childList = new ArrayList<TreeVO>(); // 최상위 제외한 데이터 (2레벨 데이터)
		List<TreeVO> copyList = new ArrayList<TreeVO>(); // childList의 자기 자신과 비교하기 위한 리스트
		
		for(int i = 0 ; i < listview.size() ; i++) {
			TreeVO mtDO = (TreeVO) listview.get(i); // 부서 하나하나 정보 값
			if (mtDO.getParent().equals("root01") ) { // 1 조건 최상위 부서인지 검사 최상위 부서 부모 부서값 roor01
				mtDO.setIsFolder(true);	// 최상위 부서가 맞다면 폴더 조건 true 변경
				rootList.add(mtDO);			// 최종 리스트에 추가
				// 1dept
			} else {
				childList.add(mtDO); // 2조건 최상위 제외한 나머지 데이터
				//2dept over--
			}
		}
		List<TreeVO> trans = new ArrayList<TreeVO>();
		copyList = childList;
		for (int i =0; i < childList.size(); i++) {
			TreeVO childDO = childList.get(i); // child 데이터
			
			for (int j = 0; j < copyList.size(); j++) {
				TreeVO copyDO = copyList.get(j); // copy 데이터
				
				if(childDO.getKey().equals(copyDO.getParent())) { // 하위 부서 구분
					// childDO에 하위 부서 있음 , copyDO 가 child의 하위 부서임

					childDO.setIsFolder(true);// 폴더 변환
					childDO.getChildren().add(copyDO); // 자식 데이터 입력
					
				} else {
					continue;
				}
			}
			if(childDO.getIsFolder()) { 
				// 여기까지 오면 child 배열에 폴더 구분 하위부서 구분 까지 되어있으나 일반 부서(file 형식)이 전부 포합되어있음
				// 폴더 인 것만 찾아서  trans 에 넣어준다.
				trans.add(childDO);
			}
		}

		//최상위랑 하위랑 합치기!
		for (int i = 0 ; i < rootList.size(); i ++) {
			TreeVO rDO = rootList.get(i);
			for (int j = 0 ; j < trans.size(); j++) {
				TreeVO cDO = trans.get(j);
				
				if(rDO.getKey().equals(cDO.getParent())) {

					rDO.getChildren().add(cDO);
				} else {
					continue;
				}
			}
		}
		// 지금 생각해보니... 잘하면 한번에 끝낼수 있을거같....다...?
		ObjectMapper mapper = new ObjectMapper();
		return mapper.writeValueAsString(rootList);
	}
}
