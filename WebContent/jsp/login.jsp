<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>登陆系统</title>
<link rel="stylesheet" href="css/login.css" type="text/css">
</head>
<body>
	<div id="login">
		<h1>学生管理系统</h1>
		<br />
		<form action="jsp/login_data.jsp" method="post">
			<input type="text" placeholder="用户名" name="account"
				value="<%=request.getAttribute("account") == null ? "" : request.getAttribute("account")%>"
				<%=request.getAttribute("account") == null ? "autofocus" : ""%>><br />
			<input type="password" placeholder="密码" name="password"
				<%=request.getAttribute("account") == null ? "" : "autofocus"%>><br />
			<div class="error"><%=request.getAttribute("error") == null ? "" : request.getAttribute("error")%></div>
			<br />
			<button class="but" type="submit">登录</button>
		</form>		  
	</div>	  
</body>
</html>