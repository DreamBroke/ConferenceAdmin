<%@page import="dao.HotelDAO"%>
<%@page import="models.Hotel"%>
<%@page import="dao.TeacherDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
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

<title>广西大学会议管理系统后台 - 酒店信息管理</title>

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
						<div style="height: 50px;" class="panel-heading">酒店信息管理<a href="conference_schedule_add.jsp" class="btn btn-primary" style="float: right;">添加酒店</a></div>		
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-striped table-bordered table-hover" id="table">
									<thead>
										<tr>
											<th>酒店名</th>
											<th>联系电话</th>
											<th>所在地点</th>
											<th>消费水平</th>
											<th>经纬度</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
										<%
										ArrayList<Hotel> al = HotelDAO.getAllHotel();
										for(Hotel h : al){
										%>
										<tr>
										<td><%=h.getHot_name()%></td>
										<td><%=h.getHot_tel()%></td>
										<td><%=h.getHot_address()%></td>
										<td><%=h.getHot_capital()%></td>
										<td><%=h.getHot_lnglat()%></td>
										<td><a class="btn btn-primary" href="#">修改</a><a href="#" class="btn btn-danger" onclick="return deleteOck()">删除</a></td>
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
