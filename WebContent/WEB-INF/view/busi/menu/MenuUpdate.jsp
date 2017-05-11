<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ac.kr.ft.com.util.CmmUtil"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="ac.kr.ft.com.dto.MenuInfoDTO"%>
<%@ page import="java.util.List"%>  
<%
	MenuInfoDTO menuinfoDto = (MenuInfoDTO) request.getAttribute("menuinfoDto");

	if (menuinfoDto == null) {
		menuinfoDto = new MenuInfoDTO();
	}
%>   
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>���Ǫ��Ʈ��</title>
    <meta charset="EUC-KR">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/css/style.css?ver=2">
    
	<script type="text/javascript">
	
	function doAction2() {
		var f = document.getElementById("f");

		if (f.menu_name.value == "") {
			alert("�޴��̸��� �Է��Ͻñ� �ٶ��ϴ�.");
			f.menu_name.focus();
			return false;
		}
		if (f.price.value == "") {
			alert("������ �Է��Ͻñ� �ٶ��ϴ�.");
			f.price.focus();
			return false;
		}
		if (f.menu_int.value == "") {
			alert("������ �Է��Ͻñ� �ٶ��ϴ�.");
			f.menu_int.focus();
			return false;
		}
		if (f.country_info.value == "") {
			alert("�������� �Է��Ͻñ� �ٶ��ϴ�.");
			f.country_info.focus();
			return false;
		}
		if (f.fileGRP.value == "") {
			alert("�޴� ������ ���ε��Ͻñ� �ٶ��ϴ�.");
			return false;
		}	
		
		  
        if (calBytes(f.menu_name.value) > 30) {
           alert("�޴��̸��� �ִ� 30Bytes���� �Է� �����մϴ�.");
           f.title.focus();
           return;
        }

         if (calBytes(f.price.value) > 7) {
           alert("������ 100�����̸����� �Է� �����մϴ�.");
           f.contents.focus();
           return;
        }    
         if (calBytes(f.menu_int.value) > 4000) {
            alert("������ �ִ� 4000Bytes���� �Է� �����մϴ�.");
            f.contents.focus();
            return;
         }   
         if (calBytes(f.menu_name.value) > 1000) {
             alert("�������� �ִ� 1000Bytes���� �Է� �����մϴ�.");
             f.title.focus();
             return;
          }
     

		f.submit();
  
	}function calBytes(str) {

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
	
	
	
	 var SetComma = function(str) {
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

	
	
	
	
	
	
	
	
	

	function doAction(gubun) {
		var f = document.getElementById("form1");
		if (gubun == "U") {
			f.action = "menuUpdate.do";
			f.submit();
		} else if (gubun == "D") {
			if (confirm("�����Ͻðڽ��ϱ�?")) {
				f.action = "delete.do";
				f.submit();
			}
		}
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
	//���� ���ε�
	function doFileUpload() {

		var cw = screen.availWidth; //ȭ�� ����
		var ch = screen.availHeight; //ȭ�� ����

		var sw = 500; //��� â�� ����
		var sh = 400; //��� â�� ����

		var ml = (cw - sw) / 2; //��� �������� â�� x��ġ
		var mt = (ch - sh) / 2; //��� �������� â�� y��ġ

		window.open("/file/FileUploadSingPOP.do?jObj=fileGRP", "UPLOAD_POP",
				"width=" + sw + ",height=" + sh + ",top=" + mt + ",left=" + ml
						+ ",resizable=no,scrollbars=yes");
	}

	//�̹��� ÷�ΰ� �Ϸ�Ǹ� ����� �Լ�
	function doUploadOK() {

		alert("doUploadOK");
		var btnImg = document.getElementById("btnImg");

		btnImg.value = "������ ��� �Ǿ����ϴ�.";
		btnImg.disabled;

	}
</script>
 
 
    <%@include file="/busiinc/apptop.jsp" %>
</head>
<body>
<!-- S: WRAPPER -->
<div class="wrapper">
    <!-- S: HEADER -->
    <%@include file="/busiinc/appheader.jsp"%>
    <!-- E: HEADER -->

    <!-- S: CONTENT -->
    <%@include file="/busiinc/appmenu.jsp"%>
    <!-- join -->
    

    <form name="f" id="f" method="post" action="busimenuUpdate.do" onsubmit="return doAction2(this)">
    
    <div class="content" style="display:block;">
        <div class="content_wrapper">
        	<header><span>�޴�����</span></header>
			<div class="section">
               <div class="input_row">
					<span class="input_box">
						<input type="hidden" name="menu_seq"
										value="<%=CmmUtil.nvl(menuinfoDto.getMenu_seq())%>" />
						<label class="lbl" >�޴��̸�</label>
						<input type="text" name="menu_name" placeholder="�޴��̸�" class="input_area" value="<%=CmmUtil.nvl(menuinfoDto.getMenu_name())%>" maxlength="15"
                  >
					</span>
				</div>
               <div class="input_row">
					<span class="input_box">
						<label class="lbl" >����</label>

						
	<input type="text" name="price" maxlength="7" placeholder="����" class="input_area" value="<%=CmmUtil.nvl(menuinfoDto.getPrice())%>" onkeyup="this.value=SetComma(this.value)">
	

					</span>
				</div>
				<div class="group">
					<div class="input_row id_check">
						<span class="input_box">
							<label class="lbl">�̹���</label>
						</span>	
					</div>
					<input type="hidden" name="fileGRP" id="fileGRP" /> 
					<input type="button" id="btnImg" value="���" onclick="doFileUpload()" class="btn_small check white"/>
				</div>
                <div class="input_content">
					<span class="input_box">
                        
                        
                        <textarea name="menu_int"maxlength="2000" placeholder="�Ұ�"   > <%=CmmUtil.nvl(menuinfoDto.getMenu_int())%>   </textarea>
					</span>
				</div>

				<div class="input_content">
					<span class="input_box">
                        <textarea name="country_info"maxlength="500" placeholder="������"> <%=CmmUtil.nvl(menuinfoDto.getCountry_info())%>  </textarea>
					</span>
				</div>
            </div>
        </div>
    </div>
    <div class="content wrapper50">
	    <input type="submit" title="���" value="���" class="btn_half left" >
	    <input type="button" title="���" value="���" class="btn_half left" onclick="location.href='/menu/busiMenuList.do'">
	   
											
									
    
    </div>
    
    </form>
    
    <!-- E: CONTENT -->

    <!-- S: FOOTER -->
   <%@include file="/busiinc/appfooter.jsp"%>
    
    <!-- E: FOOTER -->

<!-- E: WRAPPER -->
</body>
</html>
