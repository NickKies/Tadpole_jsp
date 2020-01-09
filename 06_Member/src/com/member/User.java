package com.member;

import java.io.Serializable;

public class User implements Serializable {
	
	private static final long serialVersionUID = 1L; 
	
	private Integer id;
	private String userId;
	private String userPass;
	private String userName;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String toString() {
		return "User[id= "+id+", userId= "+ userId + ", userPass ="+userPass+
				", userName"+userName+"]";
	}

}
