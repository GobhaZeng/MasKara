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
	request.setCharacterEncoding("UTF-8");

	String user_name=request.getParameter("user_name");
	String create_time=request.getParameter("create_time");
	String user_id = request.getParameter("user_id");
	String account = request.getParameter("account");
	
	DataBaseConnection dbc=new DataBaseConnection();
	UserDao userDao=new UserDao(dbc.getConnection());
	try{
		if(user_name==null||user_name==""){
			request.setAttribute("message", "姓名不能为空！");
			request.setAttribute("account", account);
			request.setAttribute("create_time", create_time);
			request.setAttribute("user_id", user_id);
			request.getRequestDispatcher("/jsp/user/user_update_view.jsp").forward(request, response);
			return;
		}
		userDao.update(user_name,create_time,user_id);
		response.sendRedirect(request.getContextPath()+"/jsp/user/user_list_data.jsp");
	}catch(Exception e){
		request.setAttribute("message", "更新用户信息失败");
		request.setAttribute("url", "jsp/user/user_update_data.jsp?user_id="+user_id);	
		request.getRequestDispatcher("/jsp/message.jsp").forward(request, response);
	}
%>