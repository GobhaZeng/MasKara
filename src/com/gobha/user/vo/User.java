package com.gobha.user.vo;

import java.util.Date;

public class User {
	private Integer userId;
	private String account;
	private String password;
	private String userName;
	private Date creatTime;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getCreatTime() {
		return creatTime;
	}

	public void setCreatTime(Date creatTime) {
		this.creatTime = creatTime;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", account=" + account + ", password=" + password + ", userName=" + userName
				+ ", creatTime=" + creatTime + "]";
	}
}
