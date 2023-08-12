package com.tjoeun.vo;

public class MainVO {
	
	private int cnum;
	private String name;
	private String email;
	private String phone;
	private String birthDay;
	private String password;
	
	public MainVO() { }

	public MainVO(int cnum, String name, String email, String phone, String birthDay) {
		this.cnum = cnum;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.birthDay = birthDay;
	}

	public final int getCnum() {
		return cnum;
	}

	public final void setCnum(int cnum) {
		this.cnum = cnum;
	}

	public final String getName() {
		return name;
	}

	public final void setName(String name) {
		this.name = name;
	}

	public final String getEmail() {
		return email;
	}

	public final void setEmail(String email) {
		this.email = email;
	}

	public final String getPhone() {
		return phone;
	}

	public final void setPhone(String phone) {
		this.phone = phone;
	}

	public final String getBirthDay() {
		return birthDay;
	}

	public final void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}

	public final String getPassword() {
		return password;
	}

	public final void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "MainVO [cnum=" + cnum + ", name=" + name + ", email=" + email + ", phone=" + phone + ", birthDay="
				+ birthDay + ", password=" + password + "]";
	}
	
}