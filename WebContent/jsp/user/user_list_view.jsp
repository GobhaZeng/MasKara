
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.gobha.user.vo.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	a{
		text-decoration: none;
	}
</style>
</head>
<body>
	<div class="table" style="width: 400px;">
		<table border="1"  cellspacing="0" style="width: 500px; text-align: center">
			<caption style="padding: 0 0 8px 0">用户列表</caption>
			<thead>
				<tr>
					<td>序号</td>
					<td>账号</td>
					<td>姓名</td>
					<td>创建时间</td>
					<td>操作</td>
				</tr>
			</thead>
			<tbody>
				<%
					DateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					List<User> userList=(List<User>)request.getAttribute("users");
					int i=1;
					for (User user : userList) {
				%>
				<tr>
					<td><%=i++%></td>
					<td><%=user.getAccount()%></td>
					<td><%=user.getUserName()%></td>
					<td><%=user.getCreatTime()!=null?df.format(user.getCreatTime()):""%></td>
					<td>
						<a href="jsp/user/user_update_data.jsp?user_id=<%=user.getUserId()%>">修改</a>
						|
						<a href="jsp/user/user_delete_operate.jsp?user_id=<%=user.getUserId()%>">删除</a>
					</td>
				</tr>
				<%
					}
				%>
			</tbody>
			<tfoot>
				<tr>
					<td style="text-align: right" colspan="5">查询完毕&nbsp;&nbsp;&nbsp;&nbsp;<a href="jsp/user/user_insert_view.jsp">添加用户</a></td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>