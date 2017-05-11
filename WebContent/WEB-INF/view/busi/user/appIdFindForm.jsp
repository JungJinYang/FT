<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
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

		if (f.user_name.value == "") {
			alert("�̸��� �Է��Ͻñ� �ٶ��ϴ�.");
			f.user_name.focus();
			return false;
		}
		
		if (f.email1.value == "") {
			alert("�̸����� �Է��Ͻñ� �ٶ��ϴ�.");
			f.email1.focus();
			return false;
		}
		
		if (f.email2.value == "") {
			alert("�̸����� �Է��Ͻñ� �ٶ��ϴ�.");
			f.email2.focus();
			return false;
		}
	}
	function namecheck(obj_name,max_length)
	{
		
		var name = obj_name;
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
		if (blank.test(name.value) == true) {
			alert('������ ����� �� �����ϴ�');
			name.value = "";
			return false;
		}
	
		var special = /[.`~!@\#$%<>^&*\()\-=+_\��:;]/gi;
		if (special.test(name.value) == true) {
			alert('Ư�����ڴ� ����� �Ұ����մϴ�');
			name.value = "";
			return false;
		}
 		var num_regx=/\d/gi; //\d�� [0-9]�� ����
 		if(num_regx.test(name.value) == true) {
 			alert('���ڴ� ����� �Ұ����մϴ�');
 			name.value = "";
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
	function emailcheck(obj_name,max_length) {
		var email1 = obj_name;
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
		if (blank.test(email1.value) == true) {
			alert('������ ����� �� �����ϴ�');
			email1.value = "";
			return false;
		}

		var special = /[.`~!@\#$%<>^&*\()\-=+_\��:;]/gi;
		if (special.test(email1.value) == true) {
			alert('Ư�����ڴ� ����� �Ұ����մϴ�');
			email1.value = "";
			return;
		}
		
		var hangle = /[��-��|��-��|��-��]/gi;
		if (hangle.test(email1.value) == true) {
			alert('�ѱ��� ����� �Ұ����մϴ�');
			email1.value = "";
			return;
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
	
	function email2check(obj_name,max_length) {
		var email2 = obj_name;
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
		if (blank.test(email2.value) == true) {
			alert('������ ����� �� �����ϴ�');
			email2.value = "";
			return false;
		}

		var special = /[`~!@\#$%<>^&*\()\-=+_\��:;]/gi;
		if (special.test(email2.value) == true) {
			alert('Ư�����ڴ� ����� �Ұ����մϴ�');
			email2.value = "";
			return;
		}
		
		var hangle = /[��-��|��-��|��-��]/gi;
		if (hangle.test(email2.value) == true) {
			alert('�ѱ��� ����� �Ұ����մϴ�');
			email2.value = "";
			return;
		}
		
		var number =/[0-9]/gi;
		if (number.test(email2.value) == true) {
			alert('���ڴ� ����� �Ұ����մϴ�');
			email2.value = "";
			return;
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
	//�̸��� ����� �� ��������(����ü, ������ �̸��� ��)
	function doChangeEmail(f, val) {

		//���� �Է��� �����Ͽ��ٸ�, ���� �Էµ� ���� �����.
		if (val == "etc") {
			f.email2.value = "";
			f.email2.focus();
			f.email2.readOnly = false;

			f.email2.style.backgroundColor = "";

			//�׷��� ������, ���õ� ���� �Է� �޵��� �Ѵ�.
		} else {
			f.email2.value = val;
			f.email2.readOnly = true;
		}

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
		<!-- find_id -->
		<div class="content find_id" style="display: block;">
			<div class="content_wrapper">
				<header>
					<span>���̵� ã��</span>
				</header>
				<form name="f" id="f" action="/user/appIdFindProc.do" method="post"
					onsubmit="return doAction(this)">
					<div class='section'>
						<div class="input_row">
							<span class="input_box"> <label class="lbl">�̸�</label> <input
								type="text" placeholder="�̸�" class="input_area" name="user_name"
								value="" onkeydown="namecheck(this,20)" maxlength="20">
							</span>
						</div>
						<!-- group -->
						<div class="group">
							<div class="input_row phone">
								<span class="input_box"> <label class="lbl">�̸���</label><input
									type="text" name="email1" onkeydown="emailcheck(this,20)"  placeholder="�̸���"
									class="input_phone" value="" maxlength="20">
								</span>
							</div>
							<label class='dash'> @ </label>
							<div class="input_row phone">
								<span class="input_box"> <label class="lbl"></label> <input
									type="text" name="email2"  placeholder=""
									class="input_phone" value="" onkeydown="email2check(this,20)" maxlength="20">
								</span>
							</div>
							<label class='dash'> </label>
							<div class="input_select phone">
								<select name="email3" onchange="doChangeEmail(this.form, this.value)">
									<option value="etc">�����Է�</option>
									<option value="naver.com">naver.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
									<option value="empal.com">empal.com</option>
									<option value="hanafos.com">hanafos.com</option>
									<option value="hotmail.com">hotmail.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="paran.com">paran.com</option>
									<option value="korea.com">korea.com</option>
									<option value="freechal.com">freechal.com</option>
								</select>
							</div>
						</div>
						<!-- group -->
						<input type="submit" title="Ȯ��" value="Ȯ��" class="btn_global">
					</div>
				</form>
			</div>
		</div>
		<!-- E: CONTENT -->

		<!-- S: FOOTER -->
		<%@include file="/guestinc/appfooter.jsp"%>
		<!-- E: FOOTER -->
	</div>
	<!-- E: WRAPPER -->
</body>
</html>
