package com.kimi.workstm.common.domain;

public class EnterpriseVO {
	private String  epCode;			//업체코드
	private String  epNm;			//업체명
	private String  epMgmtNm;		//업체담당자
	private String  state;			//업체 상태
	private String  rgstDay;		//업체등록일
	private String  seqNo;			//넘버링
	
	public String getSeqNo() {
		return seqNo;
	}
	public void setSeqNo(String seqNo) {
		this.seqNo = seqNo;
	}
	public String getEpCode() {
		return epCode;
	}
	public void setEpCode(String epCode) {
		this.epCode = epCode;
	}
	public String getEpNm() {
		return epNm;
	}
	public void setEpNm(String epNm) {
		this.epNm = epNm;
	}
	public String getEpMgmtNm() {
		return epMgmtNm;
	}
	public void setEpMgmtNm(String epMgmtNm) {
		this.epMgmtNm = epMgmtNm;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getRgstDay() {
		return rgstDay;
	}
	public void setRgstDay(String rgstDay) {
		this.rgstDay = rgstDay;
	}
	
	
}
