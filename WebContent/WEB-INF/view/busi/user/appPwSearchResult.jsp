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
<!DOCTYPE html>
<html lang="en">
<head>
<title>���Ǫ��Ʈ��</title>
<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="/css/style.css?ver=2">
<script type="text/javascript">
	
<%if (msg.length() > 0) {
				out.println("alert('" + msg + "');");
				out.println("location.href='/user/appPwFindForm.do'");
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
		function checkpasswordcheck(obj_name,max_length)
		{
			
			var checkpassword = obj_name;
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
			if (blank.test(checkpassword.value) == true) {
				alert('������ ����� �� �����ϴ�');
				checkpassword.value = "";
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
		<!-- change_pwd -->
		<div class="content" style="display: block;">
			<div class="content_wrapper">
				<header>
					<span>��й�ȣ ã��</span>
				</header>
				<form role="form" name="f" id="f" action="/user/apppwchangeproc.do "
					onsubmit="return doAction()" method="post">
					<input type="hidden" name="user_no" value="<%=rDTO.getUser_no()%>">
					<div class='section'>
						<div class="input_row">
							<span class="input_box"> <label class="lbl">����й�ȣ</label>
								<input name="password" id="password" type="password"
								placeholder="����й�ȣ"  onkeydown="passwordcheck(this,20)" 
								class="input_area" value="" maxlength="20">
							</span>
						</div>
						<div class="input_row">
							<span class="input_box"> <label class="lbl">����й�ȣ
									Ȯ��</label> <input name="checkpassword" id="checkpassword"
								type="password" autofocus onkeydown="checkpasswordcheck(this,20)" placeholder="����й�ȣ Ȯ��"
								class="input_area" value="" maxlength="20">
							</span>
						</div>
						<div class="warnning">��й�ȣ�� 20�� �̳��� �Է����ּ���.</div>
						<input type="submit" title="Ȯ��" value="Ȯ��" class="btn_global" >
					</div>
				</form>
			</div>
		</div>
		<!-- find_pwd-->
		<!-- E: CONTENT -->

		<!-- S: FOOTER -->
		<%@include file="/guestinc/appfooter.jsp"%>
		<!-- E: FOOTER -->
	</div>
	<!-- E: WRAPPER -->
</body>
</html>
