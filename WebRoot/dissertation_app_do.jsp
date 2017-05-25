<%@page import="dao.ReviewDAO"%>
<%@page import="dao.RealmDao"%>
<%@page import="dao.DissertationDAO"%>
<%@page import="models.Dissertation"%>
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
					<h1 class="page-header">
						欢迎您，<%=tea.getTea_name()%></h1>
				</div>
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">论文分派</div>
						<%
						Dissertation dis = DissertationDAO.getDissertationByNo(request.getParameter("dis_no"));
						%>

						<div class="panel-body">
							<form action="AddReviewServlet" method="POST" id="form">
										<div class="row">
											<input type="hidden" name="no" value="<%=request.getParameter("dis_no")%>">
											<div class="col-md-6">
												<div class="form-group">
													<label>标题</label> <input type="text" disabled="disabled"
														class="form-control border-input" placeholder="Company"
														name="title" value="<%=dis.getDis_title()%>">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>关键词</label> <input type="text" disabled="disabled"
														class="form-control border-input" placeholder="关键词"
														value="<%=dis.getDis_keyword()%>" name="keyword">
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>领域</label> <input type="text" disabled="disabled"
														class="form-control border-input" placeholder="Company"
														name="title"
														value="<%=RealmDao.getNameByNo("" + dis.getDis_realm())%>">
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>审核教师</label>
													<select name="teacher" class="form-control">
													<%
													ArrayList<Teacher> al = TeacherDAO.getTeacherByRealm(dis.getDis_realm()+"");
													for(Teacher t : al){
													%>
													<option value="<%=t.getTea_no()%>"><%=t.getTea_name() %></option>
													<%
													}
													%>
													</select>
												</div>
											</div>
										</div>
										<div class="text-center">
											<button type="submit" class="btn btn-info btn-fill btn-wd">提交</button>
										</div>
										<div class="clearfix"></div>
									</form>
						</div>
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
