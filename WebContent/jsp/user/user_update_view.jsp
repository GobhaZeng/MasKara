<%@page import="com.gobha.user.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>修改用户信息</title>
		<link type="text/css" href="css/user_update_view.css" rel="stylesheet">
	</head>
	<body>
	<%
		User user=(User)request.getAttribute("user");
	%>
		<form action="jsp/user/user_update_operate.jsp" method="post" id="form">
		<span>账号:&nbsp;&nbsp;&nbsp;</span><input type="text" name="account" value="<%=user==null?request.getAttribute("account"):user.getAccount()%>" disabled><br/>
		<span>姓名:&nbsp;&nbsp;&nbsp;</span><input type="text" name="user_name" value="" placeholder="可以修改"><span class="error">&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getAttribute("message")==null?"":request.getAttribute("message") %></span><br/>
		<span>日期:&nbsp;&nbsp;&nbsp;</span><input type="date" name="create_time" value="<%=user==null?request.getAttribute("create_time"):user.getCreatTime()%>">
		<button class="but">数据更新</button>
		<input type="hidden" name="user_id" value="<%=user==null?request.getAttribute("user_id"):user.getUserId()%>">
		<input type="hidden" name="account" value="<%=user==null?request.getAttribute("account"):user.getAccount()%>">
		</form>
	</body>
</html>