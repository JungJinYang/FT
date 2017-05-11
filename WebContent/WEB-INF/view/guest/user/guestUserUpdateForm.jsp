<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="ac.kr.ft.com.dto.UserDTO"%>
<%
	request.setCharacterEncoding("EUC-KR");
	response.setCharacterEncoding("EUC-KR");
	UserDTO userDto = (UserDTO) request.getAttribute("userDto");
	if (userDto == null) {
		userDto = new UserDTO();
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
	//�̸��� ����� �� ��������(����ü, ������ �̸��� ��)
	function doAction2(f) {
		//*f�� form �±� ���� id��*//
		//�ڹٽ�ũ��Ʈ�� ���ǹ��� ������ �ִ°ű��� �����
		var f = document.getElementById("f");

		if (f.user_id.value == "") {
			alert("���̵� �Է��Ͻñ� �ٶ��ϴ�.");
			f.user_id.focus();
			return false;
		}
		

		if (f.password.value == "") {
			alert("��й�ȣ�� �Է��Ͻñ� �ٶ��ϴ�");
			f.password.focus();
			return false;
		}
		
		
		if (f.checkpassword.value == "") {
			alert("��й�ȣ�� �Է��Ͻñ� �ٶ��ϴ�");
			f.checkpassword.focus();
			return false;
		}
		
		
		if (f.password.value != f.checkpassword.value) {
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�");
			f.checkpassword.focus();
			return false;
		}

		if (f.email1.value == "") {
			alert("�̸����� �Է��Ͻñ� �ٶ��ϴ�");
			f.email1.focus();
			return false;
		}
		

		if (f.email2.value == "") {
			alert("�̸����� �Է��Ͻñ� �ٶ��ϴ�");
			f.email1.focus();
			return false;
		}
		

		if (f.tel_1.value == "") {
			alert("��ȭ��ȣ�� �Է��Ͻñ� �ٶ��ϴ�");
			f.tel_2.focus();
			return false;
		}
		
		if (f.tel_2.value == "") {
			alert("��ȭ��ȣ�� �Է��Ͻñ� �ٶ��ϴ�");
			f.tel_2.focus();
			return false;
		}
		
		
		if (f.tel_2.value.length != 4) {
			alert("��ȭ��ȣ�� �Է��Ͻñ� �ٶ��ϴ�");
			f.tel_2.focus();
			return false;
		}

		if (f.tel_3.value == "") {
			alert("��ȭ��ȣ�� �Է��Ͻñ� �ٶ��ϴ�");
			f.tel_3.focus();
			return false;
		}
		
		
		if (f.tel_3.value.length != 4) {
			alert("��ȭ��ȣ�� �Է��Ͻñ� �ٶ��ϴ�");
			f.tel_2.focus();
			return false;
		}

		if (f.birthday.value == "") {
			alert("��������� �Է��Ͻñ� �ٶ��ϴ�");
			f.birthday.focus();
			return false;
		}
		
		
		if (f.birthday.value.length < 6) {
			alert("��������� �Է��Ͻñ� �ٶ��ϴ�");
			f.birthday.focus();
			return false;
		}
		
		if (f.birthday.value.substr(2,2) < 1 || f.birthday.value.substr(2,2) > 12) { // check month range
			 alert("1~12�� ���̷� ���ֽñ� �ٶ��ϴ�");
			 return false;
		}

		if (f.birthday.value.substr(4,2) < 1 || f.birthday.value.substr(4,2) > 31) {
 			alert("1~31�� ���̷� ���ֽñ� �ٶ��ϴ�");
 			return false;
		}

 		if ((f.birthday.value.substr(2,2)==4 
			|| f.birthday.value.substr(2,2)==6 
			|| f.birthday.value.substr(2,2)==9 
			|| f.birthday.value.substr(2,2)==11) 
			&& f.birthday.value.substr(4,2)==31) {
 			if(f.birthday.value.substr(2,2)==11){
 				alert(f.birthday.value.substr(2,2)+" ���� 31���� �����ϴ�");
 			}else{
 				alert(f.birthday.value.substr(3,1)+" ���� 31���� �����ϴ�");
 			}
 			return false
 		}

 		if (f.birthday.value.substr(2,2) == 2) { // check for february 29th
 			var isleap = (f.birthday.value.substr(0,2) % 4 == 0 
 					&& (f.birthday.value.substr(0,2) % 100 != 0 
 					|| f.birthday.value.substr(0,2) % 400 == 0));
 			if (f.birthday.value.substr(4,2)>29 
 					|| (f.birthday.value.substr(4,2)==29 && !isleap)) {
 			alert("2����" 
 				+ f.birthday.value.substr(4,2) 
 				+ "�� �����ϴ�");
 			return false;
 			}
 		}
		


		//�ߴ� ��Ʈ�� �Ȱ����� ���߿� ȭ��(�ֳ��ϸ� ���� Ʋ���� �𸣴�)
		return true;
	}
	function doChangeEmail(f, val) {

		//���� �Է��� �����Ͽ��ٸ�, ���� �Էµ� ���� �����.
		if (val == "etc") {
			f.email2.value = "";
			f.email2.focus();
			f.email2.readOnly = false;
			f.email2.style.backgroundColor = "";
			//�׷��� ������, ���õ� ���� �Է� �޵��� �Ѵ�.
		} else {
			f.email2.readOnly = true;
			f.email2.value = val;
			f.email2.style.backgroundColor = "#e2e2e2";
		}
	}
	// ����
	function check(obj_name,max_length) {
		var str = obj_name;
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
		if (blank.test(str.value) == true) {
			alert('������ ����� �� �����ϴ�');
			str.value = "";
			return false;
		}

		var special = /[.`~!@\#$%<>^&*\()\-=+_\��:;]/gi;
		if (special.test(str.value) == true) {
			alert('Ư�����ڴ� ����� �Ұ����մϴ�');
			str.value = "";
			return false;
		}
		var hangle = /[��-��|��-��|��-��]/gi;
		if (hangle.test(str.value) == true) {
			alert('�ѱ��� ����� �Ұ����մϴ�');
			str.value = "";
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
	
	function birth() {
		var birthday = document.getElementById('birthday');
		
		if(birthday.value.length > 6 ) {
 			alert('��������� 6�ڸ������� Ŭ �� �����ϴ�');
 			birthday.value = "";
 			return false;
 		}
		
		var blank = /[\s]/gi;
		if (blank.test(birthday.value) == true) {
			alert('������ ����� �� �����ϴ�');
			birthday.value = "";
			return false;
		}

		var special = /[.`~!@\#$%<>^&*\()\-=+_\��:;]/gi;
		if (special.test(birthday.value) == true) {
			alert('Ư�����ڴ� ����� �Ұ����մϴ�');
			birthday.value = "";
			return;
		}
		
		var hangle = /[��-��|��-��|��-��]/gi;
		if (hangle.test(birthday.value) == true) {
			alert('�ѱ��� ����� �Ұ����մϴ�');
			birthday.value = "";
			return;
		}
		var english = /[A-Z | a-z]/gi; 
		if (english.test(birthday.value) == true) {
			alert('����� ����� �Ұ����մϴ�');
			birthday.value = "";
			return;
		}

	}
	
	function tel2() {
		var tel_2 = document.getElementById('tel_2');
		
 		if(tel_2.value.length > 4 ) {
 			alert('��ȭ��ȣ�� 4�ڸ������� Ŭ �� �����ϴ�');
 			tel_2.value = "";
 			return false;
 		}
		var blank = /[\s]/gi;
		if (blank.test(tel_2.value) == true) {
			alert('������ ����� �� �����ϴ�');
			tel_2.value = "";
			return false;
		}

		var special = /[.`~!@\#$%<>^&*\()\-=+_\��:;]/gi;
		if (special.test(tel_2.value) == true) {
			alert('Ư�����ڴ� ����� �Ұ����մϴ�');
			tel_2.value = "";
			return;
		}
		
		var hangle = /[��-��|��-��|��-��]/gi;
		if (hangle.test(tel_2.value) == true) {
			alert('�ѱ��� ����� �Ұ����մϴ�');
			tel_2.value = "";
			return;
		}
		var english = /[A-Z | a-z]/gi; 
		if (english.test(tel_2.value) == true) {
			alert('����� ����� �Ұ����մϴ�');
			tel_2.value = "";
			return;
		}
	}
	
	function tel3() {
		var tel_3 = document.getElementById('tel_3');
		
 		if(tel_3.value.length > 4 ) {
 			alert('��ȭ��ȣ�� 4�ڸ������� Ŭ �� �����ϴ�');
 			tel_3.value = "";
 			return false;
 		}
		var blank = /[\s]/gi;
		if (blank.test(tel_3.value) == true) {
			alert('������ ����� �� �����ϴ�');
			tel_3.value = "";
			return false;
		}

		var special = /[.`~!@\#$%<>^&*\()\-=+_\��:;]/gi;
		if (special.test(tel_3.value) == true) {
			alert('Ư�����ڴ� ����� �Ұ����մϴ�');
			tel_3.value = "";
			return;
		}
		
		var hangle = /[��-��|��-��|��-��]/gi;
		if (hangle.test(tel_3.value) == true) {
			alert('�ѱ��� ����� �Ұ����մϴ�');
			tel_3.value = "";
			return;
		}
		var english = /[A-Z | a-z]/gi; 
		if (english.test(tel_3.value) == true) {
			alert('����� ����� �Ұ����մϴ�');
			tel_3.value = "";
			return;
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
		<!-- join -->
		<div class="content" style="display: block;">
			<div class="content_wrapper">
				<header>
					<span>ȸ����</span>
				</header>
				<form name="f" id="f" method="post" action="guestUserUpdate.do" onsubmit="return doAction2(this)">
				<input type="hidden" name="user_no" value="<%=CmmUtil.nvl(userDto.getUser_no())%>" />
					<div class="section">
						<!-- group -->
							<div class="input_row" style="background-color: #e2e2e2;">
								<span class="input_box" style="background-color: #e2e2e2;"> <label class="lbl">���̵�</label> <input
									type="text" value="<%=CmmUtil.nvl(userDto.getUser_id())%>" id="user_id" name="user_id" placeholder="���̵�"
									class="input_email" style="width: 250px; background-color: #e2e2e2;" onkeydown="check(this,20)" readonly />
								</span>
							</div>
							
						<!-- group -->
						<div class="input_row">
							<span class="input_box"> <label class="lbl">��й�ȣ</label> <input
								type="password" value="<%=CmmUtil.nvl(userDto.getPassword())%>" name="password" id="password" placeholder="��й�ȣ"
								class="input_area" onkeydown="passwordcheck(this,20)" maxlength="20">
								<h4>��й�ȣ�� �ִ� 20���̸� ��ҹ��� �����մϴ�</h4>
							</span>
						</div>
						<div class="input_row">
							<span class="input_box"> <label class="lbl">��й�ȣ
									Ȯ��</label> <input type="password" name="checkpassword"
								id="checkpassword" value="<%=CmmUtil.nvl(userDto.getCheckpassword())%>" onkeydown="checkpasswordcheck(this,20)" placeholder="��й�ȣ Ȯ��"
								class="input_area" style="width: 250px" maxlength="20">
							</span>
						</div>
						<div class="input_row">
							<span class="input_box"> <label class="lbl">�������</label> <input
								type="text" value="<%=CmmUtil.nvl(userDto.getBirthday())%>" placeholder="�������" class="input_area" value=""
								 name="birthday" id="birthday" onkeydown="birth()"
								onkeydown="birth()">
							</span>
						</div>
						<div class="input_row" style="background-color: #e2e2e2;">
							<span class="input_box" style="background-color: #e2e2e2;"> <label class="lbl">�̸�</label> <input
								type="text" value="<%=CmmUtil.nvl(userDto.getUser_name())%>" name="user_name" id="user_name" style="width: 250px; background-color: #e2e2e2;"
								placeholder="�̸�" class="input_area" onkeydown="namecheck(this,20)">
							</span>
						</div>
						<!-- group -->
						<div class="group">
							<div class="input_row phone">
								<span class="input_box"> <label class="lbl">�̸���</label><input
									type="text" value="<%=CmmUtil.nvl(userDto.getEmail1())%>" name="email1" id="email1" maxlength="20" placeholder="�̸���"
									class="input_phone" onkeydown="emailcheck(this,20)">
								</span>
							</div>
							<label class='dash'> @ </label>
							<div class="input_row phone">
								<span class="input_box"> <label class="lbl"></label> <input
									type="text" value="<%=CmmUtil.nvl(userDto.getEmail2())%>" name="email2" id="email2" maxlength="20" placeholder=""
									class="input_phone" onkeydown="email2check(this,20)">
								</span>
							</div>
							<label class='dash'> </label>
							<div class="input_select phone"> 
 								<select name="email3" onchange="doChangeEmail(this.form, this.value)"
									> 
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
						<!-- group -->
						<div class="group">
							<div class="input_select phone clear">
								<select name="tel_1" value="<%=CmmUtil.nvl(userDto.getTel_1())%>">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
							</div>
							<label class='dash'> - </label>
							<div class="input_row phone">
								<span class="input_box"> <label class="lbl">��ȭ��ȣ</label>
									<input type="text" value="<%=CmmUtil.nvl(userDto.getTel_2())%>" placeholder="��ȭ��ȣ" class="input_phone"
									name="tel_2" id="tel_2" maxlength="4"
									onkeydown="tel2()">
								</span>
							</div>
							<label class='dash'> - </label>
							<div class="input_row phone">
								<span class="input_box"> <label class="lbl">��ȭ��ȣ</label>
									<input type="text" value="<%=CmmUtil.nvl(userDto.getTel_3())%>" placeholder="" class="input_phone"
									name="tel_3" id="tel_3" maxlength="4"
									onkeydown="tel3()">
								</span>
							</div>
						</div>
						<!-- group -->
					<div class='content wrapper50'>
						<input type="submit" title="Ȯ��" value="Ȯ��" class="btn_half left" >
						<input type="button" title="���" value="���" class="btn_half left"  onclick="location.href='/appmain.do'">
					</div>
					</div>
				</form>
			</div>
		</div>
		<!-- join -->
		<!-- E: CONTENT -->

		<!-- S: FOOTER -->
		<%@include file="/guestinc/appfooter.jsp"%>
		<!-- E: FOOTER -->
	</div>
	<!-- E: WRAPPER -->
</body>
</html>
