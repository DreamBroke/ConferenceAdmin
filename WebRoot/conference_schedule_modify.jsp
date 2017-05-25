<%@page import="dao.TeacherDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.ScheduleDAO"%>
<%@page import="models.Schedule"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>广西大学会议管理系统后台 - 会议日程修改</title>

<%@include file="headcss.html"%>
<link href="public/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
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
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">会议日程修改</div>
						<form method="POST" action="ModifyScheduleServlet">
						<%
						Schedule sc = ScheduleDAO.getScheduleByNo(request.getParameter("sche_no"));
						%>
							<div class="panel-body">
								<div class="row">
								<input type="hidden" value="<%=sc.getSche_no()%>" name="sche_no">
									<div class="col-md-4">
										<div class="form-group">
											<label>日程日期</label> <input placeholder="日程日期"
												name="sche_date" class="form-control" type="date" value="<%=sc.getSche_date()%>">
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label>开始时间</label> <input placeholder="开始时间"
												name="sche_starttime" class="form-control" type="time"
												value="<%=sc.getSche_starttime()%>">
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label>结束时间</label> <input placeholder="结束时间"
												name="sche_endtime" class="form-control" type="time"
												value="<%=sc.getSche_endtime()%>">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-3">
										<div class="form-group">
											<label>报告人</label> <select class="form-control"
												name="sche_speaker">
												<option value="0"></option>
												<%
												ArrayList<Teacher> al = TeacherDAO.getAllTeacher();
												for(Teacher t : al){
												%>
												<option value="<%=t.getTea_no()%>" <%if(sc.getSche_speaker() == t.getTea_no()){ %> selected="selected" <%} %>><%=t.getTea_name()%></option>
												<%}%>
											</select>
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<label>类别</label>
											<input type="text" name="sche_category" class="form-control"
												value="<%=sc.getSche_category() %>">
											<p class="help-block">填“本科组/专科组”，如是全体则不填</p>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>地点</label>
											<input type="text" name="sche_address" class="form-control"
												value="<%=sc.getSche_address() %>">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label>主要内容</label>
											<textarea style="resize:none;" class="form-control" rows="3"
												name="sche_content"><%=sc.getSche_content() %></textarea>
											<p class="help-block">如需换行，后面跟上&lt;br&gt;</p>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-3"></div>
									<button type="reset" class="col-md-2 btn btn-default">重置</button>
									<div class="col-md-2"></div>
									<button type="submit" class="col-md-2 btn btn-primary">确定</button>
									<div class="col-md-3"></div>
								</div>
							</div>
						</form>
					</div>
					<!-- /.panel -->
				</div>
			</div>
		</div>
		<!-- /#page-wrapper -->

		<%				
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
	<script>
    </script>
</body>

</html>
