<%@page import="java.util.Iterator"%>
<%@page import="com.gobha.student.vo.Student"%>
<%@page import="com.gobha.student.dao.StudentDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="com.gobha.user.vo.User"%>
<%@page import="com.gobha.user.dao.UserDao"%>
<%@page import="com.gobha.help.DataBaseConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	request.setCharacterEncoding("UTF-8");
	String student_code = request.getParameter("student_code");
	String student_name = request.getParameter("student_name");
	String sex = request.getParameter("sex");
	String school_name = request.getParameter("school_name");
	String fk_class_id = request.getParameter("fk_class_id");
	int num = Integer.parseInt(school_name);
	switch (num) {
	case 1:
		school_name = "人文";
		break;
	case 2:
		school_name = "建工";
		break;
	case 3:
		school_name = "财经";
		break;
	case 4:
		school_name = "吉大";
		break;
	default:
		request.setAttribute("message", "更新用户信息失败");
		request.getRequestDispatcher("/jsp/message.jsp").forward(request, response);
		return;
	}	
	try {
		if (student_code == null || student_code == "") {
			request.setAttribute("student_code", "学号不能为空！");
			request.getRequestDispatcher("/jsp/student/student_insert_view.jsp").forward(request, response);
			return;
		}
		if (student_name == null || student_name == "") {
			request.setAttribute("student_name", "姓名不能为空！");
			request.getRequestDispatcher("/jsp/student/student_insert_view.jsp").forward(request, response);
			return;
		}
		if (sex == null || sex == "") {
			request.setAttribute("sex", "请选择性别！");
			request.getRequestDispatcher("/jsp/student/student_insert_view.jsp").forward(request, response);
			return;
		}				
		Student student=new Student();
		student.setStudent_code(Integer.parseInt(student_code));
		student.setStudent_name(student_name);
		student.setSex(sex);
		student.setSchool(school_name);
		student.setClass_name(fk_class_id);
		if (request.getParameter("1") != null) {
			student.setCourseList("1");
		}
		if (request.getParameter("2") != null) {
			student.setCourseList("2");
		}
		if (request.getParameter("3") != null) {
			student.setCourseList("3");
		}
		if (request.getParameter("4") != null) {
			student.setCourseList("4");
		}
		if (request.getParameter("5") != null) {
			student.setCourseList("5");
		}
		if (request.getParameter("6") != null) {
			student.setCourseList("6");
		}
		DataBaseConnection dbc = new DataBaseConnection();
		StudentDao studentDao = new StudentDao(dbc.getConnection());
		studentDao.insert(student);
		response.sendRedirect(request.getContextPath() + "/jsp/student/student_list_data.jsp");
	} catch (Exception e) {
		e.printStackTrace();
		request.setAttribute("message", "更新用户信息失败");
		request.getRequestDispatcher("/jsp/message.jsp").forward(request, response);
	}
%>