
<%@page import="com.gobha.student.vo.Student"%>
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
		<title>修改学生信息</title>
		<link type="text/css" href="css/student_update_view.css" rel="stylesheet">
	</head>
	<body>
	<%
		Student student=(Student)request.getAttribute("student");
	%>
		<form action="jsp/student/student_update_operate.jsp" method="post" id="form">
			<span>学号:&nbsp;&nbsp;&nbsp;</span><input type=text name="student_code" value="<%=student==null?request.getAttribute("student_code"):student.getStudent_code()%>" readonly="readonly"><br/>
			<span>姓名:&nbsp;&nbsp;&nbsp;</span><input type="text" name="student_name" value="" placeholder="可以修改"><span class="error">&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getAttribute("message")==null?"":request.getAttribute("message") %></span><br/>
			<span>性别:&nbsp;&nbsp;&nbsp;</span><input type="radio" name="sex" value="男" class="radio" <%=student.getSex().equals("男")?"checked='checked'":"" %>>&nbsp;&nbsp;&nbsp;男&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" value="女" class="radio" <%=student.getSex().equals("女")?"checked='checked'":"" %>>&nbsp;&nbsp;&nbsp;女&nbsp;&nbsp;&nbsp;<br/>
			<span>学校:&nbsp;&nbsp;&nbsp;</span><select class="select" name="school_name">
													<option value="1">人文</option>
													<option value="2">建工</option>
													<option value="3">财经</option>
													<option value="4">吉大</option>											
												</select><br/>
			<span>班级:&nbsp;&nbsp;&nbsp;</span><select class="select" name="fk_class_id">
													<option value="1">超越43</option>
													<option value="2">祥云20</option>
													<option value="3">锦绣30</option>				
												</select><br/>
			<div class="course_tittle"><span>课程:&nbsp;&nbsp;&nbsp;</span></div>
			<div class="course">			
				<div>数学:&nbsp;&nbsp;&nbsp;<input name="1" type="checkbox" value="1" class="checkbox"></div>
				<div>语文:&nbsp;&nbsp;&nbsp;<input name="2" type="checkbox" value="2" class="checkbox"></div>
				<div>英语:&nbsp;&nbsp;&nbsp;<input name="3" type="checkbox" value="3" class="checkbox"></div>
				<div>政治:&nbsp;&nbsp;&nbsp;<input name="4" type="checkbox" value="4" class="checkbox"></div>
				<div>计算机:<input name="5" type="checkbox" value="5" class="checkbox"></div>
				<div>历史:&nbsp;&nbsp;&nbsp;<input name="6" type="checkbox" value="6" class="checkbox"></div>	
			</div>																				
			<button class="but">数据更新</button>
			<input type="hidden" name="student_id" value="<%=student.getStudent_id()%>">
		</form>
	</body>
</html>