<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.CtrDTO"%>
<%@page import="java.util.List"%>    

<!DOCTYPE html>
<html lang="en">
<head>
    <title>���Ǫ��Ʈ��</title>
    <meta charset="EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/css/style.css?ver=2">
<script type="text/javascript">
		function doAction() {
//*f�� form �±� ���� id��*//
			var f = document.getElementById("f");
			
			if (f.title.value==""){alert("������ �Է��Ͻñ� �ٶ��ϴ�.");f.title.focus();return;}
			if (f.people.value==""){alert("�����ο��� �Է��Ͻñ� �ٶ��ϴ�.");f.people.focus();return;}
			if (f.place.value==""){alert("��Ҹ� �Է��Ͻñ� �ٶ��ϴ�.");f.place.focus();return;}
			if (f.user_name.value==""){alert("�̸��� �Է��Ͻñ� �ٶ��ϴ�.");f.user_name.focus();return;}
			if (f.tel_1.value==""){alert("�ڵ��� ��ȣ�� �Է��Ͻñ� �ٶ��ϴ�.");f.tel_1.focus();return;}
			if (f.tel_2.value==""){alert("�ڵ��� ��ȣ�� �Է��Ͻñ� �ٶ��ϴ�.");f.tel_2.focus();return;}
			if (f.tel_3.value==""){alert("�ڵ��� ��ȣ�� �Է��Ͻñ� �ٶ��ϴ�.");f.tel_3.focus();return;}
			if (f.contents.value==""){alert("������ �Է��Ͻñ� �ٶ��ϴ�.");f.contents.focus();return;}
			
			if (calBytes(f.title.value) > 100) {
				alert("������ �ִ� 100Bytes���� �Է� �����մϴ�.");
				f.title.focus();
				return;
			}
			
			if (calBytes(f.place.value) > 100) {
				alert("��Ҵ� �ִ� 100Bytes���� �Է� �����մϴ�.");
				f.title.focus();
				return;
			}	
			
			if (calBytes(f.user_name.value) > 20) {
				alert("�̸��� �ִ� 20Bytes���� �Է� �����մϴ�.");
				f.title.focus();
				return;
			}

		 	if (calBytes(f.contents.value) > 4000) {
				alert("������ �ִ� 4,000Bytes���� �Է� �����մϴ�.");
				f.contents.focus();
				return;
			}   
		 //f.target = "ifrProc";
		 f.submit();
		}
			
	/*10.06 		if (chkRadio()==false){
				alert("�������θ� üũ�Ͻñ� �ٶ��ϴ�.");
				f.ctr_yn[0].focus();
				return false;
			} */

		/* 	 if (f.contents.value==""){alert("������ �Է��Ͻñ� �ٶ��ϴ�.");f.contents.focus();return;}
			alert("1");

			if (calBytes(f.contents.value) > 4000) {
				alert("������ �ִ� 4,000Bytes���� �Է� �����մϴ�.");
				f.contents.focus();
				return;
			}
			alert("2");			
			f.target = "ifrProc";
			
			alert("3");
			f.submit(); */
		
		
/*10.06 		//�̸��� ����� �� ��������(����ü, ������ �̸��� ��)
		function doChangeEmail(f, val){
			
			//���� �Է��� �����Ͽ��ٸ�, ���� �Էµ� ���� �����.
			if (val=="etc"){
				f.email2.value = "";
				f.email2.focus();
				
			//�׷��� ������, ���õ� ���� �Է� �޵��� �Ѵ�.
			}else{
				f.email2.value = val;
				
			}
			
		} */
		
/* 10.06			 //�������� üũ ���� Ȯ��
		function chkRadioCtrYn(){
			var ctrYn = document.f.getElementsByName('ctr_yn') ; //���� ��ü ��������
			var res = false; //��ȯ�� �����(���õǾ����� true, ���þȵǸ� false)
			
			//���� ��ư ��ü����ŭ �ݺ��� ������
			for (var i=0;i<ctrYn.length;i++){
				
				//���� ��ư�� üũ�Ǿ��ٸ�..
				if (ctrYn[i].checked){
					res = true;
				}
			}
			
			return res;
		}
		
		function chkRadio() {
			var ctr_yn = document.getElementById('ctr_yn');
			var res = false;

			for(var i=0;i<ctr_yn.length;i++){
				if(ctr_yn.checked){
					res=true;
				}
			}
			return res;
		} */
		
		 var SetComma = function(str) {

		       var regMustNumberComma = /^[\t|0-9|,]+$/;
		       str = str.replace(/,/g,'');

		       var retValue = "";
		           for( i = 1; i <= str.length; i++ ) {
		               if( i > 1 && (i%3) == 1 )
		                   retValue = str.charAt(str.length - i) + "," + retValue;
		               else
		                   retValue = str.charAt(str.length - i) + retValue;
		           }
		        
		           if( regMustNumberComma.test(retValue) == false ) {
		               alert("���ڸ� �Է��Ͻ� �� �ֽ��ϴ�.");
		               return "";
		           }
		           return retValue;

		   }


		   var SetComma1 = function(str) {

		       var regMustNumberComma = /^[\t|0-9]+$/;
		       str = str.replace(/,/g,'');

		       var retValue = "";
		           for( i = 1; i <= str.length; i++ ) {
		               if( i > 1 && (i%3) == 1 )
		                   retValue = str.charAt(str.length - i) + retValue;
		               else
		                   retValue = str.charAt(str.length - i) + retValue;
		           }
		        
		           if( regMustNumberComma.test(retValue) == false ) {
		               alert("���ڸ� �Է��Ͻ� �� �ֽ��ϴ�.");
		               return "";
		           }
		           return retValue;

		   }
		   
		function doKeyOnlyNumber(event) {
			
			event = event || window.event;
			var keyID = (event.which) ? event.which : event.KeyCode;
			if((keyID >= 48 && keyID <= 57) || (keyID>=96 && keyID <=105) || keyID==8 || keyID==9 ){
		
				return true;
				
			}else{
				
				return false;
			}
		}
		
		//���� ���� ����Ʈ ������ üũ�ϱ�(����Ʈ�� ����)
		function calBytes(str) {
			
			var tcount = 0;
			var tmpStr = new String(str);
			var strCnt = tmpStr.length;

			var onechar;
			for (i = 0; i < strCnt; i++) {
				onechar = tmpStr.charAt(i);
				if (escape(onechar).length > 4) {
					tcount += 2;
				} else {
					tcount += 1;
				}
			}
			return tcount;
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
    <div class="content" style="display:block;">
        <div class="content_wrapper">
        	<header><span>�����͸� ����</span></header>
        	
        	<form name="f" id="f" method="post" action="/ctr/GuestctrReg.do" >
        	
        	<!--  ������ �ٽ� ¥���� ��������,���� �ʿ� -->
        	
			<div class="section">
        	
        	
        	  	<div class="input_row">
					<span class="input_box">
						<label class="lbl" >����</label>
						<!-- <input type="text" placeholder="�̸�" class="input_area" value=""> -->
						<input type="text" name="title" maxlength="100" class="input_area" placeholder="����"/>
					</span>
				</div>

	            <div class="input_row">
					<span class="input_box">
						<label class="lbl" >�����ο�</label>
						<!-- <input type="number" placeholder="�����ο�" class="input_area" value=""> -->
						<input type="text" name="people" maxlength="4"  onkeyup="this.value=SetComma(this.value)" class="input_area" placeholder="�����ο�" onkeydown="return doKeyOnlyNumber(event);"/>			
					</span>
				</div>
				
                <div class="input_row">
					<span class="input_box">
						<label class="lbl" >���</label>
						<!-- <input type="text" placeholder="���" class="input_area" value=""> -->
						<input type="text" name="place"  maxlength="100" class="input_area" placeholder="���"/>					
					</span>
				</div>
				
                <!-- group -->
<!-- 				<div class="group" style='display:block;height:40px;' > -->
				<div class="input_row">
					<span class="input_box">
						<label class="lbl" >�̸�</label>
						<!-- <input type="text" placeholder="�̸�" class="input_area" value=""> -->
						<input type="text" name="user_name" maxlength="20" class="input_area" placeholder="�̸�"/>
					</span>
				</div>

					<div class="input_select phone">
			
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
						<span class="input_box">
							<label class="lbl" >��ȭ��ȣ2</label>
							<!-- <input type="number" placeholder="��ȭ��ȣ" class="input_phone" value=""> -->
							<input type="text" name="tel_2" onkeyup="this.value=SetComma1(this.value)" maxlength="4" class="input_phone" />
						</span>
					</div>
					
					<label class='dash'> - </label>
					
					<div class="input_row phone">
						<span class="input_box">
							<label class="lbl" >��ȭ��ȣ3</label>
							<!-- <input type="number" placeholder="" class="input_phone" value=""> -->
							<input type="text" name="tel_3" onkeyup="this.value=SetComma1(this.value)" maxlength="4" class="input_phone" />
						</span>	
					</div> <br/><br/><br/>
					
			<!-- 		<select class="only" name="ctr_yn">
                	    <option value="1">�������� ��</option>
					   	<option value="2" selected>�������� �ƴϿ�</option>
                    </select> -->
					
			<div class="input_content">
               <span class="input_box">
                        <textarea name="contents" placeholder="����"></textarea>
               </span>
            </div>
            
				</div>
				
	<div class="content wrapper50">
	    <!-- <input type="submit" title="Ȯ��" value="Ȯ��" class="btn_half left">
	    <input type="submit" title="���" value="���" class="btn_half left">-->
    	<input type="button" value="���" onclick="doAction()" class="btn_half left"/>
		<input type="button" value="���" onclick="location.href='/ctr/GuestctrList.do'" class="btn_half left"/>
    </div>
			
                <!-- group -->
            </div>
        </div>
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

    