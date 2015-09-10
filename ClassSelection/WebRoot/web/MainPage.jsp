<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="gbk" 
    import="java.sql.Connection,
			java.sql.DriverManager,
			java.sql.ResultSet,
			java.sql.SQLException,
			java.sql.Statement,
			javaBean.Optional_courses"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<base href="<%=request.getContextPath() %>/">
<title>CLASS SELECTION</title>
<link type="text/css" href="style/main.css" rel=stylesheet>
<script type="text/javascript" src="scripts/jquery191.js"></script>
<script type="text/javascript" src="scripts/table.js"></script>
<script type="text/javascript" src="scripts/addChoose.js"></script>
</head>
<body>
<jsp:include page="Head.jsp"></jsp:include>
<jsp:useBean id="new_course" scope="page" class="javaBean.Optional_courses"/>
<div id="course">
<table id="tcourse"><tr class="tHead"><td>CLASSLIST</td></tr>

<%  Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/test","root","sqrl4101");
	Statement st=con.createStatement();
	ResultSet user=st.executeQuery("select * from `current_user`");
	int stu=0;
	while(user.next())
		stu=user.getInt("stu_id");
	ResultSet nps=st.executeQuery("select * from optional_courses"); 
	int n=1;
	while(nps.next()){
		new_course=new Optional_courses(nps);
		out.println("<tr class='subjectChoose' id="+(n++)+"><td><a onclick=\"addChoose('"+new_course.getId()+"','"+new_course.getCourse()+"','"+new_course.getTeacher()+"','"+new_course.getClassroom()+"','"+new_course.getDay()+"','"+new_course.getTime()+"');return false;\" href='#'>"+new_course.getCourse()+"</a></td></tr>");
		//int id=nps.getInt("id");
		//String course=nps.getString("course");
		//String teacher=nps.getString("teacher");
		//String classroom=nps.getString("classroom");
		//String time=nps.getString("time");
		//String day=nps.getString("day");
		//out.println("<tr class='subjectChoose' id="+(n++)+"><td><a onclick=\"addChoose('"+id+"','"+course+"','"+teacher+"','"+classroom+"','"+day+"','"+time+"');return false;\" href='#'>"+course+"</a></td></tr>");
		//st.executeQuery("truncate table current_choose");
		//st.executeQuery("insert into current_choose values("+id+")");
	}
%>
</table></div>
<div id="choose"><form action="AddCourse" method="post">
<table id="tchoose"><tr class="tHead"><td class="num">No.</td><td>Course</td><td>Teacher</td><td>Classroom</td><td>day</td><td>Time</td></tr>
<tr class="subject"><%for(int i=0;i<6;i++) out.println("<td class='chosen"+(i+1)+"'>&nbsp;</td>");%></tr>
<tr><td colspan="6" align="right"><input type="submit" value="choose"/></td></tr>
<%  /*ResultSet result=st.executeQuery("select * from current_choose");
	int chosen_id=result.getInt("id");
	result=st.executeQuery("select * from optional_courses where id="+chosen_id);
	String course=result.getString("course");
	String teacher=result.getString("teacher");
	String classroom=result.getString("classroom");
	String time1=nps.getString("time");
	String day1=nps.getString("day");
	st.executeQuery("insert into required_courses course,teacher,classroom,time,day values("+course+","+teacher+","+classroom+","+time1+","+day1);
	*/ %>
</table></form>
</div>
<div id="schedule">
<table id="tschedule">
	<caption>Schedule</caption>
	<thead><tr class="tHead"><td class="num">No.</td><td>Monday</td><td>Tuesday</td><td>Wednesday</td><td>Thursday</td><td>Friday</td><td>Saturday</td><td>Sunday</td>		
	<%  String run="select * from required_courses where stu_id=0 or stu_id="+stu;
		ResultSet nps1=st.executeQuery(run);
		for(int i=0;i<5;i++){
			out.println("<tr class='subject'>");		
			out.println("<td class='num'>"+(2*i+1)+"-"+(2*i+2)+"</td>");
			for(int j=0;j<7;j++){
				String week="";
				String ctime="";
				switch(j){
					case 0:week="Monday";break;
					case 1:week="Tuesday";break;
					case 2:week="Wednesday";break;
					case 3:week="Thursday";break;
					case 4:week="Friday";break;
					case 5:week="Saturday";break;
					case 6:week="Sunday";break;
				}
				switch(i){
					case 0:ctime="1-2";break;
					case 1:ctime="3-4";break;
					case 2:ctime="5-6";break;
					case 3:ctime="7-8";break;
					case 4:ctime="9-10";break;
				}
				while(nps1.next()){			
					String day=nps1.getString("day");
					String time=nps1.getString("time");
					if(day.equals(week)&&time.equals(ctime)){					
						if(i%2==0){
							if(j%2==0){
								out.println("<td class='even'>"+nps1.getString("course")+"</td>");
								nps1=st.executeQuery(run);
								break;
							}	
							else{
								out.println("<td class='odd'>"+nps1.getString("course")+"</td>");
								nps1=st.executeQuery(run);
								break;
							}
						}
						else
						{
							if(j%2==0){
								out.println("<td class='odd'>"+nps1.getString("course")+"</td>");
								nps1=st.executeQuery(run);
								break;
							}
							else{
								out.println("<td class='even'>"+nps1.getString("course")+"</td>");
								nps1=st.executeQuery(run);
								break;
							}
						}
					}
					else
						continue;
				}
				if(!nps1.next()){
					if(i%2==0){
						if(j%2==0){
							out.println("<td class='even'>&nbsp;</td>");
							//break;
						}	
						else{
							out.println("<td class='odd'>&nbsp;</td>");
							//break;
						}
					}
					else
					{
						if(j%2==0){
							out.println("<td class='odd'>&nbsp;</td>");
							//break;
						}
						else{
							out.println("<td class='even'>&nbsp;</td>");
							//break;
						}
					}
				}
				nps1=st.executeQuery(run);
			}
			out.println("</tr>");
		}
	%>
</table>
</div>
<div class="bottom">Right 2013/4/2-2013/5/2 By sqrl</div>
</body>
</html>