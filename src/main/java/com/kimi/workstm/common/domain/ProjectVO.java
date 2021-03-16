package com.kimi.workstm.common.domain;

public class ProjectVO {

	private String 	pjtCode,		//프로젝트 코드
					epCode,			//업체코드
					userCode,		//사용자코드
					userNm,			//사용자명(프로젝트 담당자)
					epMgmtNm,		//업체담당자
					pjtNm,			//프로젝트 명
					pjtTermFrom,	//프로젝트 시작
					pjtTermTo,		//프로젝트 끝
					rgstDay,		//프로젝트 등록일
					epNm			//업체명
					,pjtParti		//참여인원
					,seqNo;			//넘버링
					
	public String getSeqNo() {
		return seqNo;
	}

	public void setSeqNo(String seqNo) {
		this.seqNo = seqNo;
	}

	public String getUserNm() {
		return userNm;
	}

	public String getPjtParti() {
		return pjtParti;
	}

	public void setPjtParti(String pjtParti) {
		this.pjtParti = pjtParti;
	}

	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}

	public String getEpNm() {
		return epNm;
	}

	public void setEpNm(String epNm) {
		this.epNm = epNm;
	}

	public String getPjtCode() {
		return pjtCode;
	}

	public void setPjtCode(String pjtCode) {
		this.pjtCode = pjtCode;
	}

	public String getEpCode() {
		return epCode;
	}

	public void setEpCode(String epCode) {
		this.epCode = epCode;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getEpMgmtNm() {
		return epMgmtNm;
	}

	public void setEpMgmtNm(String epMgmtNm) {
		this.epMgmtNm = epMgmtNm;
	}

	public String getPjtNm() {
		return pjtNm;
	}

	public void setPjtNm(String pjtNm) {
		this.pjtNm = pjtNm;
	}

	public String getPjtTermFrom() {
		return pjtTermFrom;
	}

	public void setPjtTermFrom(String pjtTermFrom) {
		this.pjtTermFrom = pjtTermFrom;
	}

	public String getPjtTermTo() {
		return pjtTermTo;
	}

	public void setPjtTermTo(String pjtTermTo) {
		this.pjtTermTo = pjtTermTo;
	}

	public String getRgstDay() {
		return rgstDay;
	}

	public void setRgstDay(String rgstDay) {
		this.rgstDay = rgstDay;
	}


}
