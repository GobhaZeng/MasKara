<%@page import="com.gobha.student.dao.StudentDao"%>
<%@page import="com.gobha.student.vo.Student"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
	DataBaseConnection dbc=new DataBaseConnection();
	StudentDao studentDao=new StudentDao(dbc.getConnection());
	List<Student> studentList =studentDao.list();
	request.setAttribute("studentList", studentList);
	request.getRequestDispatcher("/jsp/student/student_list_view.jsp").forward(request, response);
%>