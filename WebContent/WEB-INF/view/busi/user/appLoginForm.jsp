<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>���Ǫ��Ʈ��</title>
<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="/css/style.css?ver=2">
<script type="text/javascript">
	function doAction(f) {
		//*f�� form �±� ���� id��*//
		//�ڹٽ�ũ��Ʈ�� ���ǹ��� ������ �ִ°ű��� �����
		var f = document.getElementById("f");

		if (f.user_id.value == "") {
			alert("���̵� �Է��ϼ���");
			f.user_name.focus();
			return false;
		}

		if (f.password.value == "") {
			alert("��й�ȣ�� �Է��ϼ���");
			f.email1.focus();
			return false;
		}

		//�ߴ� ��Ʈ�� �Ȱ����� ���߿� ȭ��(�ֳ��ϸ� ���� Ʋ���� �𸣴�)

	}
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
		<!-- login -->
		<div class="content login" style='display: block;'>
			<div class="content_wrapper">
				<header>
					<span>�α���</span>
				</header>
				<form name="f" id="f" action="/user/appLoginproc.do" method="post">
					<div class='section'>
						<div class="input_row">
							<span class="input_box"> <label class="lbl">���̵�</label> <input
								type="text" placeholder="���̵�" name="user_id" class="input_area"
								value="" maxlength="20">
							</span>
						</div>

						<div class="input_row">
							<span class="input_box"> <label class="lbl">��й�ȣ</label>
								<input type="password" placeholder="��й�ȣ" name="password"
								class="input_area" value="" maxlength="20">
							</span>
						</div>
						<input type="submit" title="�α���" value="�α���" class="btn_global">
						<div class="sub">
							<a href="/user/appIdFindForm.do">���̵� ã��</a> <span>|</span> <a
								href="/user/appPwFindForm.do">��й�ȣ ã��</a> <span>|</span> <a
								href="/user/guestUserInsertForm.do">ȸ������</a>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- login -->
		<!-- E: CONTENT -->

		<!-- S: FOOTER -->
		<%@include file="/guestinc/appfooter.jsp"%>
		<!-- E: FOOTER -->
	</div>
	<!-- E: WRAPPER -->
</body>
</html>
