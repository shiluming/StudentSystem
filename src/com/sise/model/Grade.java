package com.sise.model;

public class Grade {

	private Integer id;
	private String grade;
	private String gradeName;
	private Integer teacher;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	public Integer getTeacher() {
		return teacher;
	}
	public void setTeacher(Integer teacher) {
		this.teacher = teacher;
	}
	@Override
	public String toString() {
		return "Grade [id=" + id + ", grade=" + grade + ", gradeName=" + gradeName + ", teacher=" + teacher + "]";
	}
}
