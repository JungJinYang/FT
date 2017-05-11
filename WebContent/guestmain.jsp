<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String MAIN_AUTH = (String) session.getAttribute("AUTH");
	if (MAIN_AUTH == null) {
		MAIN_AUTH = "";
	}
%><!DOCTYPE html>
<html lang="en">
<head>
<title>���Ǫ��Ʈ��</title>
<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="/css/style.css?ver=2">
<%@include file="/guestinc/apptop.jsp"%>
</head>
<body>
<body>
	<%@include file="/guestinc/appmenu.jsp"%>
	<!-- S: WRAPPER -->
	<div class="wrapper">
		<!-- S: HEADER -->
		<%@include file="/guestinc/appheader.jsp"%>
		<!-- E: HEADER -->
		<!-- S: CONTENT -->
		<!-- E: CONTENT -->
		<%
			if (MAIN_AUTH.equals("U")) {
		%>
		<!-- S: FOOTER -->
		<div class="content main" style='display: block;'>
			<ul>
				<li><a href="/notice/guestnoticeList.do"><button>��������</button></a></li>
				<li><a href="/community/guestcommunityList.do"><button>Ŀ�´�Ƽ</button></a></li>
				<li><a href="/event/guestEventList.do"><button>�̺�Ʈ</button></a></li>
				<li><a href="/menu/userMenuList.do"><button>�޴�</button></a></li>
				<li><a href="/hyg/userHygList.do"><button>����������</button></a></li>
				<li><a href="/ctr/GuestctrList.do"><button>�����͸�</button></a></li>
				<li><a href="/guest/schedule/calendar.do"><button>������ȸ</button></a></li>
				<li><a href="/busi/position/position.do"><button>��ġ��ȸ</button></a></li>
			</ul>
		</div>
		<%
			} else {
		%>
		<div class="content main" style='display: block;'>
			<ul>
				<li><a href="/notice/guestnoticeList.do"><button>��������</button></a></li>
				<li><a href="/community/guestcommunityList.do"><button>Ŀ�´�Ƽ</button></a></li>
				<li><a href="/event/guestEventList.do"><button>�̺�Ʈ</button></a></li>
				<li><a href="/menu/userMenuList.do"><button>�޴�</button></a></li>
				<li><a href="/hyg/userHygList.do"><button>����������</button></a></li>
				<li><a href="/ctr/GuestctrList.do"><button>�����͸�</button></a></li>
				<li><a href="/guest/schedule/calendar.do"><button>������ȸ</button></a></li>
				<li><a href="/busi/position/position.do"><button>��ġ��ȸ</button></a></li>
			</ul>
		</div>
		<%
			}
		%>
		<%@include file="/guestinc/appfooter.jsp"%>
		<!-- E: FOOTER -->
	</div>



</body>

</body>
</html>
