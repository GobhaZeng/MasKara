<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.gobha.student.dao.StudentDao"%>
<%@page import="com.gobha.help.DataBaseConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	request.setCharacterEncoding("UTF-8");

	String student_code=request.getParameter("student_code");
	String student_name=request.getParameter("student_name");
	String sex=request.getParameter("sex");
	String school_name=request.getParameter("school_name");
	String fk_class_id=request.getParameter("fk_class_id");
	int num=Integer.parseInt(school_name);
	switch(num){
		case 1:
			school_name="人文";
			break;
		case 2:
			school_name="建工";
			break;
		case 3:
			school_name="财经";	
			break;
		case 4:
			school_name="吉大";	
			break;
		default :
			request.setAttribute("message", "更新用户信息失败");
			request.getRequestDispatcher("/jsp/message.jsp").forward(request, response);
			return;
	}
	List<String> fk_course_id=new ArrayList<String>();
	if(request.getParameter("1")!=null){
		fk_course_id.add(request.getParameter("1"));
	}
	if(request.getParameter("2")!=null){
		fk_course_id.add(request.getParameter("2"));
	}
	if(request.getParameter("3")!=null){
		fk_course_id.add(request.getParameter("3"));
	}
	if(request.getParameter("4")!=null){
		fk_course_id.add(request.getParameter("4"));
	}
	if(request.getParameter("5")!=null){
		fk_course_id.add(request.getParameter("5"));
	}
	if(request.getParameter("6")!=null){
		fk_course_id.add(request.getParameter("6"));
	}
	DataBaseConnection dbc=new DataBaseConnection();
	StudentDao studentDao=new StudentDao(dbc.getConnection());
	try{
		if(student_name==null||student_name==""){
			request.setAttribute("message", "姓名不能为空！");
			request.getRequestDispatcher("/jsp/student/student_update_view.jsp").forward(request, response);
			return;
		}
		Integer number=Integer.parseInt(request.getParameter("student_id"));
		studentDao.update(student_name,sex,school_name,fk_class_id,student_code);
		studentDao.update_course(number, fk_course_id);
		response.sendRedirect(request.getContextPath()+"/jsp/student/student_list_data.jsp");
	}catch(Exception e){
		e.printStackTrace();
		request.setAttribute("message", "更新用户信息失败");
		request.getRequestDispatcher("/jsp/message.jsp").forward(request, response);
	}
%>