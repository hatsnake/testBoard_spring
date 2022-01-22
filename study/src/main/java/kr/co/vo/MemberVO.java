package kr.co.vo;

import java.util.Date;

public class MemberVO {
	private String userId;
	private String userPass;
	private String userName;
	private Date regDate;
	
	public MemberVO() {
		
	}
	
	public MemberVO(String userId, String userPass, String userName, Date regDate) {
		this.userId = userId;
		this.userPass = userPass;
		this.userName = userName;
		this.regDate = regDate;
	}
	
	public String getUserId() {
		return userId;
	}
	public String getUserPass() {
		return userPass;
	}
	public String getUserName() {
		return userName;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", userPass=" + userPass + ", userName=" + userName + ", regDate="
				+ regDate + "]";
	}
	
}
