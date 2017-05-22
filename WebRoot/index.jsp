<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>广西大学会议管理系统后台 - 首页</title>

    <%@include file="headcss.html"%>
</head>

<body>

    <div id="wrapper">
		<%@include file="nav.jsp" %>
        

    </div>
    <!-- /#wrapper -->
	<%@include file="footerjs.html" %>
    
</body>

</html>
