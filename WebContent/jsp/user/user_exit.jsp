<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	try{
		session.invalidate();
		response.sendRedirect("/login/jsp/login.jsp");
	}catch(Exception e){
		request.setAttribute("message", "退出失败");
		request.getRequestDispatcher("/jsp/message.jsp").forward(request, response);
	}
	
%>