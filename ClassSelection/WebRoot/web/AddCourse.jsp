<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<base href="<%=request.getContextPath() %>/">
<link type="text/css" href="style/backstage.css" rel="stylesheet">
<link type="text/css" href="style/main.css" rel=stylesheet>
<script type="text/javascript" src="scripts/checkDate.js"></script>
</head>
<body>
<jsp:include page="Head.jsp"></jsp:include>
<jsp:include page="Backstage_left.jsp"></jsp:include>
<form action="AddCourse_back" method="post" onsubmit="return checkDate_addCourse();">
<table class="addCourse"><thead><tr><td colspan="2">ADD COURSE</thead>
<tr><td>course</td><td><input id="addcourse" type="text" name="course"></td></tr>
<tr><td>teacher</td><td><input id="addteacher" type="text" name="teacher"></td></tr>
<tr><td>Classroom</td><td><input id="addclassroom" type="text" name="classroom"></td></tr>
<tr><td>day</td><td><input id="addday" type="text" name="day"></td></tr>
<tr><td>Time</td><td><input id="addtime" type="text" name="time"></td></tr>
<tr><td colspan="2" align="right"><input type="submit" name="add_submit" value="add"></td></tr>
</table></form>
</body>
</html>