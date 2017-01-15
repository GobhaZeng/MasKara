<%@page import="com.gobha.user.vo.User"%>
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
	UserDao userDao=new UserDao(dbc.getConnection());
	List<User> userList=userDao.list();
	request.setAttribute("users", userList);
	request.getRequestDispatcher("/jsp/user/user_list_view.jsp").forward(request, response);
%>