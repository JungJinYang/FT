<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="ac.kr.ft.com.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	response.setCharacterEncoding("EUC-KR");
	UserDTO pwDto = (UserDTO) request.getAttribute("pwDto");
	if (pwDto == null) {
		pwDto = new UserDTO();
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/inc/top.jsp"%>

<meta charset="EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<script type="text/javascript">
function doAction(f) {
	var f = document.getElementById("f");
	if (f.password.value == "") {
		alert("��й�ȣ�� �Է��Ͻñ� �ٶ��ϴ�");
		f.password.focus();
		return false;
	}
	

}
	function passwordcheck(obj_name,max_length)
	{
		
		var password = obj_name;
	   var ls_str     = obj_name.value; // �̺�Ʈ�� �Ͼ ��Ʈ���� value ��
	   var li_str_len = ls_str.length;  // ��ü����
	   // �����ʱ�ȭ
	   var li_max      = max_length; // ������ ���ڼ� ũ��
	   var i           = 0;  // for���� ���
	   var li_byte     = 0;  // �ѱ��ϰ��� 2 �׹ܿ��� 1�� ����
	   var li_len      = 0;  // substring�ϱ� ���ؼ� ���
	   var ls_one_char = ""; // �ѱ��ھ� �˻��Ѵ�
	   var ls_str2     = ""; // ���ڼ��� �ʰ��ϸ� �����Ҽ� ������������ �����ش�.
	   
	   
	   var blank = /[\s]/gi;
		if (blank.test(password.value) == true) {
			alert('������ ����� �� �����ϴ�');
			password.value = "";
			return false;
		}
	
	   
	   for(i=0; i< li_str_len; i++)
	   {
	      // �ѱ�������
	      ls_one_char = ls_str.charAt(i);
	      // �ѱ��̸� 2�� ���Ѵ�.
	      if (escape(ls_one_char).length > 4)
	      {
	         li_byte = li_byte+2;
	      }
	      // �׿��� ���� 1�� ���Ѵ�.
	      else
	      {
	         li_byte++;
	      }
	      // ��ü ũ�Ⱑ li_max�� ����������
	      if(li_byte <= li_max)
	      {
	         li_len = i + 1;
	      }
	   }   
	   
	   // ��ü���̸� �ʰ��ϸ�
	   if(li_byte > li_max)
	   {
	      alert( li_max + " Bytes�� �ʰ� �Է��Ҽ� �����ϴ�.");
	      ls_str2 = ls_str.substr(0, li_len);
	      obj_name.value = ls_str2; 
	   }
	   obj_name.focus();   
	}
	
	
	
	function cal_length(val)
	{
	  // �Է¹��� ���ڿ��� escape() �� �̿��Ͽ� ��ȯ�Ѵ�.
	  // ��ȯ�� ���ڿ� �� �����ڵ�(�ѱ� ��)�� ���������� %uxxxx�� ��ȯ�ȴ�.
	  var temp_estr = escape(val);
	  var s_index   = 0;
	  var e_index   = 0;
	  var temp_str  = "";
	  var cnt       = 0;

	  // ���ڿ� �߿��� �����ڵ带 ã�� �����ϸ鼭 ������ ����.
	  while ((e_index = temp_estr.indexOf("%u", s_index)) >= 0)  // ������ ���ڿ��� �����Ѵٸ�
	  {
	    temp_str += temp_estr.substring(s_index, e_index);
	    s_index = e_index + 6;
	    cnt ++;
	  }

	  temp_str += temp_estr.substring(s_index);

	  temp_str = unescape(temp_str);  // ���� ���ڿ��� �ٲ۴�.

	  // �����ڵ�� 2����Ʈ �� ����ϰ� �������� 1����Ʈ�� ����Ѵ�.
	  return ((cnt * 2) + temp_str.length) + "";
	}
</script>

<title>ȸ������ ����</title>
</head>
<body>

	<%@include file="/inc/menu.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">�α������ּ���</h3>
					</div>
					<div class="panel-body">
						<form role="form" name="f" id="f" action="/user/pwchangeproc.do"
							method="post">
							<input type="hidden" name="user_no"
								value="<%=pwDto.getUser_no()%>">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="�� ��й�ȣ" maxlength="20"
										name="password" type="text" autofocus onkeydown="passwordcheck(this,20)" >
									����й�ȣ�� 20�� ���Ϸ� ���ּ���
								</div>
								<!-- Change this to a button or input when using this as a form -->
								<input type="button" class="btn btn-lg btn-success btn-block" onclick="doAction()"
									value="����"><br />
							</fieldset>
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

	<!-- DataTables JavaScript -->
	<script
		src="../bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
	<script
		src="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
	<script
		src="../bower_components/datatables-responsive/js/dataTables.responsive.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="../dist/js/sb-admin-2.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});
	</script>

</body>
</html>