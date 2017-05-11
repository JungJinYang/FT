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

	if (user_id.length() == 0) {
		msg = "ȸ�������� �������� �ʽ��ϴ�.";

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


<title>��й�ȣ ����</title>

<%@include file="/inc/top.jsp"%>

<script type="text/javascript">
	
<%if (msg.length() > 0) {
				out.println("alert('" + msg + "');");
				out.println("location.href='/user/pwfindform.do'");
			}%>
	function doAction(f) {
		var f = document.getElementById("f");
		if (f.password.value == "") {
			alert("��й�ȣ�� �Է��Ͻñ� �ٶ��ϴ�");
			f.password.focus();
			return false;
		}

		if (f.checkpassword.value == "") {
			alert("��й�ȣ�� �ѹ� �� �Է��Ͻñ� �ٶ��ϴ�");
			f.checkpassword.focus();
			return false;
		}

		if (f.password.value != f.checkpassword.value) {
			alert("��й�ȣ�� ���� ��ġ���� �ʽ��ϴ�");
			f.password.focus();
			return false;
		}
	}
	
	//��й�ȣ üũ
	$(function() {
		$('#password').keyup(function() {
			$('font[name=check]').text('');
		}); //#user_pass.keyup

		$('#checkpassword').keyup(function() {
			if ($('#password').val() != $('#checkpassword').val()) {
				$('font[name=checked]').text('');
				$('font[name=checked]').html("��ȣƲ��");
			} else {
				$('font[name=checked]').text('');
				$('font[name=checked]').html("��ȣ����");
			}
		}); //#chpass.keyup
	});
</script>

</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">��й�ȣ ����</h3>
					</div>
					<div class="panel-body">
						<form role="form" name="f" id="f" action="/user/pwchangeproc.do "
							onsubmit="doAction()" method="post">
							<input type="hidden" name="user_no"
								value="<%=rDTO.getUser_no()%>">

								<div class="form-group">
									<input class="form-control" name="password" id="password"
										type="password" autofocus maxlength="20"> ����й�ȣ�� 20��
									���Ϸ� ���ּ��� <font name="checked" size="4" color="red"></font>
									<br/>
									
									 <input
										class="form-control" placeholder="�� ��й�ȣ Ȯ��"
										name="checkpassword" id="checkpassword" type="password"
										autofocus maxlength="20">


								</div>
								<!-- Change this to a button or input when using this as a form -->
								<input type="submit" class="btn btn-lg btn-success btn-block"
									value="����"><br />
						</form>


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