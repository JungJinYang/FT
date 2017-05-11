<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ac.kr.ft.com.util.CmmUtil"%>
<%@ page import="ac.kr.ft.com.dto.UserDTO"%>
<%
UserDTO rDTO = (UserDTO) request.getAttribute("rDTO");
if (rDTO == null) {
	rDTO = new UserDTO();
}
System.out.print("asdasd : "+ CmmUtil.nvl(rDTO.getUser_name()));

String user_name = CmmUtil.nvl(rDTO.getUser_name()); //�̸�
String user_id = CmmUtil.nvl(rDTO.getUser_id()); //���̵�
String msg = ""; //��� ������ ����

if (user_id.length()==0){
	msg = "���̵� �������� �ʽ��ϴ�.";
}

%>  
<!DOCTYPE html>
<html lang="en">
<head>
    <title>���Ǫ��Ʈ��</title>
    <meta charset="EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/css/style.css?ver=2">
   	<script type="text/javascript">
   	<%
   	if (msg.length()>0){
   		out.println("alert('"+ msg +"');");
   		out.println("location.href='/user/appIdFindForm.do'");
   	}
   	%>
   	</script>
   	<%@include file="/guestinc/apptop.jsp"%>
</head>
<body>
<!-- S: WRAPPER -->
<div class="wrapper">
    <!-- S: HEADER -->
    <%@include file="/guestinc/appheader.jsp"%>
    <!-- E: HEADER -->
	<%@include file="/guestinc/appmenu.jsp"%>
    <!-- S: CONTENT -->
	<!-- find_id result -->
    <div class="content find_id" style='display:block;'>
        <div class="content_wrapper">
        	<header><span>���̵� ã��</span></header>
			<div class='section'>
                <div class="notice desc"><span><%=CmmUtil.nvl(rDTO.getUser_name()) %></span>��!<br/><br/>������ ���̵�� <span><%=CmmUtil.nvl(rDTO.getUser_id()) %></span> �Դϴ�.</div>
				<a href="/user/appLoginForm.do"><input type="button" title="Ȯ��" value="Ȯ��" class="btn_global" ></a>
                <div class="notice ask">Ȥ�� ��й�ȣ�� ã���ó���? <a href="/user/appPwFindForm.do"><span>��й�ȣ ã��</span></a></div>
        	</div>
		</div>
    </div>
    <!--find id result-->
    <!-- E: CONTENT -->

    <!-- S: FOOTER -->
   <%@include file="/guestinc/appfooter.jsp"%>
    <!-- E: FOOTER -->
</div>
<!-- E: WRAPPER -->
</body>
</html>
