<%@page import="com.gobha.student.vo.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	<div class="table" style="width: 1000px;">
		<table border="1"  cellspacing="0" style="width: 500px; text-align: center">
			<caption style="padding: 0 0 8px 0">用户列表</caption>
			<thead>
				<tr>
					<td>序号</td>
					<td>学号</td>
					<td>姓名</td>
					<td>性别</td>
					<td>学校</td>
					<td>班级</td>
					<td>课程</td>	
					<td>操作</td>	
				</tr>
			</thead>
			<tbody>
				<%
					List<Student> studentList=(List<Student>)request.getAttribute("studentList");
					int i=1;
					for (Student student : studentList) {
				%>
				<tr>
					<td><%=i++%></td>
					<td><%=student.getStudent_code()%></td>
					<td><%=student.getStudent_name()%></td>
					<td><%=student.getSex()%></td>
					<td><%=student.getSchool()%></td>
					<td><%=student.getClass_name()%></td>
					
					<td>
					<%
						List<String> courseList=new ArrayList<String>();
					
						courseList=student.getCourseList();
						for(String course_name:courseList){
							%>
								<%=" "+course_name+" " %>
							<%
						}
					%>
					</td>
					
					<td>
						<a href="jsp/student/student_update_data.jsp?student_code=<%=student.getStudent_code()%>">修改</a>
						|
						<a href="jsp/student/student_delete_operate.jsp?student_id=<%=student.getStudent_id() %>&student_code=<%=student.getStudent_code()%>">删除</a>
					</td>
				</tr>
				<%
					}
				%>
			</tbody>
			<tfoot>
				<tr>
					<td style="text-align: right" colspan="8">查询完毕&nbsp;&nbsp;&nbsp;&nbsp;<a href="jsp/student/student_insert_view.jsp">添加学生信息</a></td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>