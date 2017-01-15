<%@page import="com.gobha.user.vo.User"%>
<%@page import="com.gobha.user.dao.UserDao"%>
<%@page import="com.gobha.help.DataBaseConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String userId=request.getParameter("user_id");
	DataBaseConnection dbc=new DataBaseConnection();
	UserDao userDao=new UserDao(dbc.getConnection());
	User user=userDao.load(Integer.parseInt(userId));
	request.setAttribute("user", user);
	request.getRequestDispatcher("/jsp/user/user_update_view.jsp").forward(request, response);	
%>