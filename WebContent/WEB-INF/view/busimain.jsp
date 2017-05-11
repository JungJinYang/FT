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
<link rel="stylesheet" href="/css/main.css?ver=2">
<%@include file="/busiinc/apptop.jsp"%>
</head>
<body>
<body>
	<%@include file="/busiinc/appmenu.jsp"%>
	<!-- S: WRAPPER -->
	<div class="wrapper">
		<!-- S: HEADER -->
		<%@include file="/busiinc/appheader.jsp"%>
		<!-- E: HEADER -->
		<!-- S: CONTENT -->
		<!-- main -->
		<%
			if (MAIN_AUTH.equals("P")) {
		%>
		
		 <div class="content photomain" style='display:block;'>
        <ul>
        	<li><div class='bgframe'><img src='/img/bg/b10.jpg'/></div>
            <a href='/user/busiUserList.do' ><div class='bgfilter'></div>
            <span>ȸ������</span></a></li>
        
            <li><div class='bgframe'><img src='/img/bg/b1.jpg'/></div>
            <a href='/notice/businoticeList.do' ><div class='bgfilter'></div>
            <span>��������</span></a></li>
            
            
            <li><div class='bgframe'><img src='/img/bg/b2.jpg'/></div>
            <a href='/event/busieventList.do' ><div class='bgfilter'></div>
            <span>�̺�Ʈ</span></a></li>
            
            
            <li><div class='bgframe'><img src='/img/bg/b3.jpg'/></div>
            <a href='/community/busicommunityList.do' ><div class='bgfilter'></div>
            <span>Ŀ�´�Ƽ</span></a></li>
            
            
            <li><div class='bgframe'><img src='/img/bg/b4.jpg'/></div>
            <a href='/menu/busiMenuList.do' ><div class='bgfilter'></div>
            <span>�޴�����</span></a></li>
            
             <li><div class='bgframe'><img src='/img/bg/b8.jpg'/></div>
            <a href='/menu/busiMenuList.do' ><div class='bgfilter'></div>
            <span>����������</span></a></li>
            
            <li><div class='bgframe'><img src='/img/bg/b5.jpg'/></div>
            <a href='/fest/busiFestlist.do' ><div class='bgfilter'></div>
            <span>��������</span></a></li>
            
             <li><div class='bgframe'><img src='/img/bg/b11.jpg'/></div>
            <a href='/busi/rankcondition.do' ><div class='bgfilter'></div>
            <span>���ռ��� ��ȸ</span></a></li>
            
            
            <li><div class='bgframe'><img src='/img/bg/b6.jpg'/></div>
            <a href='/ctr/BusictrList.do' ><div class='bgfilter'></div>
            <span>�����͸�</span></a></li>
            
            
            <li><div class='bgframe'><img src='/img/bg/b7.jpg'/></div>
            <a href='/busi/position/position.do' ><div class='bgfilter'></div>
            <span>��ġ</span></a></li>
            
             <li><div class='bgframe'><img src='/img/bg/b9.jpg'/></div>
            <a href='/busi/schedule/calendar.do' ><div class='bgfilter'></div>
            <span>����</span></a></li>
            
            
        </ul>
    </div>
	<!-- main -->
<!-- 		<div class="content main" style='display: block;'> -->
<!-- 			<ul> -->
<!-- 				<li><a href="/user/busiUserList.do"><button>ȸ������</button></a></li> -->
<!-- 				<li><a href="/notice/businoticeList.do"><button>��������</button></a></li> -->
<!-- 				<li><a href="/community/busicommunityList.do"><button>Ŀ�´�Ƽ</button></a></li> -->
<!-- 				<li><a href="/event/busieventList.do"><button>�̺�Ʈ</button></a></li> -->
<!-- 				<li><a href="/menu/busiMenuList.do"><button>�޴�����</button></a></li> -->
<!-- 				<li><a href="/hyg/busiHygList.do"><button>����������</button></a></li> -->
<!-- 				<li><a href="/fest/busiFestlist.do"><button>��������</button></a></li> -->
<!-- 				<li><a href="/busi/rankcondition.do"><button>���ռ��� -->
<!-- 							��ȸ</button></a></li> -->
<!-- 				<li><a href="/ctr/BusictrList.do"><button>�����͸�</button></a></li> -->
<!-- 				<li><a href="/busi/schedule/calendar.do"><button>����</button></a></li> -->
<!-- 				<li><a href="/busi/position/position.do"><button>��ġ -->
<!-- 							��ȸ</button></a></li> -->


<!-- 			</ul> -->
<!-- 		</div> -->
		<!-- main -->
		<!-- E: CONTENT -->
		<%
			}
		%>
		<%@include file="/busiinc/appfooter.jsp"%>
		<!-- E: FOOTER -->
	</div>



</body>

</body>
</html>
