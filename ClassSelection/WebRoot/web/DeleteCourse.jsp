<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"
 import="java.sql.Connection,
		java.sql.DriverManager,
		java.sql.ResultSet,
		java.sql.SQLException,
		java.sql.Statement,
		javaBean.Required_courses,
		javaBean.Optional_courses"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'DeleteCourse.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<base href="<%=request.getContextPath() %>/">
	<link type="text/css" href="style/main.css" rel="stylesheet">
	<link type="text/css" href="style/backstage.css" rel="stylesheet">
	<script type="text/javascript" src="scripts/jquery191.js"></script>
	<script type="text/javascript" src="scripts/table.js"></script>
  </head>
  
  <body>
	<jsp:include page="Head.jsp"></jsp:include>
	<jsp:include page="Backstage_left.jsp"></jsp:include>
	<div class="deleteCourse">
	<form action="DeleteCourse_back" method="post">
	<table id="courses"><thead><tr><td class="check">&nbsp;</td><td>stu_id</td><td>course</td><td>teacher</td><td>classroom</td><td>time</td><td>day</td></tr></thead>
	<%  Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/test","root","sqrl4101");
		Statement st=con.createStatement();
		int n=1;
		ResultSet nps=st.executeQuery("select * from optional_courses");
		while(nps.next()){
			/*int id=nps.getInt("id");
			String course=nps.getString("course");
			String teacher=nps.getString("teacher");
			String classroom=nps.getString("classroom");
			String time=nps.getString("time");
			String day=nps.getString("day");*/
			Optional_courses new_courses=new Optional_courses(nps);
			out.print("<tr id=\"row\"><td class=\"check\"><input type=\"checkbox\" name=\"course\" value=\""+(n++)+"\"></td><td>&nbsp;</td><td>"+new_courses.getCourse()+"</td><td>"+new_courses.getTeacher()+"</td><td>"+new_courses.getClassroom()+"</td><td>"+new_courses.getTime()+"</td><td>"+new_courses.getDay()+"</td></tr>");
		}
		nps=st.executeQuery("select * from required_courses");	
		while(nps.next()){
			Required_courses new_courses=new Required_courses(nps);		
			/*int id=nps.getInt("id");
			int stu_id=nps.getInt("stu_id");
			String course=nps.getString("course");
			String teacher=nps.getString("teacher");
			String classroom=nps.getString("classroom");
			String time=nps.getString("time");
			String day=nps.getString("day");*///name=\"course"+(n++)+"\"
			out.print("<tr id=\"row\"><td class=\"check\"><input type=\"checkbox\" name=\"checkbox\" value=\""+new_courses.getId()+"\"></td><td>"+new_courses.getStu_id()+"</td><td>"+new_courses.getCourse()+"</td><td>"+new_courses.getTeacher()+"</td><td>"+new_courses.getClassroom()+"</td><td>"+new_courses.getTime()+"</td><td>"+new_courses.getDay()+"</td></tr>");
		}
	%>
	<tr><td colspan="7" align="right"><input type="submit" value="delete"/></td></tr>
	</table></form></div>
  </body>
</html>
