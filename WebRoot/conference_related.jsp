<%@page import="dao.RelatedDAO"%>
<%@page import="models.Related"%>
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

<title>广西大学会议管理系统后台 - 会议周边管理</title>

<%@include file="headcss.html"%>
   <link href="public/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

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
						<div style="height: 50px;" class="panel-heading">会议周边管理<a href="conference_schedule_add.jsp" class="btn btn-primary" style="float: right;">添加周边</a></div>		
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover" id="table">
									<thead>
										<tr>
											<th>周边名</th>
											<th>相应说明</th>
											<th>图片预览</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<%
										ArrayList<Related> al = RelatedDAO.getOtherRelated();
										for(Related r : al){
										%>
										<tr>
										<td><%=r.getRel_name()%></td>
										<td><%=r.getRel_brief()%></td>
										<td><img alt="<%=r.getRel_brief()%>" src="public/image/related/<%=r.getRel_photo()%>.jpg"></td>
										<td><a class="btn btn-primary" href="conference_related_modify.jsp?rel_no=<%=r.getRel_no()%>">修改</a><a href="DeleteRelated?rel_no=<%=r.getRel_no()%>" class="btn btn-danger" onclick="return deleteOck()">删除</a></td>
										</tr>
										<%}%>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
			</div>
		</div>
		<!-- /#page-wrapper -->
		<%
				String message = (String) request.getAttribute("message");
				if(message != null && message != ""){
		%>
		<script type="text/javascript">
			alert("<%=message%>");
			window.location.href="conference_schedule.jsp";
		</script>
		<%	
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
    <script>
    function deleteOck(){
    	return confirm("是否确定删除？");
    }
    
    $(document).ready(function() {
        $('#table').DataTable({
            responsive: true,
            "language":{
            	"paginate":{
            		"previous": "前一页",
            		"next" : "后一页"
            	},
            	"search" : "搜索",
            	"lengthMenu": "每页显示  _MENU_ 条记录",
            	"emptyTable": "表格中尚没有数据！",
            	"zeroRecords": "没有搜索到数据！"
            }
        });
    });
    </script>
</body>

</html>
