<%@page import="com.gobha.user.dao.UserDao"%>
<%@page import="com.gobha.help.DataBaseConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String user_id=request.getParameter("user_id");
	DataBaseConnection dbc=new DataBaseConnection();
	UserDao userDao=new UserDao(dbc.getConnection());
	try{
		userDao.delete(Integer.parseInt(user_id));
		response.sendRedirect(request.getContextPath()+"/jsp/user/user_list_data.jsp");
	}catch(Exception e){
		request.setAttribute("message", "删除用户信息失败");
		request.setAttribute("url", "jsp/user/user_update_data.jsp?user_id="+user_id);	
		request.getRequestDispatcher("/jsp/message.jsp").forward(request, response);
	}
	
%>