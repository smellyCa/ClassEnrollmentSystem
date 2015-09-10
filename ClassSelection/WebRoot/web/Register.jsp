<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<base href="<%=request.getContextPath() %>/">
<title>CLASS SELECTION</title>
<link type="text/css" href="style/main.css" rel="stylesheet">
<link type="text/css" href="style/register.css" rel="stylesheet">
<script type="text/javascript" src="scripts/jquery191.js"></script>
<script type="text/javascript" src="scripts/pupup.js"></script>
<script type="text/javascript" src="scripts/checkDate.js"></script>
</head>
<body>
<div class="head">NEU CLASS SELECTION SYSTEM</div>
<div id="input">
<form action="LoginServlet1" method="post" name="login" onsubmit="return checkDate_login()"><table id="tinput"><thead id="title"><tr><td>Login</td></tr></thead>
<tr><td><img src="images/user.png"/>学号</td><td><input id="student_id" type="text" name="student_id"/></td></tr>
<tr><td><img src="images/password.jpg"/>密码</td><td><input id="password_login" type="password" name="password"/></td></tr>
<tr><td><a href="#" onclick="return show()">注册</a></td><td><input type="submit" value="登录"/></td></tr>
</table></form></div>
<div id="popup"><img src="images/our_service.gif" id="window">
<form action="RegisterServlet" method="post" name="register"  onsubmit="return checkDate_register()">
<table id="tregister"><thead id="poptitle"><tr><td>user register</td></tr></thead>
<tr><td>studentId</td><td><input id="studentId" type="text" name="studentId"></td></tr>
<tr><td>username</td><td><input id="username" type="text" name="username"></td></tr>
<tr><td>password</td><td><input id="password_register" type="password" name="password"></td></tr>
<tr><td>major</td><td><input class="major" type="text" name="major"></td></tr>
<tr><td></td><td><button onclick="return hide()">Close window</button><input type="submit" value="register"/></td>
</table></form></div>
<div class="bottom">Right 2013 4/2-2013 5/2 By sqrl</div>
</body>
</html>