<%@page import="com.gobha.user.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>学生信息管理系统</title>
    <link type="text/css" href="/login/css/main.css" rel="stylesheet">
</head>
<body>
<%
	User user=(User)session.getAttribute("session_user");
%>
	<div id="header">
	    <div class="name">学生信息管理系统</div>
	    <div class="user"><span><%=user.getUserName() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;欢迎你！</span></div>
	    <div class="exit"><a href="user/user_exit.jsp" style="color:white;">[退出]</a></div>
	</div>
	<div id="menu">
		<div class="div"><a href="user/user_list_data.jsp" target="iFrame">用户信息管理</a></div>
		<div class="div"><a href="student/student_list_data.jsp" target="iFrame">学生资料管理</a></div>
	</div>
	
	<div id="iFrame">
	    <iframe class="iFrame" name="iFrame" frameborder="0" scrolling="no" allowtransparency="yes">
	    </iframe>
	</div>
</body>
</html>