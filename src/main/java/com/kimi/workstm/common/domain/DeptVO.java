package com.kimi.workstm.common.domain;

public class DeptVO {
	
	private String 
	deptCode		// 부서코드
	, deptNm		// 부서명
	, rgstDay		// 등록일
	, deptLV		// 부서 레벨 (부모 1, 자식 2)
	, deptParent	// 부모 부서코드
	, deptRemarks;	// 비고
	
	
	public String getDeptRemarks() {
		return deptRemarks;
	}

	public void setDeptRemarks(String deptRemarks) {
		this.deptRemarks = deptRemarks;
	}

	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public String getDeptNm() {
		return deptNm;
	}

	public void setDeptNm(String deptNm) {
		this.deptNm = deptNm;
	}

	public String getRgstDay() {
		return rgstDay;
	}

	public void setRgstDay(String rgstDay) {
		this.rgstDay = rgstDay;
	}

	public String getDeptLV() {
		return deptLV;
	}

	public void setDeptLV(String deptLV) {
		this.deptLV = deptLV;
	}

	public String getDeptParent() {
		return deptParent;
	}

	public void setDeptParent(String deptParent) {
		this.deptParent = deptParent;
	}

	
}
