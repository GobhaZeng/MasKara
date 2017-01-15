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
    <link type="text/css" href="/login/css/student_insert_view.css" rel="stylesheet">
</head>
<body>
<form action="student_insert_operate.jsp" method="post" id="form">
    <span>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:&nbsp;&nbsp;&nbsp;</span><input type="number" name="student_code" value=""><span class="error">&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getAttribute("student_code")==null?"":request.getAttribute("student_code") %></span><br/>
    <span>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:&nbsp;&nbsp;&nbsp;</span><input type="text" name="student_name" value=""><span class="error">&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getAttribute("student_name")==null?"":request.getAttribute("student_name") %></span><br/>
  	<span>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:&nbsp;&nbsp;&nbsp;</span><input type="radio" name="sex" value="男" class="radio">&nbsp;男&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" value="女" class="radio">&nbsp;女<span class="error">&nbsp;&nbsp;&nbsp;&nbsp;<%=request.getAttribute("sex")==null?"":request.getAttribute("sex") %></span><br/>
	<span>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;校:&nbsp;&nbsp;&nbsp;</span><select class="select" name="school_name">
													<option value="1">人文</option>
													<option value="2">建工</option>
													<option value="3">财经</option>
													<option value="4">吉大</option>											
												</select><br/>
	<span>班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级:&nbsp;&nbsp;&nbsp;</span><select class="select" name="fk_class_id">
													<option value="1">超越43</option>
													<option value="2">祥云20</option>
													<option value="3">锦绣30</option>				
												</select><br/>
	<div class="course_tittle"><span>课&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;程:&nbsp;&nbsp;&nbsp;</span></div>
			<div class="course">			
				<div>数学:&nbsp;&nbsp;&nbsp;<input name="1" type="checkbox" value="1" class="checkbox"></div>
				<div>语文:&nbsp;&nbsp;&nbsp;<input name="2" type="checkbox" value="2" class="checkbox"></div>
				<div>英语:&nbsp;&nbsp;&nbsp;<input name="3" type="checkbox" value="3" class="checkbox"></div>
				<div>政治:&nbsp;&nbsp;&nbsp;<input name="4" type="checkbox" value="4" class="checkbox"></div>
				<div>计算机:&nbsp;&nbsp;<input name="5" type="checkbox" value="5" class="checkbox"></div>
				<div>历史:&nbsp;&nbsp;&nbsp;<input name="6" type="checkbox" value="6" class="checkbox"></div>	
			</div>							
    <button class="but">数据更新</button>
</form>
</body>
</html>