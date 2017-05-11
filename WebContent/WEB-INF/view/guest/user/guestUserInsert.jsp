<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.UserDTO"%>
<%@page import="java.util.List"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>���Ǫ��Ʈ��</title>
<meta charset="euc-kr">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="/css/style.css?ver=2">

<script type="text/javascript">
	var idExists = "1"; //ID�ߺ�üũ ���࿩��(1: �ߺ�üũ ������� / 2: ���̵� �ߺ� / 3: ���)
	function doAction() {

		//*f�� form �±� ���� id��*//
		//�ڹٽ�ũ��Ʈ�� ���ǹ��� ������ �ִ°ű��� �����
		var total = 0;
		var f = document.getElementById("f");
		var max = document.f.ckbox.length;
		if (f.user_id.value == "") {
			alert("���̵� �Է��Ͻñ� �ٶ��ϴ�");
			f.user_id.focus();
			return false;
		}
		

		if (idExists == "1") {
			alert("���̵� �ߺ�üũ�� �����Ͻñ� �ٶ��ϴ�.");
			f.user_id.focus();
			return false;

		} else if (idExists == "2") {
			alert("���̵� �ߺ��Ǿ����ϴ�. �ߺ����� ���� ���̵� �Է��Ͻñ� �ٶ��ϴ�.");
			f.user_id.focus();
			return false;
		}

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
		
		if (f.user_name.value == "") {
			alert("�̸��� �Է��Ͻñ� �ٶ��ϴ�");
			f.user_name.focus();
			return false;
		}

		if (f.birthday.value == "") {
			alert("��������� �Է��Ͻñ� �ٶ��ϴ�");
			f.birthday.focus();
			return false;
		}
		

		if (f.birthday.value.length < 6) {
			alert("��������� ��� �Է��Ͻñ� �ٶ��ϴ�");
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
		if (f.email1.value == "") {
			alert("�̸����� �Է��Ͻñ� �ٶ��ϴ�");
			f.email1.focus();
			return false;
		}
		
		if (f.email2.value == "") {
			alert("�̸����� �Է��Ͻñ� �ٶ��ϴ�");
			f.email2.focus();
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
			f.tel_3.focus();
			return false;
		}
		
		
		for (var idx = 0; idx < max; idx++) {
			if (eval("document.f.ckbox[" + idx + "].checked") == true) {
				total += 1;
			}
		}
		if (total == 2) {
			document.f.submit();
		} else {
			alert("ȸ������� ������������� �����Ͻñ�ٶ��ϴ�");
			return false;
		}
		//�ߴ� ��Ʈ�� �Ȱ����� ���߿� ȭ��(�ֳ��ϸ� ���� Ʋ���� �𸣴�)
		//f.target = "ifrProc";
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
	// ����

	//ajax ȣ��
	function xmlHttpPost(actionUrl, submitParameter, resultFunction) {
		var xmlHttpRequest = false;

		//IE�ΰ��
		if (window.ActiveXObject) {
			xmlHttpRequest = new ActiveXObject('Microsoft.XMLHTTP');
		} else {
			xmlHttpRequest = new XMLHttpRequest();
			xmlHttpRequest.overrideMimeType('text/xml');
		}

		xmlHttpRequest.open('POST', actionUrl, true);
		xmlHttpRequest.setRequestHeader('Content-Type',
				'application/x-www-form-urlencoded');
		xmlHttpRequest.onreadystatechange = function() {
			if (xmlHttpRequest.readyState == 4) {
				switch (xmlHttpRequest.status) {
				case 404:
					alert('����: ' + actionUrl + '�� �������� ����');
					break;
				case 500:
					alert('����: ' + xmlHttpRequest.responseText);
					break;
				default:
					eval(resultFunction + '(xmlHttpRequest.responseText);');
					break;
				}
			}
		}

		xmlHttpRequest.send(submitParameter);
	}

	//��������ֱ�
	function viewResult(result) {
		//���̵� �ߺ����� �ʾҴٸ�... 
		if (result.replace(/^\s*|\s*$/g, "") == "S") {
			alert("��밡���� ���̵��Դϴ�.");
			f.user_id.readOnly = true;
			idExists = 3;

			//���̵� �ߺ��Ǿ��ٸ�.....
		} else {
			alert("���̵� �ߺ��Ǿ����ϴ�. �ߺ����� ���� ���̵� �Է��Ͻñ� �ٶ��ϴ�.");
			idExists = 2;

		}
	}

	//���̵� �ߺ�üũ ��ư �������� ����
	function doIdCheck() {

		var f = document.getElementById("f");

		if (f.user_id.value == "") {
			alert("���̵� �Է��Ͻñ� �ٶ��ϴ�.");
			f.user_id.focus();
			return;
		}

		var actionUrl = "/user/UserDupInfo.do" //ȣ�� url 
		var submitParameter = "user_id=" + f.user_id.value; //���ް�
		var resultFunction = "viewResult"; //������ ������ �Լ���

		xmlHttpPost(actionUrl, submitParameter, resultFunction);
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
		<form name="f" id="f" method="post" action="busiUserInsert.do" onsubmit="doAction()">
			<div class="content" style="display: block;">
				<div class="content_wrapper">
					<header>
						<span>ȸ������</span>
					</header>
					<div class="section">
						<!-- group -->
						<div class="group">
							<div class="input_row id_check">
								<span class="input_box"> <label class="lbl">���̵�</label> <input
									type="text" id="user_id" name="user_id" placeholder="���̵�"
									class="input_email" style="width: 250px" 
									onkeydown="check(this,20)" maxlength="20" />
								</span>
							</div>
							<input type="button" title="�ߺ�Ȯ��" value="�ߺ�Ȯ��" class="btn_small check" onclick="javascript:doIdCheck()">
							
						</div>
						<!-- group -->
						<div class="input_row">
							<span class="input_box"> <label class="lbl">��й�ȣ</label> <input
								type="password" name="password" id="password" placeholder="��й�ȣ"
								class="input_area" onkeydown="passwordcheck(this,20)" maxlength="20">
								<h4>��й�ȣ�� �ִ� 20���̸� ��ҹ��� �����մϴ�</h4>
							</span>
						</div>
						<div class="input_row">
							<span class="input_box"> <label class="lbl">��й�ȣ
									Ȯ��</label> <input type="password" name="checkpassword"
								id="checkpassword"  placeholder="��й�ȣ Ȯ��"
								class="input_area" style="width: 250px" onkeydown="checkpasswordcheck(this,20)" maxlength="20">
							</span>
						</div>
						<div class="input_row">
							<span class="input_box"> <label class="lbl">�̸�</label> <input
								type="text" name="user_name" id="user_name" style="width: 250px" 
								placeholder="�̸�" class="input_area" value="" onkeydown="namecheck(this,20)" maxlength="20">
							</span>
						</div>
						<div class="input_row" align="left">
							<span class="input_box" > <label class="lbl">������� ex)1998�� 2�� 14�ϻ��̸� 980214</label> <input
								type="text" placeholder="�������  ex)1998�� 2�� 14�ϻ��̸� 980214" class="input_area" value=""
								 name="birthday" id="birthday" onkeydown="birth()" maxlength="6">
							</span>
						</div>
						<!-- group -->
						<div class="group">
							<div class="input_row phone">
								<span class="input_box"> <label class="lbl">�̸���</label><input
									type="text" name="email1" id="email1"  placeholder="�̸���"
									class="input_phone" value="" onkeydown="emailcheck(this,20)" maxlength="20">
								</span>
							</div>
							<label class='dash'> @ </label>
							<div class="input_row phone">
								<span class="input_box"> <label class="lbl"></label> <input
									type="text" name="email2" id="email2"  placeholder=""
									class="input_phone" onkeydown="email2check(this,20)" value="" maxlength="20">
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
								<select name="tel_1">
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
									<input onkeydown="tel2()" type="text" placeholder="��ȭ��ȣ" class="input_phone"
									value="" name="tel_2" id="tel_2"  onkeydown="tel2()" maxlength="4"
									>
								</span>
							</div>
							<label class='dash'> - </label>
							<div class="input_row phone">
								<span class="input_box"> <label class="lbl">��ȭ��ȣ</label>
									<input type="text" placeholder="" class="input_phone"
									value="" name="tel_3" id="tel_3" maxlength="4"
									onkeydown="tel3()">
								</span>
							</div>
						</div>
						<!-- group -->
					</div>
				</div>
			</div>

			<div class="content" style="display: block;">
				<div class="content_wrapper">
					<header>
						<span>�������</span>
					</header>
					<div class="article">
						<li class="sections__section"><h3 class="article_title">��1��(����)</h3>
							�� ����� ���Ǫ��Ʈ��(Ǫ��Ʈ�� �����)�� ��ϴ� ���Ǫ��Ʈ��(���� ��FT���̶� �Ѵ�)���� �����ϴ� ���ͳ� ����
							����(���� �����񽺡��� �Ѵ�)�� �̿��Կ� �־� ���Ǫ��Ʈ���� �̿����� �Ǹ����ǹ� �� å�ӻ����� �������� ��������
							�մϴ�. �ء�PC���, ���� ���� �̿��ϴ� ���ڻ�ŷ��� ���ؼ��� �� ������ ������ �ʴ� �� �� ����� �ؿ��մϴ١�</li> <br />
						<li class="sections__section"><h3 class="article_title">��2��(����)</h3>
							�硰FT�� �̶� ���Ǫ��Ʈ���� ��ȭ �Ǵ� �뿪(���� ����ȭ��̶� ��)�� �̿��ڿ��� �����ϱ� ���Ͽ� ��ǻ�͵�
							������ż��� �̿��Ͽ� ��ȭ���� �ŷ��� �� �ֵ��� ������ ������ �������� ���ϸ�, �ƿ﷯ ���̹�FT�� ��ϴ�
							������� �ǹ̷ε� ����մϴ�. <br /> <br />�衰�̿��ڡ��� ��FT���� �����Ͽ� �� ����� ���� ��FT����
							�����ϴ� ���񽺸� �޴� ȸ�� �� ��ȸ���� ���մϴ�. <br /> <br />�� ��ȸ�����̶� ���� ��FT����
							���������� �����Ͽ� ȸ������� �� �ڷμ�, ��FT���� ������ ���������� ����������, ��FT���� �����ϴ� ���񽺸�
							��������� �̿��� �� �ִ� �ڸ� ���մϴ�. <br /> <br />�� ����ȸ�����̶� ���� ȸ���� �������� �ʰ�
							��FT���� �����ϴ� ���񽺸� �̿��ϴ� �ڸ� ���մϴ�.</li> <br />
						<li class="sections__section"><h3 class="article_title">��3��
								(������� ��ÿ� ���� �� ����)</h3> �� ��FT���� �� ����� ����� ��ȣ �� ��ǥ�� ����, ������ ������
							�ּ�(�Һ����� �Ҹ��� ó���� �� �ִ� ���� �ּҸ� ����), ��ȭ��ȣ, ������۹�ȣ, ���ڿ����ּ�, ����ڵ�Ϲ�ȣ,
							����Ǹž��Ű��ȣ, ������������å���ڵ��� �̿��ڰ� ���� �� �� �ֵ��� ī��Ȧ�� ���̹�FT�� �ʱ� ����ȭ��(����)��
							�Խ��մϴ�. �ٸ�, ����� ������ �̿��ڰ� ����ȭ���� ���Ͽ� �� �� �ֵ��� �� �� �ֽ��ϴ�. <br /> <br />��
							��FT�� �̿��ڰ� ����� �����ϱ⿡ �ռ� ����� ���Ͽ��� �ִ� ���� �� û��öȸ, ���å��, ȯ������ ��� ����
							�߿��� ������ �̿��ڰ� ������ �� �ֵ��� ������ ����ȭ�� �Ǵ� �˾�ȭ�� ���� �����Ͽ� �̿����� Ȯ���� ���Ͽ���
							�մϴ�. <br /> <br />�� ��FT���� ���ڻ�ŷ�����ǼҺ��ں�ȣ�����ѹ���, ����Ǳ��������ѹ���,
							���ڰŷ��⺻��, ���ڼ����, ������Ÿ��̿���������ѹ���, �湮�Ǹŵ���ѹ���, �Һ��ں�ȣ�� �� ���ù��� ��������
							�ʴ� �������� �� ����� ������ �� �ֽ��ϴ�. <br /> <br />�� ��FT���� ����� ������ ��쿡��
							�������� �� ���������� ����Ͽ� �������� �Բ� FT�� �ʱ�ȭ�鿡 �� �������� 7���������� �������� ���ϱ���
							�����մϴ�. �ٸ�, �̿��ڿ��� �Ҹ��ϰ� ��������� �����ϴ� ��쿡�� �ּ��� 30�� �̻��� ���� �����Ⱓ�� �ΰ�
							�����մϴ�. �� ��� FT���� ������ ����� ������ ������ ��Ȯ�ϰ� ���Ͽ� �̿��ڰ� �˱� ������ ǥ���մϴ�. <br />
							<br />�� ��FT���� ����� ������ ��쿡�� �� ��������� �� �������� ���Ŀ� ü��Ǵ� ��࿡�� ����ǰ� ��
							������ �̹� ü��� ��࿡ ���ؼ��� �������� ��������� �״�� ����˴ϴ�. �ٸ� �̹� ����� ü���� �̿��ڰ� �������
							������ ������ �ޱ⸦ ���ϴ� ���� ��3�׿� ���� ��������� �����Ⱓ���� ��FT���� �۽��Ͽ� ��FT���� ���Ǹ� ����
							��쿡�� ������� ������ ����˴ϴ�. <br /> <br />�� �� ������� ������ �ƴ��� ���װ� �� �����
							�ؼ��� ���Ͽ��� ���ڻ�ŷ�����ǼҺ��ں�ȣ�����ѹ���, ����Ǳ�������ѹ���, �����ŷ�����ȸ�� ���ϴ�
							���ڻ�ŷ�����ǼҺ��ں�ȣ��ħ �� ������� �Ǵ� ����ʿ� �����ϴ�.</li> <br />
						<li class="sections__section"><h3 class="article_title">��4��(������
								���� �� ����)</h3> �� ��FT���� ������ ���� ������ �����մϴ�. 1. ��ȭ �Ǵ� �뿪�� ���� ���� ���� �� ���Ű����
							ü�� 2. ���Ű���� ü��� ��ȭ �Ǵ� �뿪�� ��� 3. ��Ÿ ��FT���� ���ϴ� ����<br /> <br />�衰FT����
							��ȭ �Ǵ� �뿪�� ǰ�� �Ǵ� ����� ����� ���� ���� ��쿡�� ���� ü��Ǵ� ��࿡ ���� ������ ��ȭ �Ǵ� �뿪��
							������ ������ �� �ֽ��ϴ�. �� ��쿡�� ����� ��ȭ �Ǵ� �뿪�� ���� �� �������ڸ� ����Ͽ� ������ ��ȭ �Ǵ�
							�뿪�� ������ �Խ��� ���� ��� �����մϴ�. <br /> <br />�顰FT���� �����ϱ�� �̿��ڿ� ����� ü����
							������ ������ ��ȭ���� ǰ�� �Ǵ� ����� ����� ���� ���� ������ ������ ��쿡�� �� ������ �̿��ڿ��� ���� ������
							�ּҷ� ��� �����մϴ�. �������� ��� ��FT���� �̷� ���Ͽ� �̿��ڰ� ���� ���ظ� ����մϴ�. �ٸ�, ��FT����
							���� �Ǵ� ������ ������ �����ϴ� ��쿡�� �׷����� �ƴ��մϴ�.</li> <br />
						<li class="sections__section"><h3 class="article_title">��5��(������
								�ߴ�)</h3> �� ��FT���� ��ǻ�� �� ������ż����� �������ˤ���ü �� ����, ����� ���� ���� ������ �߻��� ��쿡��
							������ ������ �Ͻ������� �ߴ��� �� �ֽ��ϴ�. <br /> <br />�衰FT���� ��1���� ������ ������
							������ �Ͻ������� �ߴܵ����� ���Ͽ� �̿��� �Ǵ� ��3�ڰ� ���� ���ؿ� ���Ͽ� ����մϴ�. ��, ��FT���� ���� �Ǵ�
							������ ������ �����ϴ� ��쿡�� �׷����� �ƴ��մϴ�. <br /> <br />���������� ��ȯ, ����� ����,
							��ü���� ���� ���� ������ ���񽺸� ������ �� ���� �Ǵ� ��쿡�� ��FT���� ��8���� ���� ������� �̿��ڿ���
							�����ϰ� ���� ��FT������ ������ ���ǿ� ���� �Һ��ڿ��� �����մϴ�. �ٸ�, ��FT���� ������� ���� �������� �ƴ���
							��쿡�� �̿��ڵ��� ���ϸ��� �Ǵ� ������ ���� ��FT������ ���Ǵ� ��ȭ��ġ�� �����ϴ� ���� �Ǵ� �������� �̿��ڿ���
							�����մϴ�.</li> <br />


						<li class="sections__section"><h3 class="article_title">��6��(ȸ������)</h3>
							�� �̿��ڴ� ��FT���� ���� ���� ��Ŀ� ���� ȸ�������� ������ �� �� ����� �����Ѵٴ� �ǻ�ǥ�ø� �����μ�
							ȸ�������� ��û�մϴ�. <br /> <br />�� ��FT���� ��1�װ� ���� ȸ������ ������ ���� ��û�� �̿��� ��
							���� ��ȣ�� �ش����� �ʴ� �� ȸ������ ����մϴ�. 1. ���Խ�û�ڰ� �� ��� ��7����3�׿� ���Ͽ� ������ ȸ���ڰ���
							����� ���� �ִ� ���, �ٸ� ��7����3�׿� ���� ȸ���ڰ� ����� 3���� ����� �ڷμ� ��FT���� ȸ���簡�� �³���
							���� ��쿡�� ���ܷ� �Ѵ�. 2. ��� ���뿡 ����, ���紩��, ���Ⱑ �ִ� ��� 3. ��Ÿ ȸ������ ����ϴ� ����
							��FT���� ����� ������ ������ �ִٰ� �ǴܵǴ� ��� <br /> <br />�� ȸ�����԰���� �����ñ��
							��FT���� �³��� ȸ������ ������ �������� �մϴ�. �� ȸ���� ��15����1�׿� ���� ��ϻ��׿� ������ �ִ� ���,
							��� ���ڿ��� ��Ÿ ������� ��FT���� ���Ͽ� �� ��������� �˷��� �մϴ�.</li> <br />
						<li class="sections__section"><h3 class="article_title">��7��(ȸ��
								Ż�� �� �ڰ� ��� ��)</h3> �� ȸ���� ��FT���� �������� Ż�� ��û�� �� ������ ��FT���� ��� ȸ��Ż��
							ó���մϴ�. <br /> <br />�� ȸ���� ���� ��ȣ�� ������ �ش��ϴ� ���, ��FT���� ȸ���ڰ��� ���� ��
							������ų �� �ֽ��ϴ�. 1. ���� ��û�ÿ� ���� ������ ����� ��� 2. ��FT���� �̿��Ͽ� ������ ��ȭ���� ���,
							��Ÿ ��FT���̿뿡 �����Ͽ� ȸ���� �δ��ϴ� ä���� ���Ͽ� �������� �ʴ� ��� 3. �ٸ� ����� ��FT�� �̿���
							�����ϰų� �� ������ �����ϴ� �� ���ڻ�ŷ� ������ �����ϴ� ��� 4. ��FT���� �̿��Ͽ� ���� �Ǵ� �� �����
							�����ϰų� ������ӿ� ���ϴ� ������ �ϴ� ��� <br /> <br />�� ��FT���� ȸ�� �ڰ��� ���Ѥ�����
							��Ų��, ������ ������ 2ȸ�̻� �ݺ��ǰų� 30���̳��� �� ������ �������� �ƴ��ϴ� ��� ��FT���� ȸ���ڰ���
							��ǽ�ų �� �ֽ��ϴ�. <br /> <br />�� ��FT���� ȸ���ڰ��� ��ǽ�Ű�� ��쿡�� ȸ������� �����մϴ�.
							�� ��� ȸ������ �̸� �����ϰ�, ȸ����� �������� �ּ��� 30�� �̻��� �Ⱓ�� ���Ͽ� �Ҹ��� ��ȸ�� �ο��մϴ�.</li> <br />
						<li class="sections__section"><h3 class="article_title">��8��(ȸ����
								���� ����)</h3> �� ��FT���� ȸ���� ���� ������ �ϴ� ���, ȸ���� ��FT���� �̸� �����Ͽ� ������ ���ڿ��� �ּҷ�
							�� �� �ֽ��ϴ�. <br /> <br />�� ��FT���� ��Ư���ټ� ȸ���� ���� ������ ��� 1�����̻� ��FT��
							�Խ��ǿ� �Խ������μ� ���� ������ ������ �� �ֽ��ϴ�. �ٸ�, ȸ�� ������ �ŷ��� �����Ͽ� �ߴ��� ������ ��ġ��
							���׿� ���Ͽ��� ���������� �մϴ�.</li> <br />
						<li class="sections__section"><h3 class="article_title">��9��(���Ž�û)</h3>
							��FT���̿��ڴ� ��FT���󿡼� ���� �Ǵ� �̿� ������ ����� ���Ͽ� ���Ÿ� ��û�ϸ�, ��FT���� �̿��ڰ� ���Ž�û��
							�Կ� �־ ������ �� ������ �˱� ���� �����Ͽ��� �մϴ�. ��, ȸ���� ��� ��2ȣ ���� ��4ȣ�� ������ ������ ��
							�ֽ��ϴ�. 1. ��ȭ���� �˻� �� ���� 2. ����, �ּ�, ��ȭ��ȣ, ���ڿ����ּ�(�Ǵ� �̵���ȭ��ȣ) ���� �Է� 3.
							�������, û��öȸ���� ���ѵǴ� ����, ��۷����ġ�� ���� ���δ�� ������ ���뿡 ���� Ȯ�� 4. �� �����
							�����ϰ� �� 3.ȣ�� ������ Ȯ���ϰų� �ź��ϴ� ǥ��(��, ���콺 Ŭ��) 5. ��ȭ���� ���Ž�û �� �̿� ���� Ȯ��
							�Ǵ� ��FT���� Ȯ�ο� ���� ���� 6. ��������� ����</li> <br />
						<li class="sections__section"><h3 class="article_title">��10��
								(����� ����)</h3> �� ��FT���� ��9���� ���� ���Ž�û�� ���Ͽ� ���� ��ȣ�� �ش��ϸ� �³����� ���� �� �ֽ��ϴ�.
							�ٸ�, �̼����ڿ� ����� ü���ϴ� ��쿡�� �����븮���� ���Ǹ� ���� ���ϸ� �̼����� ���� �Ǵ� �����븮���� �����
							����� �� �ִٴ� ������ �����Ͽ��� �մϴ�. 1. ��û ���뿡 ����, ���紩��, ���Ⱑ �ִ� ��� 2. �̼����ڰ�
							���, �ַ��� û�ҳ⺸ȣ������ �����ϴ� ��ȭ �� �뿪�� �����ϴ� ��� 3. ��Ÿ ���Ž�û�� �³��ϴ� ���� ��FT��
							����� ������ ������ �ִٰ� �Ǵ��ϴ� ��� <br /> <br />�� ��FT���� �³��� ��12����1����
							����Ȯ���������·� �̿��ڿ��� ������ ������ ����� ������ ������ ���ϴ�. <br /> <br />�� ��FT����
							�³��� �ǻ�ǥ�ÿ��� �̿����� ���� ��û�� ���� Ȯ�� �� �ǸŰ��� ����, ���Ž�û�� ���� ��ҵ ���� ��������
							�����Ͽ��� �մϴ�.</li> <br />
						<li class="sections__section"><h3 class="article_title">��11��(���޹��)</h3>
							��FT������ ������ ��ȭ �Ǵ� �뿪�� ���� ������޹���� ���� ��ȣ�� ����� ������ ������� �� �� �ֽ��ϴ�. ��,
							��FT���� �̿����� ���޹���� ���Ͽ� ��ȭ ���� ��ݿ� ��� ����� �����ᵵ �߰��Ͽ� ¡���� �� �����ϴ�. 1.
							����ŷ, ���ͳݹ�ŷ, ���� ��ŷ ���� ���� ������ü 2. ����ī��, ����ī��, �ſ�ī�� ���� ���� ī�� ���� 3.
							�¶��ι������Ա� 4. ����ȭ�� ���� ���� 5. ���ɽ� ������� 6. ���ϸ��� �� ��FT���� ������ ����Ʈ�� ����
							���� 7. ��FT���� ����� �ξ��ų� ��FT���� ������ ��ǰ�ǿ� ���� ���� 8. ��Ÿ ������ ���� ����� ���� ���
							���� ��</li> <br />
						<li class="sections__section"><h3 class="article_title">��12��(����Ȯ������-���Ž�û
								���� �� ���)</h3> �� ��FT���� �̿����� ���Ž�û�� �ִ� ��� �̿��ڿ��� ����Ȯ�������� �մϴ�. <br /> <br />��
							����Ȯ�������� ���� �̿��ڴ� �ǻ�ǥ���� ����ġ���� �ִ� ��쿡�� ����Ȯ�������� ���� �� ��� ���Ž�û ���� �� ��Ҹ�
							��û�� �� �ְ� ��FT���� ������� �̿����� ��û�� �ִ� ��쿡�� ��ü���� �� ��û�� ���� ó���Ͽ��� �մϴ�. �ٸ�
							�̹� ����� ������ ��쿡�� ��15���� û��öȸ � ���� ������ �����ϴ�.</li> <br />
						<li class="sections__section"><h3 class="article_title">��13��(��ȭ����
								����)</h3> �� ��FT���� �̿��ڿ� ��ȭ���� ���޽ñ⿡ ���Ͽ� ������ ������ ���� �̻�, �̿��ڰ� û���� �� ������ 7��
							�̳��� ��ȭ ���� ����� �� �ֵ��� �ֹ�����, ���� �� ��Ÿ�� �ʿ��� ��ġ�� ���մϴ�. �ٸ�, ��FT���� �̹� ��ȭ
							���� ����� ���� �Ǵ� �Ϻθ� ���� ��쿡�� ����� ���� �Ǵ� �Ϻθ� ���� ������ 2������ �̳��� ��ġ�� ���մϴ�.
							�̶� ��FT���� �̿��ڰ� ��ȭ���� ���� ���� �� ���� ������ Ȯ���� �� �ֵ��� ������ ��ġ�� �մϴ�. <br />
							<br />�衰FT���� �̿��ڰ� ������ ��ȭ�� ���� ��ۼ���, ���ܺ� ��ۺ�� �δ���, ���ܺ� ��۱Ⱓ ����
							����մϴ�. ���� ��FT���� ���� ��۱Ⱓ�� �ʰ��� ��쿡�� �׷� ���� �̿����� ���ظ� ����Ͽ��� �մϴ�. �ٸ�
							��FT���� ���Ǥ������� ������ ������ ��쿡�� �׷����� �ƴ��մϴ�.</li> <br />
						<li class="sections__section"><h3 class="article_title">��14��(ȯ��)</h3>
							��FT���� �̿��ڰ� ���Ž�û�� ��ȭ���� ǰ�� ���� ������ �ε� �Ǵ� ������ �� �� ���� ������ ��ü���� �� ������
							�̿��ڿ��� �����ϰ� ������ ��ȭ ���� ����� ���� ��쿡�� ����� ���� ������ 2������ �̳��� ȯ���ϰų� ȯ�޿�
							�ʿ��� ��ġ�� ���մϴ�.</li> <br />
						<li class="sections__section"><h3 class="article_title">��15��(û��öȸ
								��)</h3> �硰FT���� ��ȭ���� ���ſ� ���� ����� ü���� �̿��ڴ� ����Ȯ���� ������ ���� ������ 7�� �̳����� û����
							öȸ�� �� �� �ֽ��ϴ�. <br /> <br />�� �̿��ڴ� ��ȭ���� ��۹��� ��� ���� ��ȣ�� 1�� �ش��ϴ�
							��쿡�� ��ǰ �� ��ȯ�� �� �� �����ϴ�. 1. �̿��ڿ��� å�� �ִ� ������ ��ȭ ���� ��� �Ǵ� �Ѽյ� ���(�ٸ�,
							��ȭ ���� ������ Ȯ���ϱ� ���Ͽ� ���� ���� �Ѽ��� ��쿡�� û��öȸ�� �� �� �ֽ��ϴ�) 2. �̿����� ��� �Ǵ�
							�Ϻ� �Һ� ���Ͽ� ��ȭ ���� ��ġ�� ������ ������ ��� 3. �ð��� ����� ���Ͽ� ���ǸŰ� ����� ������ ��ȭ����
							��ġ�� ������ ������ ��� 4. ���� ������ ���� ��ȭ������ ������ ������ ��� �� ������ ��ȭ ���� ������ �Ѽ���
							��� <br /> <br />�� ��2����2ȣ ���� ��4ȣ�� ��쿡 ��FT���� ������ û��öȸ ���� ���ѵǴ� �����
							�Һ��ڰ� ���� �� �� �ִ� ���� ����ϰų� �ÿ��ǰ�� �����ϴ� ���� ��ġ�� ���� �ʾҴٸ� �̿����� û��öȸ����
							���ѵ��� �ʽ��ϴ�. <br /> <br />�� �̿��ڴ� ��1�� �� ��2���� ������ �ұ��ϰ� ��ȭ���� ������
							ǥ�á����� ����� �ٸ��ų� ��೻��� �ٸ��� ����� ������ ���� ��ȭ���� ���޹��� ������ 3���̳�, �� ����� �� ��
							�Ǵ� �� �� �־��� ������ 30�� �̳��� û��öȸ ���� �� �� �ֽ��ϴ�.</li> <br />
						<li class="sections__section"><h3 class="article_title">��16��(û��öȸ
								���� ȿ��)</h3> �� ��FT���� �̿��ڷκ��� ��ȭ ���� ��ȯ���� ��� 3������ �̳��� �̹� ���޹��� ��ȭ���� �����
							ȯ���մϴ�. �� ��� ��FT���� �̿��ڿ��� ��ȭ���� ȯ���� ������ ������ �� �����Ⱓ�� ���Ͽ� �����ŷ�����ȸ�� ���Ͽ�
							����ϴ� ������������ ���Ͽ� ������ �������ڸ� �����մϴ�. <br /> <br />�� ��FT���� �� �����
							ȯ���Կ� �־ �̿��ڰ� �ſ�ī�� �Ǵ� ����ȭ�� ���� ������������ ��ȭ���� ����� ������ ������ ��ü���� ����
							���������� ������ ����ڷ� �Ͽ��� ��ȭ���� ����� û���� ���� �Ǵ� ����ϵ��� ��û�մϴ�. <br /> <br />��
							û��öȸ���� ��� ���޹��� ��ȭ���� ��ȯ�� �ʿ��� ����� �̿��ڰ� �δ��մϴ�. ��FT���� �̿��ڿ��� û��öȸ����
							������ ����� �Ǵ� ���ع���� û������ �ʽ��ϴ�. �ٸ� ��ȭ���� ������ ǥ�á����� ����� �ٸ��ų� ��೻��� �ٸ���
							����Ǿ� û��öȸ���� �ϴ� ��� ��ȭ���� ��ȯ�� �ʿ��� ����� ��FT���� �δ��մϴ�. <br /> <br />��
							�̿��ڰ� ��ȭ���� ���������� �߼ۺ� �δ��� ��쿡 ��FT���� û��öȸ�� �� ����� ���� �δ��ϴ����� �̿��ڰ� �˱�
							������ ��Ȯ�ϰ� ǥ���մϴ�.</li> <br />
						<li class="sections__section"><h3 class="article_title">��17��(����������ȣ)</h3>
							�硰FT���� �̿����� ���������� ���Ű�� ���࿡ �ʿ��� �ּ����� ������ �����մϴ�. ���� ������ �ʼ��������� �ϸ� ��
							�� ������ ���û������� �մϴ�. 1. ���� 2. �ּ� 3. ��ȭ��ȣ 4. ���ID(ȸ���� ���) 5. ��й�ȣ(ȸ����
							���) 6. ���ڿ����ּ�(�Ǵ� �̵���ȭ��ȣ) <br /> <br />�� ��FT���� �̿����� ���νĺ��� ������
							���������� �����ϴ� ������ �ݵ�� ���� �̿����� ���Ǹ� �޽��ϴ�. <br /> <br />�������� ���������� ����
							�̿����� ���Ǿ��� �������� �̿��̳� ��3�ڿ��� ������ �� ������, �̿� ���� ��� å���� FT �� ���ϴ�. �ٸ�,
							������ ��쿡�� ���ܷ� �մϴ�. 1. ��۾����� ��۾�ü���� ��ۿ� �ʿ��� �ּ����� �̿����� ����(����, �ּ�,
							��ȭ��ȣ)�� �˷��ִ� ��� 2. ����ۼ�, �м����� �Ǵ� �������縦 ���Ͽ� �ʿ��� ���μ� Ư�� ������ �ĺ��� ��
							���� ���·� �����ϴ� ��� 3. ��ȭ���� �ŷ��� ���� ��������� ���Ͽ� �ʿ��� ��� 4. ��������� ���Ͽ� ����Ȯ�ο�
							�ʿ��� ��� 5. ������ ���� �Ǵ� ������ ���Ͽ� �ʿ��� �Ұ����� ������ �ִ� ��� <br /> <br />�ꡰFT����
							��2�װ� ��3�׿� ���� �̿����� ���Ǹ� �޾ƾ� �ϴ� ��쿡�� ������������ å������ �ſ�(�Ҽ�, ���� �� ��ȭ��ȣ,
							��Ÿ ����ó), ������ �������� �� �̿����, ��3�ڿ� ���� �������� ���û���(����������, �������� �� ������ ������
							����) �� ������Ÿ��̿���������ѹ��� ��22����2���� ������ ������ �̸� ����ϰų� �����ؾ� �ϸ� �̿��ڴ� ��������
							�� ���Ǹ� öȸ�� �� �ֽ��ϴ�. <br /> <br />���̿��ڴ� �������� ��FT���� ������ �ִ� �ڽ���
							���������� ���� ���� �� ���������� �䱸�� �� ������ ��FT���� �̿� ���� ��ü���� �ʿ��� ��ġ�� ���� �ǹ���
							���ϴ�. �̿��ڰ� ������ ������ �䱸�� ��쿡�� ��FT���� �� ������ ������ ������ ���� ���������� �̿�����
							�ʽ��ϴ�. <br /> <br />�� ��FT���� �������� ��ȣ�� ���Ͽ� �����ڸ� �����Ͽ� �� ���� �ּ�ȭ�ϸ�
							�ſ�ī��, ������� ���� ������ �̿����� ���������� �н�, ����, ����, ���� ������ ���� �̿����� ���ؿ� ���Ͽ�
							��� å���� ���ϴ�. �� ��FT�� �Ǵ� �׷κ��� ���������� �������� ��3�ڴ� ���������� �������� �Ǵ� �������� ������
							�޼��� ������ ���� ���������� ��ü���� �ı��մϴ�.</li> <br />
						<li class="sections__section"><h3 class="article_title">��18��(��FT����
								�ǹ�)</h3> �� ��FT���� ���ɰ� �� ����� �����ϰų� ������ӿ� ���ϴ� ������ ���� ������ �� ����� ���ϴ� �ٿ� ����
							�������̰�, ���������� ��ȭ���뿪�� �����ϴµ� �ּ��� ���Ͽ��� �մϴ�. <br /> <br />�� ��FT����
							�̿��ڰ� �����ϰ� ���ͳ� ���񽺸� �̿��� �� �ֵ��� �̿����� ��������(�ſ����� ����)��ȣ�� ���� ���� �ý�����
							���߾�� �մϴ�. <br /> <br />�� ��FT���� ��ǰ�̳� �뿪�� ���Ͽ� ��ǥ�ä������ǰ���ȭ�����ѹ�����
							��3�� ������ �δ��� ǥ�ä����������� �����ν� �̿��ڰ� ���ظ� ���� ������ �̸� ����� å���� ���ϴ�. <br />
							<br />�� ��FT���� �̿��ڰ� ������ �ʴ� ���������� ���� ���ڿ����� �߼����� �ʽ��ϴ�.</li> <br />
						<li class="sections__section"><h3 class="article_title">��19��(ȸ����
								ID �� ��й�ȣ�� ���� �ǹ�)</h3> �� ��17���� ��츦 ������ ID�� ��й�ȣ�� ���� ����å���� ȸ������ �ֽ��ϴ�.

							<br /> <br />�� ȸ���� �ڽ��� ID �� ��й�ȣ�� ��3�ڿ��� �̿��ϰ� �ؼ��� �ȵ˴ϴ�. <br />
							<br />�� ȸ���� �ڽ��� ID �� ��й�ȣ�� �������ϰų� ��3�ڰ� ����ϰ� ������ ������ ��쿡�� �ٷ�
							��FT���� �뺸�ϰ� ��FT���� �ȳ��� �ִ� ��쿡�� �׿� ����� �մϴ�.</li> <br />
						<li class="sections__section"><h3 class="article_title">��20��(�̿�����
								�ǹ�)</h3> �̿��ڴ� ���� ������ �Ͽ����� �ȵ˴ϴ�. 1. ��û �Ǵ� ����� ���� ������ ��� 2. Ÿ���� ���� ����
							3. ��FT���� �Խõ� ������ ���� 4. ��FT���� ���� ���� �̿��� ����(��ǻ�� ���α׷� ��) ���� �۽� �Ǵ� �Խ�
							5. ��FT�� ��Ÿ ��3���� ���۱� �� �������ǿ� ���� ħ�� 6. ��FT�� ��Ÿ ��3���� ���� �ջ��Ű�ų� ������
							�����ϴ� ���� 7. �ܼ� �Ǵ� �������� �޽���, ȭ��, ����, ��Ÿ ������ӿ� ���ϴ� ������ FT�� ���� �Ǵ�
							�Խ��ϴ� ����</li> <br />
						<li class="sections__section"><h3 class="article_title">��21��(���ᡰFT����
								�ǿ��ᡰFT�� ���� ����)</h3> �� ���� ��FT���� ���� ��FT���� ������ ��ũ(��: ������ ��ũ�� ��󿡴� ����, �׸�
							�� ��ȭ�� ���� ���Ե�)��� ������ ����� ���, ���ڸ� ���� ��FT��(�� ����Ʈ)�̶�� �ϰ� ���ڸ� �ǿ���
							��FT��(������Ʈ)�̶�� �մϴ�. <br /> <br />�迬�ᡰFT���� �ǿ��ᡰFT���� ���������� �����ϴ�
							��ȭ� ���Ͽ� �̿��ڿ� ���ϴ� �ŷ��� ���ؼ� ����å���� ���� �ʴ´ٴ� ���� ���ᡰFT���� �ʱ�ȭ�� �Ǵ� ����Ǵ�
							������ �˾�ȭ������ ����� ��쿡�� �� �ŷ��� ���� ����å���� ���� �ʽ��ϴ�.</li> <br />
						<li class="sections__section"><h3 class="article_title">��22��(���۱���
								�ͼ� �� �̿�����)</h3> �� ��FT���� �ۼ��� ���۹��� ���� ���۱� ��Ÿ ���������� ��FT���� �ͼ��մϴ�. <br />
							<br />�� �̿��ڴ� ��FT���� �̿������ν� ���� ���� �� ��FT������ ���������� �ͼӵ� ������ ��FT���� ����
							�³����� ����, �۽�, ����, ����, ��� ��Ÿ ����� ���Ͽ� ������������ �̿��ϰų� ��3�ڿ��� �̿��ϰ� �Ͽ�����
							�ȵ˴ϴ�. <br /> <br />�� ��FT���� ������ ���� �̿��ڿ��� �ͼӵ� ���۱��� ����ϴ� ��� ����
							�̿��ڿ��� �뺸�Ͽ��� �մϴ�.</li> <br />
						<li class="sections__section"><h3 class="article_title">��23��(�����ذ�)</h3>
							�� ��FT���� �̿��ڰ� �����ϴ� ������ �ǰ��̳� �Ҹ��� �ݿ��ϰ� �� ���ظ� ����ó���ϱ� ���Ͽ� ���غ���ó���ⱸ��
							��ġ����մϴ�. <br /> <br />�� ��FT���� �̿��ڷκ��� ����Ǵ� �Ҹ����� �� �ǰ��� �켱������ ��
							������ ó���մϴ�. �ٸ�, �ż��� ó���� ����� ��쿡�� �̿��ڿ��� �� ������ ó�������� ��� �뺸�� �帳�ϴ�. <br />
							<br />�顰FT���� �̿��ڰ��� �߻��� ���ڻ�ŷ� ����� �����Ͽ� �̿����� ���ر�����û�� �ִ� ��쿡��
							�����ŷ�����ȸ �Ǵ� �á������簡 �Ƿ��ϴ� ������������� ������ ���� �� �ֽ��ϴ�.</li> <br />
						<li class="sections__section"><h3 class="article_title">��24��(���Ǳ�
								�� �ذŹ�)</h3> �硰FT���� �̿��ڰ��� �߻��� ���ڻ�ŷ� ���￡ ���� �Ҽ��� ���� ����� �̿����� �ּҿ� ���ϰ�,
							�ּҰ� ���� ��쿡�� �żҸ� �����ϴ� ��������� ���Ӱ��ҷ� �մϴ�. �ٸ�, ���� ��� �̿����� �ּ� �Ǵ� �żҰ�
							�и����� �ʰų� �ܱ� �������� ��쿡�� �λ�Ҽ۹����� ���ҹ����� �����մϴ�. <br /> <br />�衰FT����
							�̿��ڰ��� ����� ���ڻ�ŷ� �Ҽۿ��� �ѱ����� �����մϴ�.</li>
					</div>
					<div class="agree">
						������ <input type='checkbox' name="ckbox" />
					</div>
					<div class="article">
						<li class="sections__section"><h3 class="article_title">�����ϴ�
								���������� �׸�</h3> ȸ��� ȸ������, ���, ���� ��û �� ���� ���� ���� �Ʒ��� ���� ���������� �����ϰ� �ֽ��ϴ�.
							- �̸�, �̸���, �ּ�, ����ó, �ڵ��� ��ȣ, ���̵�, ��й�ȣ, �г���, �ѽ���ȣ, Ȩ������ �ּ� ���� ����
							�̿�����̳� ��� ó�� �������� �Ʒ��� ���� �������� �����Ǿ� ������ �� �ֽ��ϴ�. - ���� �̿���, ���� �α�,
							��Ű, ���� IP ����, �湮�Ͻ�, ���������� �� os, �˻���, �������, �̿����� ���, �����</li>
						<li class="sections__section"><h3 class="article_title">����������
								���� �� �̿����</h3> ȸ��� ������ ���������� ������ ������ ���� Ȱ���մϴ�. ��. ���� ������ ���� ��� ���� ��
							���� ������ ���� ������� ������ ����, ��ǰ��� �Ǵ� û���� �� �߼�, �����ŷ� ���� ���� �� ���� ����, ����
							�� ��� ����, ����߽� ��. ȸ�� ���� ȸ���� ���� �̿뿡 ���� ����Ȯ��, ���νĺ�, �ҷ�ȸ���� ���� �̿� ������
							���ΰ� ��� ����, ���� �ǻ� Ȯ��, ���� �� ����Ƚ�� ����, ��14�� �̸� �Ƶ� �������� ���� �� ���� �븮��
							���ǿ��� Ȯ��, ���� ���� �븮�� ����Ȯ��, ���� ������ ���� ��Ϻ���, �Ҹ�ó�� �� �ο�ó��, �������� ����</li>
						<li class="sections__section"><h3 class="article_title">����������
								����/�̿�Ⱓ</h3> �̿����� ���������� ��Ģ������ ���������� ���� �� �̿������ �޼��Ǹ� ��ü ���� �ı��մϴ�. ��,
							������ ������ ���ؼ��� �Ʒ��� ������ ����� �Ⱓ ���� �����մϴ�. ��. ȸ�� ���� ��ħ�� ���� �������� ���� -
							�����̿��� ���� ���� : ���� �̿� ���� ���� �Ⱓ : 1�� ��. ���ù��ɿ� ���� �������� ���� ���, ���ڻ�ŷ�
							����� �Һ��ں�ȣ�� ���� ���� �� ��������� ������ ���Ͽ� ������ �ʿ䰡 �ִ� ��� ȸ��� ������ɿ��� ���� ������
							�Ⱓ ���� ȸ�������� �����մϴ�. �� ��� ȸ��� �����ϴ� ������ �� ������ �������θ� �̿��ϸ� �����Ⱓ�� �Ʒ���
							�����ϴ�. - ��� �Ǵ� û��öȸ � ���� ��� ���� ���� : ���ڻ�ŷ� ����� �Һ��ں�ȣ�� ���� ���� ���� �Ⱓ
							: 5�� - ��ݰ��� �� ��ȭ ���� ���޿� ���� ��� ���� ���� : ���ڻ�ŷ� ����� �Һ��ں�ȣ�� ���� ���� ����
							�Ⱓ : 5�� - �Һ����� �Ҹ� �Ǵ� ����ó���� ���� ��� ���� ���� : ���ڻ�ŷ� ����� �Һ��ں�ȣ�� ���� ����
							���� �Ⱓ : 3�� - ����Ȯ�ο� ���� ��� ���� ���� : ������� �̿����� �� ������ȣ � ���� ���� ���� �Ⱓ
							: 6���� - �湮�� ���� ��� ���� ���� : ��ź�к�ȣ�� ���� �Ⱓ : 3����</li>
						<li class="sections__section"><h3 class="article_title">�����������
								��Ź���� / ������������ �ź�</h3> ��. ����������� ��Ź���� - �������������Ź�� �޴� �� : (��)oooo -
							�������������Ź�� �ϴ� ������ ���� : ȸ������ ȸ���� ���� �̿뿡 ���� ȸ������ ���� �� ������Ʈ �ý��� ����

							��. ������������ �źο� ���� ���� - ���ϲ����� �� ���� �ȳ� ������ �����Ͽ�����, �ȳ������� ���� �����Ͻ� ��
							�ֽ��ϴ�. ��, �����Ͻ� ��쿡�� ���� �̿뿡 ������ ���� �� �ֽ��ϴ�.</li>
						<li class="sections__section"><h3 class="article_title">�����ĺ�����
								ó���� ���� ���� / ����Ȯ�μ��� �̿��� ���� �����ĺ� ���� ���� ����</h3> NICE�ſ���������(���� ������硱)��
							������硱���� ������ ��ü[�ڼ��� ��ü ����� ������硱���� �����ϴ� ������������ �̿� ��, ���]�� ���� �����ϴ�
							�޴��� �������� ���񽺿� �����Ͽ� �����κ��� ������ �����ĺ������� �̿��ϰų� Ÿ�ο��� ������ ������ ��������Ÿ�
							�̿����� �� ������ȣ � ���� ������(���� ��������Ÿ�����)�� ���� ���� ���Ǹ� ���� �մϴ�. ��1��
							[�����ĺ������� ó��] ������Ȯ�α������ �޴��� �������� ���� ���� ��, �Ʒ� �� ���� ������ ���� ����
							�����ĺ������� ó���� �� �ֽ��ϴ�. 1. ������Ÿ��� ��23���� 2 ��2�׿� ���� ���ͳݻ󿡼� �ֹε�Ϲ�ȣ�� �Է�����
							�ʰ� �������� Ȯ���� �� �ִ� �޴��� �����������񽺸� �����ϱ� ���� �����ĺ������� �̿� 2. ������Ȯ�α�� ����
							� ���� ����(����������ȸ ���)���� ���� ������硱�� ����� ������ż��� �������� ���輭�� �� �ߺ�
							����Ȯ���� ���� �ʿ��� ���, ������硱���� ������ ��ü�� �Ʒ��� �����ĺ������� �����޾� ó���� �� �ֽ��ϴ�. (1)
							�̸�, �޴�����ȣ, ��Ż�, ����, �������, ���� ��2�� [����Ȯ�μ��� �̿��� ���� �����ĺ� ���� ��3�� ����
							����] �̿��ڴ� ������硱�� �����ϴ� ����Ȯ�μ���(���� �����񽺡��� �մϴ�)�� �̿��ϱ� ���� ���� �̿�����
							�����ĺ������� ����Ȯ�α���� �Ʒ� ����� �� 3�ڿ��� �����ϴ� �Ϳ� ���� �մϴ�. 1. �����ĺ������� �����޴� ��

							������硱 �� ������硱���� ������ ��ü(SKT, Kt, LG U+, ���������������) 2. �����ĺ������� �����޴�
							���� �̿���� - ����(ȸ������, ID/PWã�� ��) �̿��� ���� �������� - ���������� ���� �޴��� ������ ��ġ
							���� Ȯ�� - �޴��� ����� Ȯ���� ���� SMS ������ȣ ���� - ���� �̿� ���� 3. �����ϴ� �����ĺ����� �׸� -
							����, ����, �������, ��/�ܱ���, �޴�����ȣ, �̵���Ż� 4. �����ĺ������� �����޴� ���� ���� �� �̿� �Ⱓ -
							�̿����� ���������� �̿������ �޼��ǰų� ���� �� �����Ⱓ�� ������ ��� �ش� ������ ��ü ���� �ı�. ��, ����
							���� �� ȸ���ħ�� ���� �����ϴ� ������ ��� �Ʒ� �������θ� �̿��ϸ� �����Ⱓ�� ������ �����ϴ�. '������Ÿ�
							�̿����� �� ������ȣ � ���� ����'�� �ŷ���� ���� �ǹ��� ���� ����: 1��</li>
						<h3 class="article_title"></h3>
					</div>
					<div class="agree">
						������ <input type='checkbox' name="ckbox" />
					</div>
				</div>
			</div>
			<!-- join -->
			<div class="content wrapper50">
				<input type="button" title="Ȯ��"  value="Ȯ��" onclick="doAction()"
					class="btn_half left"> <input type="button" title="���"
					value="���" class="btn_half left"
					onclick="location.href='/appmain.do'">
			</div>
		</form>
		<!-- E: CONTENT -->
		<!-- S: FOOTER -->
		<%@include file="/guestinc/appfooter.jsp"%>
		<!-- E: FOOTER -->
	</div>
	<!-- E: WRAPPER -->
</body>
</html>
