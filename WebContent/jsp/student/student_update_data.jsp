<%@page import="com.gobha.student.vo.Student"%>
<%@page import="com.gobha.student.dao.StudentDao"%>
<%@page import="com.gobha.help.DataBaseConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String student_code=request.getParameter("student_code");
	DataBaseConnection dbc=new DataBaseConnection();
	StudentDao studentDao=new StudentDao(dbc.getConnection());
	Student student=studentDao.load(Integer.parseInt(student_code));
	request.setAttribute("student", student);
	request.getRequestDispatcher("/jsp/student/student_update_view.jsp").forward(request, response);	
%>