<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="ac.kr.ft.com.util.CmmUtil"%>
<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation"
	style="margin-bottom: 0">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="/index.jsp">Food Truck
			Administrator v1.0</a>
	</div>
	<!-- /.navbar-header -->
	<ul class="nav navbar-top-links navbar-right">
		<li class="dropdown"><a class="dropdown-toggle"
			data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
				<i class="fa fa-caret-down"></i>
		</a> <%
		if (CmmUtil.nvl((String)session.getAttribute("ADMINUSER_NAME")) == null || CmmUtil.nvl((String)session.getAttribute("ADMINUSER_NAME")).equals("")) { %> 
		<script>
		alert('������ ���ų� �߸��� �����Դϴ�');
		location.href = "/index.jsp";
		</script> <% } else {%> 
		<%=CmmUtil.nvl((String)session.getAttribute("ADMINUSER_NAME"))%>�� �ȳ��ϼ���
			<ul class="dropdown-menu dropdown-user">
				<li><a href="/user/logout.do"><i class="fa fa-user fa-fw"></i>�α׾ƿ�</a>
				</li>
				<!-- <li class="divider"></li> -->
			</ul> <%
 	}
 %> <!-- /.dropdown-user --></li>
		<!-- /.dropdown -->
	</ul>
	<!-- /.navbar-top-links -->
	<%
		if (!(CmmUtil.nvl((String)session.getAttribute("ADMINUSER_NAME")) == null || CmmUtil.nvl((String)session.getAttribute("ADMINUSER_NAME")).equals(""))) {
	%>
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li class="sidebar-search">
					<div class="input-group custom-search-form">
<!-- 						<input type="text" class="form-control" placeholder="Search..."> -->
<!-- 						<span class="input-group-btn"> -->
<!-- 							<button class="btn btn-default" type="button"> -->
<!-- 								<i class="fa fa-search"></i> -->
<!-- 							</button> -->
<!-- 						</span> -->
					</div> <!-- /input-group -->
				</li>
				<li><a href="/auth/authList.do"><i class="fa fa-dashboard fa-fw"></i>���� ����</a>
				</li>
						
				<li>
				<a href="/user/userlist.do"><i class="fa fa-user fa-fw"></i> ȸ�� ����</a>
				</li>
					
				<li><a href="#"><i class="fa fa-sitemap fa-fw"></i> Ŀ�´�Ƽ ���� <span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="/notice/noticeList.do"><i class="fa fa-bullhorn fa-fw"></i> ��������</a></li>
						<li><a href="/community/communityList.do"><i class="fa fa-comment fa-fw"></i> �� Ŀ�´�Ƽ ����</a></li>
						<li><a href="/event/eventList.do"><i class="fa fa-gamepad fa-fw"></i> �̺�Ʈ</a></li>
					</ul>
				</li>
				
				<li><a href="#"><i class="fa fa-cutlery fa-fw"></i>�޴����� ���� <span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="/menu/menuList.do"><i class="fa fa-cutlery fa-fw"></i> �޴�</a></li>
						<li><a href="/hyg/hygList.do"><i class="fa fa-file-text-o fa-fw"></i> ����������</a></li>
					</ul> <!-- /.nav-second-level -->
				</li>
					
					
					
				<li><a href="#"><i class="fa fa-group  fa-fw"></i>�������� ���� <span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="/fest/festlist.do"><i class="fa fa-group  fa-fw"></i> �������� ����Ʈ</a></li>
					</ul> <!-- /.nav-second-level -->
				</li>
					
				<li><a href="#"><i class="fa fa-sliders fa-fw"></i>���ռ������� ���� <span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="/rank/rankcondition.do"><i class="fa fa-sliders fa-fw"></i> ���ռ������� ��ȸ</a></li>
					</ul>
				</li>
				
				<li><a href="#"><i class="fa fa-truck  fa-fw"></i>�����͸� ����<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="/ctr/ctrList.do"><i class="fa fa-user  fa-fw"></i> ��㹮��</a></li>
						<li><a href="/ctr/ctrRegform.do"><i class="fa fa-edit fa-fw"></i> �ֹ��ϱ�</a></li>
					</ul> <!-- /.nav-second-level -->
				</li>
				
				<li><a href="#"><i class="fa fa-table fa-fw"></i>���� �� ��ġ��ȸ ���� <span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="/schedule/calendar.do"><i class="fa fa-calendar fa-fw"></i> ����</a></li>
						<li><a href="/position/position.do"><i class="fa fa-map-marker  fa-fw"></i> ��ġ</a></li>
					</ul> <!-- /.nav-second-level -->
				</li>
				</ul>
		</div>
		<!-- /.sidebar-collapse -->
	</div>
	<!-- /.navbar-static-side -->

	<%
		}
	%>
</nav>
