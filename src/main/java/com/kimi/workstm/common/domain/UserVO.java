package com.kimi.workstm.common.domain;

import org.springframework.web.multipart.MultipartFile;

public class UserVO {
	private String 
	 userCode
	, deptCode	
	, userNm		
	, userID		
	, password 	
	, position	
	, state
	, rgstDay
	, deptNm
	, seqNo
	, userMail
	, userPhone
	, userAuth;

	
	@Override
	public String toString() {
		return "UserVO [userCode=" + userCode + ", deptCode=" + deptCode + ", userNm=" + userNm + ", userID=" + userID
				+ ", password=" + password + ", position=" + position + ", state=" + state + ", rgstDay=" + rgstDay
				+ ", deptNm=" + deptNm + ", seqNo=" + seqNo + ", userMail=" + userMail + ", userPhone=" + userPhone
				+ ", userAuth=" + userAuth + "]";
	}

	public String getUserAuth() {
		return userAuth;
	}

	public void setUserAuth(String userAuth) {
		this.userAuth = userAuth;
	}

	public String getUserMail() {
		return userMail;
	}

	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getSeqNo() {
		return seqNo;
	}

	public void setSeqNo(String seqNo) {
		this.seqNo = seqNo;
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

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getDeptCode() {
		return deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public String getUserNm() {
		return userNm;
	}

	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	
	
}
