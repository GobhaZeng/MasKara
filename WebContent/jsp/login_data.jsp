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
	String account=request.getParameter("account");
	String password=request.getParameter("password");
		
	if(account==null||password==null){
		request.setAttribute("error", "请先登录");
		request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
		return;
	}	
	if("".equals(account.trim())){ //如果account未填写
		if("".equals(password.trim())){//如果paasword也没填写
			request.setAttribute("error", "用户名、密码不能为空");
			request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
			return;
		}else{
			request.setAttribute("error", "用户名不能为空");
			request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
			return;
		}
	}else{//账号填写
		if("".equals(password.trim())){//如果paasword没填写
			request.setAttribute("error", "密码不能为空");
			request.setAttribute("account", account);
			request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
			return;
		}else{//都填写
			DataBaseConnection dbc=new DataBaseConnection();
			UserDao userDao=new UserDao(dbc.getConnection());
			User user=userDao.login(account, password);
			if(user==null){
				request.setAttribute("error", "用户名或密码错误");
				request.setAttribute("account", account);
				request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
				return;
			}else{
				session.setAttribute("session_user", user);
				response.sendRedirect(request.getContextPath()+"/jsp/main.jsp");
				return;
			}
		}
	}
%>