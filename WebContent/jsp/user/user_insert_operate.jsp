<%@page import="java.util.Date"%>
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

	DataBaseConnection dbc=new DataBaseConnection();
	UserDao userDao=new UserDao(dbc.getConnection());
	
	String account=request.getParameter("account");
	String password1=request.getParameter("password1");
	String password2=request.getParameter("password2");	
	String user_name=request.getParameter("user_name");
	
	if(account.equals("")||account==null){
		request.setAttribute("account", account);
		request.setAttribute("user_name", user_name);
		request.setAttribute("account_message", "用户名不能为空！");
		request.getRequestDispatcher("/jsp/user/user_insert_view.jsp").forward(request, response);	
	}else{
		if(password1.equals(password2)){
			User user=new User();
			user.setAccount(account);
			user.setPassword(password1);
			user.setUserName(user_name);
			user.setCreatTime(new Date());
			try{
				userDao.insert(user);
				response.sendRedirect("/login/jsp/user/user_list_data.jsp");
			}catch(Exception e){
				request.setAttribute("message", "添加用户失败");
				request.getRequestDispatcher("/jsp/message.jsp").forward(request, response);
			}
		}else{
			request.setAttribute("account", account);
			request.setAttribute("user_name", user_name);
			request.setAttribute("message", "两次密码不一致！");
			request.getRequestDispatcher("/jsp/user/user_insert_view.jsp").forward(request, response);		
		}
	}
%>