package com.gobha.student.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.gobha.student.vo.Student;

public class StudentDao {
	private Connection connection;
	public StudentDao(Connection connection){
		this.connection=connection;
	}
	public List<Student> list(){
		String sql="SELECT s.student_id,s.student_code,s.student_name,s.sex,s.school,cl.class_name FROM student s LEFT JOIN class cl ON s.fk_class_id=cl.class_id ORDER BY student_code ASC";
		List<Student> studentList = new ArrayList<>();
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{
			ps=this.connection.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()){
				Student student=new Student();
				student.setStudent_id(rs.getInt("student_id"));
				student.setStudent_code(rs.getInt("s.student_code"));
				student.setStudent_name(rs.getString("s.student_name"));
				student.setSex(rs.getString("s.sex"));
				student.setSchool(rs.getString("s.school"));
				student.setClass_name(rs.getString("cl.class_name"));	
				
				String sql_course = "select c.course_name from student_link_course slc,student s ,course c where slc.fk_student_id=s.student_id and slc.fk_course_id=c.course_id and s.student_code=?";
				PreparedStatement ps_course = null;
				ResultSet rs_course = null;
				ps_course = this.connection.prepareStatement(sql_course);
				ps_course.setInt(1, rs.getInt("s.student_code"));
				rs_course=ps_course.executeQuery();
				while(rs_course.next()){
					student.setCourseList(rs_course.getString("c.course_name"));
				}
				
				studentList.add(student);	
			}
			return studentList;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("学生信息查询失败");
		} finally {
			try {
				if(rs!=null){
					rs.close();
				}
				if(ps!=null){
					ps.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("尝试关闭资源出错");
			}	
		}
	}
	public Student load(Integer student_code){
		String sql = "SELECT s.student_id,s.student_code,s.student_name,s.sex,s.school,cl.class_name FROM student s LEFT JOIN class cl ON s.fk_class_id=cl.class_id WHERE s.student_code=?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = this.connection.prepareStatement(sql);
			ps.setInt(1, student_code);
			rs = ps.executeQuery();
			if(rs.next()) {				
				Student student=new Student();
				student.setStudent_id(rs.getInt("s.student_id"));
				student.setStudent_code(rs.getInt("s.student_code"));
				student.setStudent_name(rs.getString("s.student_name"));
				student.setSex(rs.getString("s.sex"));
				student.setSchool(rs.getString("s.school"));
				student.setClass_name(rs.getString("cl.class_name"));
				return student;
			}else{
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("load方法错误");
		} finally {
			try {
				if(rs!=null){
					rs.close();
				}
				if(ps!=null){
					ps.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("尝试关闭资源出错");
			}	
		}
	}
	public void update(Object...objects){
		String sql = "UPDATE student s LEFT JOIN class cl ON s.fk_class_id=cl.class_id SET s.student_name=?,s.sex=?,s.school=?,s.fk_class_id=? WHERE s.student_code=?";
		PreparedStatement ps = null;
		try {
			ps = this.connection.prepareStatement(sql);
			if(objects!=null&&objects.length>0){
				for(int i=0;i<objects.length;i++){
					ps.setObject(i+1, objects[i]);
				}
			}
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("更新数据失败");
		} finally {
			try {
				if(ps!=null){
					ps.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("尝试关闭资源出错");
			}	
		}
	}
	public void update_course(Integer student_id,List<String> fk_course_id){
		String sql1 = "DELETE FROM student_link_course WHERE fk_student_id=?";
		String sql2 = "INSERT INTO student_link_course (fk_course_id,fk_student_id) VALUES (?,?)";
		PreparedStatement ps = null;
		try {
			ps = this.connection.prepareStatement(sql1);
			ps.setObject(1,student_id);
			ps.executeUpdate();			
			Iterator<String> iter = fk_course_id.iterator();
			ps = this.connection.prepareStatement(sql2);
			while(iter.hasNext()){
				ps.setObject(1, iter.next());
				ps.setObject(2, student_id);
				ps.executeUpdate();	
	        }
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("删除数据失败");
		} finally {
			try {
				if(ps!=null){
					ps.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("尝试关闭资源出错");
			}	
		}
	}
	public void delete(Integer student_id,Integer stuent_code){
		String sql1 = "DELETE FROM student_link_course WHERE fk_student_id=?";
		String sql2 = "DELETE FROM student WHERE student_code=?";
		PreparedStatement ps = null;
		try {
			ps = this.connection.prepareStatement(sql1);
			ps.setObject(1,student_id);
			ps.executeUpdate();
			ps = this.connection.prepareStatement(sql2);
			ps.setObject(1,stuent_code);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("删除数据失败");
		} finally {
			try {
				if(ps!=null){
					ps.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("尝试关闭资源出错");
			}	
		}
	}
	public void insert(Student student){
		String sql1 = "INSERT INTO student (student.student_code,student.student_name,student.sex,student.school,student.fk_class_id) VALUES (?,?,?,?,?)";
		String sql2 = "SELECT student_id FROM student WHERE student_code=?";
		String sql3 = "INSERT INTO student_link_course (fk_course_id,fk_student_id) VALUES (?,?)";
		PreparedStatement ps = null;
		ResultSet rs=null;
		try {
			ps = this.connection.prepareStatement(sql1);
			ps.setObject(1,student.getStudent_code());
			ps.setObject(2,student.getStudent_name());
			ps.setObject(3,student.getSex());
			ps.setObject(4,student.getSchool());
			ps.setObject(5,student.getClass_name());
			ps.executeUpdate();
			
			ps = this.connection.prepareStatement(sql2);
			ps.setObject(1, student.getStudent_code());
			rs=ps.executeQuery();
			
			if(rs.next()){
				String student_id=rs.getString("student_id");
				ps = this.connection.prepareStatement(sql3);
				List<String> course_list=student.getCourseList();
				Iterator<String> iter = course_list.iterator();
				while(iter.hasNext()){
					ps.setObject(1, iter.next());
					ps.setObject(2, student_id);
					ps.executeUpdate();	
		        }
			}			
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("增加用户失败");
		} finally {
			try {
				if(ps!=null){
					ps.close();
				}
				if(rs!=null){
					rs.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("尝试关闭资源出错");
			}	
		}
	}
}
