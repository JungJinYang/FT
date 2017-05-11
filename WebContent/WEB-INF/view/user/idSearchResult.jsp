<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ac.kr.ft.com.util.CmmUtil"%>
<%@ page import="ac.kr.ft.com.dto.UserDTO"%>	
<%
UserDTO rDTO = (UserDTO) request.getAttribute("rDTO");
if (rDTO == null) {
	rDTO = new UserDTO();
}

String user_name = CmmUtil.nvl(rDTO.getUser_name()); //�̸�
String user_id = CmmUtil.nvl(rDTO.getUser_id()); //���̵�
String msg = ""; //��� ������ ����

if (user_id.length()==0){
	msg = "���̵� �������� �ʽ��ϴ�.";
}

%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">


<title>���̵�ã��</title>

<%@include file="/inc/top.jsp"%>

<script type="text/javascript">
<%
if (msg.length()>0){
	out.println("alert('"+ msg +"');");
	out.println("location.href='/user/idfindform.do'");
}
%>
</script>

</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class=" panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">�α������ּ���</h3>
					</div>
					<div class="panel-body">
						<fieldset>
							<div class="form-group" align="center"><%=CmmUtil.nvl(rDTO.getUser_id()) %>���Ǿ��̵��</div>
							<br />
							<div class="form-group" align="center"><%=CmmUtil.nvl(rDTO.getUser_name()) %>�Դϴ�</div>

							<div class="form-group" align="right">
								<a href="javascript:window.close();"><b>Ȯ��</b></a>
							</div>
							<div class="form-group" align="right">
								<b>Ȥ�� ��й�ȣ�� ã���ó���?</b><a href="/user/pwfindform.do"> <br />
								<b>��й�ȣ ã��</b></a>
							</div>
						</fieldset>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="../bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>