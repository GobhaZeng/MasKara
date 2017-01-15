<%@page import="com.gobha.student.dao.StudentDao"%>
<%@page import="com.gobha.help.DataBaseConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String student_id=request.getParameter("student_id");
	String student_code=request.getParameter("student_code");
	
	DataBaseConnection dbc=new DataBaseConnection();
	StudentDao studentDao=new StudentDao(dbc.getConnection());
	try{
		studentDao.delete(Integer.parseInt(student_id),Integer.parseInt(student_code));
		response.sendRedirect(request.getContextPath()+"/jsp/student/student_list_data.jsp");
	}catch(Exception e){
		request.setAttribute("message", "删除用户信息失败");
		request.getRequestDispatcher("/jsp/message.jsp").forward(request, response);
	} 
	
%>