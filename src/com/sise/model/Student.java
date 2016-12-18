package com.sise.model;

import java.util.Date;

public class Student {

	private Integer id;
	private String code;
	private String password;
	private String name;
	private Date joinTime;
	private Integer masterTeacher;
	private String sex;
	private Integer age;
	private String address;
	private String tell;
	private String email;
	private Integer grade;
	private String status;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getJoinTime() {
		return joinTime;
	}
	public void setJoinTime(Date joinTime) {
		this.joinTime = joinTime;
	}
	public Integer getMasterTeacher() {
		return masterTeacher;
	}
	public void setMasterTeacher(Integer masterTeacher) {
		this.masterTeacher = masterTeacher;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTell() {
		return tell;
	}
	public void setTell(String tell) {
		this.tell = tell;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getGrade() {
		return grade;
	}
	public void setGrade(Integer grade) {
		this.grade = grade;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Student [id=" + id + ", code=" + code + ", password=" + password + ", name=" + name + ", joinTime="
				+ joinTime + ", masterTeacher=" + masterTeacher + ", sex=" + sex + ", age=" + age + ", address="
				+ address + ", tell=" + tell + ", email=" + email + ", grade=" + grade + ", status=" + status + "]";
	}
	
}
