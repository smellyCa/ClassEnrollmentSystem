package javaBean;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Required_courses {
	private int id,stu_id;
	private String course,teacher,classroom,time,day;
	public Required_courses(){
		id=0;
		stu_id=0;
		course="";
		teacher="";
		classroom="";
		time="";
		day="";
	}
	public Required_courses(ResultSet rt){
		try {
			this.setId(rt.getInt("id"));
			this.setStu_id(rt.getInt("stu_id"));
			this.setCourse(rt.getString("course"));
			this.setTeacher(rt.getString("teacher"));
			this.setClassroom(rt.getString("classroom"));
			this.setTime(rt.getString("time"));
			this.setDay(rt.getString("day"));
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
	public int getId(){
		return id;
	}
	public int getStu_id(){
		return stu_id;
	}
	public String getCourse(){
		return course;
	}
	public String getTeacher(){
		return teacher;
	}
	public String getClassroom(){
		return classroom;
	}
	public String getTime(){
		return time;
	}
	public String getDay(){
		return day;
	}
	public void setId(int id){
		this.id=id;
	}
	public void setStu_id(int stu_id){
		this.stu_id=stu_id;
	}
	public void setCourse(String course){
		this.course=course;
	}
	public void setTeacher(String teacher){
		this.teacher=teacher;
	}
	public void setClassroom(String classroom){
		this.classroom=classroom;
	}
	public void setTime(String time){
		this.time=time;
	}
	public void setDay(String day){
		this.day=day;
	}
}
