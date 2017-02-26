package com.sise.model;


/**
 * ½±ÏîÏîÄ¿
 * @author rola
 *
 */
public class AuditItem {

	private Integer id;
	private String name;
	private String type;
	private String others;
	private Teacher tea;
	
	private Integer teaId;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getOthers() {
		return others;
	}

	public void setOthers(String others) {
		this.others = others;
	}

	public Teacher getTea() {
		return tea;
	}

	public void setTea(Teacher tea) {
		this.tea = tea;
	}

	public Integer getTeaId() {
		return teaId;
	}

	public void setTeaId(Integer teaId) {
		this.teaId = teaId;
	}
	
	
}
