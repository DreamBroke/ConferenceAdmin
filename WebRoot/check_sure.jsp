<%@page import="dao.RoomDAO"%>
<%@page import="dao.RepresentorDAO"%>
<%@page import="models.Check"%>
<%@page import="dao.CheckDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.ConferenceDAO"%>
<%@page import="models.Conference"%>
<%@page import="dao.TeacherDAO"%>
<%@page import="models.Teacher"%>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
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

<title>广西大学会议管理系统后台 - 预订订单确认</title>

<%@include file="headcss.html"%>
</head>

<body>

	<div id="wrapper">
		<%@include file="nav.jsp"%>
		<%
			Teacher tea = (Teacher)session.getAttribute("tea");
			if(tea != null){
		%>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">
						欢迎您，<%=tea.getTea_name()%></h1>
				</div>
			</div>
			<!-- /.row -->
			<div class="row">

				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							预订订单确认
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover"
									id="table">
									<thead>
										<tr>
											<th>支付账户</th>
											<th>支付金额</th>
											<th>支付时间</th>
											<th>参会代表</th>
											<th>房间类型</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<%
										SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
										ArrayList<Check> al = CheckDAO.selectAllCheckByRep_no();
										for(Check c : al){
										%>
										<tr>
											<td><%=c.getChe_account()%></td>
											<td><%=c.getChe_money()%></td>
											<td><%=formatter.format(c.getChe_time())%></td>
											<td><%=RepresentorDAO.getNameByNo(c.getChe_representor()+"")%></td>
											<td><%=RoomDAO.getNameByNo(c.getChe_room()+"")%></td>
											<td><a class="btn btn-primary" href="#">修改</a>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->

			</div>
			<!-- /.col-lg-12 -->

		</div>
		<%
			String str = (String)session.getAttribute("message");
				if(str != null & str != ""){
		%>
		<script type="text/javascript">
			alert("<%=str%>
			");
		</script>
		<%
			session.removeAttribute("message");
				}
			}else{
		%>
		<script type="text/javascript">
			alert("您还未登录，请先登录！");
			window.location.href = "login.jsp";
		</script>
		<%
			}
		%>
	</div>
	<!-- /#wrapper -->
	<%@include file="footerjs.html"%>

</body>

</html>
