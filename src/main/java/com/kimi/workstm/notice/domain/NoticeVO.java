package com.kimi.workstm.notice.domain;

public class NoticeVO {

	private String idx;
	private String userCode;
	private String userNm;
	private String subject;
	private String content;
	private String rgstDay;
	private String seqNo;
	private String endDay;
	
	
	@Override
	public String toString() {
		return "NoticeVO [idx=" + idx + ", userCode=" + userCode + ", userNm=" + userNm + ", subject=" + subject
				+ ", content=" + content + ", rgstDay=" + rgstDay + ", seqNo=" + seqNo + ", endDay=\" + endDay + \"]";
	}
	public String getSeqNo() {
		return seqNo;
	}
	public void setSeqNo(String seqNo) {
		this.seqNo = seqNo;
	}
	public String getEndDay() {
		return endDay;
	}
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}

	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRgstDay() {
		return rgstDay;
	}
	public void setRgstDay(String rgstDay) {
		this.rgstDay = rgstDay;
	}

	
}
