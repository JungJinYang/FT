<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="ac.kr.ft.com.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
	response.setCharacterEncoding("EUC-KR");
	UserDTO userDto = (UserDTO) request.getAttribute("userDto");
	if (userDto == null) {
		userDto = new UserDTO();
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
	
	function doChangeEmail2(f, val) {

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
	function doKeyOnlyNumber(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.KeyCode;

		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 9) {
			return true;
		} else {
			return false;
		}

	}
</script>

<title>ȸ������ ����</title>
</head>
<body>

	<%@include file="/inc/menu.jsp"%>
	<div id="wrapper">


		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h3 class="page-header">ȸ������ ����</h3>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<%=CmmUtil.nvl(userDto.getUser_name())%>���� ȸ������ ����
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">


								<form name="f" id="f" method="post" action="userupdate.do" onsubmit="return doAction2(this)">
									<input type="hidden" name="user_no" value="<%=CmmUtil.nvl(userDto.getUser_no())%>" />


									<table class="table table-striped table-bordered table-hover" id="dataTables-example">

										<tbody>
											<tr>
												<td width="90px"><b>���̵�</b></td>
												<td><input type="text" name="user_id" value="<%=CmmUtil.nvl(userDto.getUser_id())%>" onkeydown="check(this,20)" readOnly style="background-color: #e2e2e2;">���̵��
													���� �Ұ��Դϴ�</td>


											</tr>

											<tr>
												<td style="width: 300px"><b>�н�����</b></td>
												<td><input type="text" name="password" value="<%=CmmUtil.nvl(userDto.getPassword())%>" 
												onkeydown="passwordcheck(this,20)" style="width: 250px" maxlength="20"></td>
											</tr>
											
											<tr>
												<td style="width: 300px"><b>�н����� Ȯ��</b></td>
												<td><input type="text" name="checkpassword" value="<%=CmmUtil.nvl(userDto.getCheckpassword())%>" 
												onkeydown="checkpasswordcheck(this,20)" style="width: 250px" maxlength="20"></td>
											</tr>
											<tr>
												<td><b>�̸�</b></td>
												<td><input type="text" name="user_name" value="<%=CmmUtil.nvl(userDto.getUser_name())%>" 
												onkeydown="check(this,20)" readOnly style="background-color: #e2e2e2;">
													�̸��� ���� �Ұ��Դϴ�</td>
											</tr>
											<tr>
												<td><b>�̸���</b></td>
												
												<td colspan="3">
												<input type="text" name="email1" value="<%=CmmUtil.nvl(userDto.getEmail1())%>" style="width: 100px" onkeydown="emailcheck(this,20)" maxlength="20"/>@ 
												<input type="text" name="email2"  value="<%=CmmUtil.nvl(userDto.getEmail2())%>" style="width: 100px" onkeydown="email2check(this,20)" style="width: 250px" maxlength="20">
													<select name="email3" onchange="doChangeEmail2(this.form, this.value)" style="display:; width: 100px" style="width: 250px">
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
												</td>



											</tr>

											<tr>
												<td><b>��ȭ��ȣ</b></td>
												<td colspan="3"><select name="tel_1"
													value="<%=CmmUtil.nvl(userDto.getTel_1())%>" style="width: 60px">
														<option value="010">010</option>
														<option value="011">011</option>
														<option value="016">016</option>
														<option value="016">017</option>
														<option value="016">018</option>
														<option value="019">019</option>
												</select> 
												-<input type="text" id="tel_2" name="tel_2" value="<%=CmmUtil.nvl(userDto.getTel_2())%>" onkeydown="tel2()" style="width: 60px" maxlength="4"/> 
												-<input type="text" id="tel_3" name="tel_3" value="<%=CmmUtil.nvl(userDto.getTel_3())%>" onkeydown="tel3()" style="width: 60px" maxlength="4"/>
												
												</td>

											</tr>

											<tr>
												<td><b>�������</b></td>
												<td><input type="text" id="birthday"name="birthday" value="<%=CmmUtil.nvl(userDto.getBirthday())%>" onkeydown="birth()" maxlength="6">ex)1998��� 2�� 14���̸� 980214</td>
											</tr>

										</tbody>
									</table>

									<p align="right">
										<input type="submit" value="Ȯ��" class="btn btn-outline btn-success"> 
										<input type=button value="���" class="btn btn-outline btn-danger" onclick="location.href='userlist.do'" />
									</p>
								</form>
							</div>

						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->



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