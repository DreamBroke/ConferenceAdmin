<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%
	String uri = request.getRequestURI();
	uri = uri.substring(uri.lastIndexOf("/") + 1);
%>
<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation"
	style="margin-bottom: 0">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="index.jsp">广西大学会议信息后台管理中心</a>
	</div>
	<!-- /.navbar-header -->

	<ul class="nav navbar-top-links navbar-right">
		<li><a href="ExitServlet"><i class="fa fa-sign-out fa-fw"></i>
				注销</a></li>
	</ul>
	<!-- /.navbar-top-links -->

	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li class="<%if(uri.startsWith("conference")){ %> active <%}%>"><a href="#"><i class="fa fa-coffee fa-fw"></i> 会议信息管理<span
						class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li class="<%if(uri.startsWith("conference_manage")){ %> active <%}%>"><a href="conference_manage.jsp">会议基础信息管理</a></li>
						<li class="<%if(uri.startsWith("conference_schedule")){ %> active <%}%>"><a href="conference_schedule.jsp">会议日程管理</a></li>
						<li class="<%if(uri.startsWith("conference_realm")){ %> active <%}%>"><a href="#">会议周边管理</a></li>
					</ul> <!-- /.nav-second-level --></li>
				<li class="<%if(uri.startsWith("teacher")){ %> active <%}%>"><a href="#"><i class="fa fa-male fa-fw"></i> 工作人员管理<span
						class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li class="<%if(uri.startsWith("teacher_manage")){ %> active <%}%>"><a href="#">工作人员管理</a></li>
						<li class="<%if(uri.startsWith("teacher_scope")){ %> active <%}%>"><a href="#">工作种类管理</a></li>
						<li class="<%if(uri.startsWith("teacher_jurisdiction")){ %> active <%}%>"><a href="#">工作权限管理</a></li>
					</ul> <!-- /.nav-second-level --></li>
				<li><a href="#"><i class="fa fa-building-o fa-fw"></i> 酒店管理<span
						class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="#">酒店信息管理</a></li>
						<li><a href="#">房间类型管理</a></li>
					</ul> <!-- /.nav-second-level --></li>
				<li><a href="#"><i class="fa fa-file-text-o fa-fw"></i>
						审批论文管理<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="#">论文分派</a></li>
						<li><a href="#">论文审批</a></li>
					</ul></li>
				<li><a href="#"><i class="fa fa-list fa-fw"></i> 类别管理<span
						class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="#">论文状态管理</a></li>
						<li><a href="#">领域信息管理</a></li>
						<li><a href="#">职称信息管理</a></li>
					</ul></li>
				<li><a href="#"><i class="fa fa-money fa-fw"></i> 财务管理<span
						class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="#">房间预订确认</a></li>
						<li><a href="#">支付手段管理</a></li>
					</ul></li>
				<li><a href="#"><i class="fa fa-user fa-fw"></i> 个人信息管理</a></li>
				<li><a href="#"><i class="fa fa-dollar fa-fw"></i> 报账管理</a></li>
			</ul>
		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->
</nav>


