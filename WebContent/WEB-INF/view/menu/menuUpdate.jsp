<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.MenuInfoDTO"%>
<%
	MenuInfoDTO menuinfoDto = (MenuInfoDTO) request.getAttribute("menuinfoDto");

	if (menuinfoDto == null) {
		menuinfoDto = new MenuInfoDTO();
	}
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="euc-kr">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>�޴�����</title>

<%@include file="/inc/top.jsp"%>

<script type="text/javascript">




var SetComma = function(str) {
	
	var regMustNumberComma = /^[\t|0-9|,]+$/;
	str = str.replace(/,/g,'');
	
	var retValue = "";
	
	for( i = 1; i <= str.length; i++ ) {
		if(i>1 && (i%3)== 1){
			retValue = str.charAt(str.length - i) + "," + retValue;
			
		}else{
			retValue = str.charAt(str.length - i) + retValue;
			
		}
	}
	
	if( regMustNumberComma.test(retValue) == false ) {alert("���ڸ� �Է��Ͻ� �� �ֽ��ϴ�.");return "";}
	
	return retValue;
}
 
	function doAction2() {
		var f = document.getElementById("form1");

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


</head>

<body>

	<div id="wrapper">

		<%@include file="/inc/menu.jsp"%>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">�޴�����</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">�޴�����</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">


								    <form name="f" id="form1" method="post" action="menuUpdate.do" onsubmit="return doAction2(this)">
								
									<input type="hidden" name="menu_seq"
										value="<%=CmmUtil.nvl(menuinfoDto.getMenu_seq())%>" />
									
									<table border="1"
										class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<tr>
											<td align="center" width="15%" height="10%"><b>�޴��̸�</b></td>
											<td><input type="text" name="menu_name" maxlength="15" class="form-control" style="width :400px"
												value="<%=CmmUtil.nvl(menuinfoDto.getMenu_name())%>" /></td>
											<td align="center" ><b>�޴�����</b></td>
											<td><input type="hidden" name="fileGRP" id="fileGRP" />
											<input type="button" id="btnImg" value="����"
												onclick="doFileUpload()" /></td>
										
										</tr>
										<tr>
											<td align="center"><b>����</b></td>
											<td colspan="3"><input type="text" name="price" maxlength="7" class="form-control" style="width :130px"
												value="<%=CmmUtil.nvl(menuinfoDto.getPrice())%>" onkeyup="this.value=SetComma(this.value)" /></td>
											
										</tr>
										<tr>
											<td align="center"><b>����</b></td>
											<td colspan="3"><textarea name="menu_int" maxlength="2000"rows="10" cols="68" class="form-control"><%=CmmUtil.nvl(menuinfoDto.getMenu_int())%></textarea>
											</td>
										</tr>

										<tr>
											<td align="center"><b>������</b></td>
											<td colspan="3"><textarea name="country_info"maxlength="500" rows="10" cols="68" class="form-control"><%=CmmUtil.nvl(menuinfoDto.getCountry_info())%></textarea>
											</td>
										</tr>
										
									</table>
								
									<p align="right">
										<input type="submit" value="Ȯ��" class="btn btn-outline btn-success" />
										<input type="button" class="btn btn-outline btn-danger" value="����" onclick="doAction('D')" />
											 <input type="button" class="btn btn-outline btn-default" value="���"
											onclick="location.href='/menu/menuList.do'" />
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


	<iframe name="ifrProc" style="display: none"></iframe>

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

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});
	</script>

</body>

</html>