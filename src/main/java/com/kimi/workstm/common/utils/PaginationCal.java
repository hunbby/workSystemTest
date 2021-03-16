package com.kimi.workstm.common.utils;

import com.kimi.workstm.common.domain.PageVO;

public class PaginationCal {
	public PageVO paginationInfo(PageVO pMap) {
		
		int pageStart = pMap.getTotRow() - ((pMap.getPage() - 1) * pMap.getDisplayRowCount() + (pMap.getDisplayRowCount() - 1));
		int pageEnd = pageStart + pMap.getDisplayRowCount() - 1;
		int totPage = pMap.getTotRow() / pMap.getDisplayRowCount();
		if ((pMap.getTotRow() % pMap.getDisplayRowCount()) > 0) {
			totPage = totPage + 1;
		}
		pMap.setTotPage(totPage);
		pMap.setPageStart(pageStart);
		pMap.setPageEnd(pageEnd);
		return pMap;
	}
}
