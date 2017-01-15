package com.gobha.student.vo;

import java.util.ArrayList;
import java.util.List;

public class Student {
	List<String> courseList=new ArrayList<>();
	private Integer student_id;
	private Integer student_code;
	private String student_name;
	private String sex;
	private String school;
	private String class_name;
	
	public Integer getStudent_id() {
		return student_id;
	}
	public void setStudent_id(Integer student_id) {
		this.student_id = student_id;
	}	
	public void setCourseList(String course_name){
		courseList.add(course_name);
	}
	public List<String> getCourseList(){
		return courseList;
	}
	public Integer getStudent_code() {
		return student_code;
	}
	public void setStudent_code(Integer student_code) {
		this.student_code = student_code;
	}
	public String getStudent_name() {
		return student_name;
	}
	public void setStudent_name(String sutdent_name) {
		this.student_name = sutdent_name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
}
