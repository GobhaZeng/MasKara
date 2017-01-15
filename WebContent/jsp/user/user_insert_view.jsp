<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>学生信息管理系统</title>
    <link type="text/css" href="/login/css/user_insert_view.css" rel="stylesheet">
</head>
<body>
<form action="user_insert_operate.jsp" method="post" id="form">
    <span>账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:&nbsp;&nbsp;&nbsp;</span><input type="text" name="account" value="<%=request.getAttribute("account")==null?"":request.getAttribute("account")%>"><span class="error">&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getAttribute("account_message")==null?"":request.getAttribute("account_message") %></span><br/>
    <span>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp;&nbsp;</span><input type="password" name="password1" value=""><br/>
    <span>确认密码:&nbsp;&nbsp;&nbsp;</span><input type="password" name="password2" value=""><span class="error">&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getAttribute("message")==null?"":request.getAttribute("message") %></span><br/>
    <span>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:&nbsp;&nbsp;&nbsp;</span><input type="text" name="user_name" value="<%=request.getAttribute("user_name")==null?"":request.getAttribute("user_name")%>" ><br/>
    <button class="but">数据更新</button>
</form>
</body>
</html>