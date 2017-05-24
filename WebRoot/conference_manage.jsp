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

<title>广西大学会议管理系统后台 - 会议基础信息管理</title>

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
					<h1 class="page-header">欢迎您，<%=tea.getTea_name()%></h1>
				</div>
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">会议基础信息管理</div>
						<%
								Conference con = ConferenceDAO.getConference();
							%>
						<form method="POST" action="ModifyConferenceServlet">
							<div class="panel-body">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label>会议名</label> <input placeholder="会议名称" type="text"
												name="name" class="form-control"
												value="<%=con.getCon_name()%>">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label>主办方</label> <input placeholder="广西数学学会&广西赛区组委会"
												type="text" name="host" class="form-control"
												value="<%=con.getCon_host()%>">
											<p class="help-block">如果有多个组织，组织名中用“&amp;”链接。</p>
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label>承办方</label> <input placeholder="广西数学学会&广西赛区组委会"
												type="text" name="organizer" class="form-control"
												value="<%=con.getCon_organizer()%>">
											<p class="help-block">如果有多个组织，组织名中用“&amp;”链接。</p>
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label>协办方</label> <input placeholder="广西数学学会&广西赛区组委会"
												type="text" name="co_organizer" class="form-control"
												value="<%=con.getCon_co_organizer()%>">
											<p class="help-block">如果有多个组织，组织名中用“&amp;”链接。</p>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-3">
										<div class="form-group">
											<label>开始日期</label> <input placeholder="开始日期" type="date"
												name="startdate" class="form-control"
												value="<%=con.getCon_startdate()%>">
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<label>结束日期</label> <input placeholder="结束日期" type="date"
												name="enddate" class="form-control"
												value="<%=con.getCon_enddate()%>">
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<%
												SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-MM-dd");
												SimpleDateFormat formatter2 = new SimpleDateFormat("hh:mm");
												Date d = con.getCon_upstartdate(); 
												String s = "";
												if(d != null){
													s = formatter1.format(d) + "T" + formatter2.format(d);
												}
												%>
											<label>论文上传时间</label> <input placeholder="论文上传时间"
												type="datetime-local" name="upstartdate"
												class="form-control" value="<%=s%>">
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<%
												Date d2 = con.getCon_upenddate();
												String s2 = "";
												if(d2 != null){
													s2 = formatter1.format(d) + "T" + formatter2.format(d);
												}
												%>
											<label>论文截止时间</label> <input placeholder="论文截止时间"
												value="<%=s2%>" type="datetime-local" name="upenddate"
												class="form-control">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>地点</label> <input placeholder="地点" type="text"
												name="address" class="form-control"
												value="<%=con.getCon_address()%>">
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<label>会务联系人</label> <select class="form-control"
												name="affair_linkman">
												<%
														ArrayList<Teacher> al = TeacherDAO.getAllTeacher();
													                                            for(Teacher t : al){
													%>
												<option value="<%=t.getTea_no()%>"
													<%if(con.getCon_affair_linkman() == t.getTea_no()) {%>
													selected="selected" <%}%>><%=t.getTea_name()%></option>
												<%
														}
													%>
											</select>
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
											<label>财务联系人</label> <select class="form-control"
												name="finance_linkman">
												<%
														for(Teacher t : al){
													%>
												<option value="<%=t.getTea_no()%>"
													<%if(con.getCon_finance_linkman() == t.getTea_no()){%>
													selected="selected" <%}%>><%=t.getTea_name()%></option>
												<%
														}
													%>
											</select>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label>主要内容</label>
											<textarea style="resize:none;" class="form-control" rows="3"
												name="content"><%=con.getCon_contents()%></textarea>
											<p class="help-block">如需换行，后面跟上&lt;br&gt;</p>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label>就餐安排</label>
											<textarea style="resize:none;" class="form-control" rows="3"
												name="repast"><%=con.getCon_repast()%></textarea>
											<p class="help-block">如需换行，后面跟上&lt;br&gt;</p>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label>投稿指南</label>
											<textarea style="resize:none;" class="form-control" rows="3"
												name="scopen"><%=con.getCon_scopen()%></textarea>
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
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.col-lg-12 -->

		</div>
		<%
				String str = (String)session.getAttribute("message");
				if(str != null & str != ""){
		%>
		<script type="text/javascript">
			alert("<%=str%>");
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
		<%} %>
	</div>
	<!-- /#wrapper -->
	<%@include file="footerjs.html"%>

</body>

</html>
