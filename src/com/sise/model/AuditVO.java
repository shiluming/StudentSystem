package com.sise.model;

import java.util.Date;

public class AuditVO {

	private Integer id;
	private Student stu;
	private String type;
	private String name;     
	private String tell;
	private String img;           //Õº∆¨¬∑æ∂
	private Date requestTime;     //…Í«Î ±º‰
	private String status;       //◊¥Ã¨          0£∫…Í«Î÷–£¨ 1. …Í«Î ß∞‹£¨2.…Í«Î≥…π¶
	private String auditer;     //∆¿…Û»À
	private String requestReason;         //…Í«Î‘≠“Ú
	private String auditReason;           //…Û∫À‘≠“Ú
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Student getStu() {
		return stu;
	}
	public void setStu(Student stu) {
		this.stu = stu;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Date getRequestTime() {
		return requestTime;
	}
	public void setRequestTime(Date requestTime) {
		this.requestTime = requestTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAuditer() {
		return auditer;
	}
	public void setAuditer(String auditer) {
		this.auditer = auditer;
	}
	public String getTell() {
		return tell;
	}
	public void setTell(String tell) {
		this.tell = tell;
	}
	public String getRequestReason() {
		return requestReason;
	}
	public void setRequestReason(String requestReason) {
		this.requestReason = requestReason;
	}
	public String getAuditReason() {
		return auditReason;
	}
	public void setAuditReason(String auditReason) {
		this.auditReason = auditReason;
	}
	
	
	
}
