<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.HygDTO"%>
<%@page import="java.util.List"%>    

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>��������</title>

	<%@include file="/inc/top.jsp" %>

	<script type="text/javascript">
	function doAction() {
		var f = document.getElementById("f");
		if (f.title.value==""){
			alert("�������� ������ ���ε��Ͻñ� �ٶ��ϴ�.");
		return false;
		}
		if (f.contents.value==""){
			alert("������ ���ε��Ͻñ� �ٶ��ϴ�.");
		return false;
		}
		
		if (f.fileGRP.value==""){
			alert("�������� ������ ���ε��Ͻñ� �ٶ��ϴ�.");
		return false;
		}
		
		   if (calBytes(f.title.value) > 100) {
		        alert("������ �ִ� 100Bytes���� �Է� �����մϴ�.");
		        f.title.focus();
		        return;
		     }

		      if (calBytes(f.contents.value) > 4000) {
		        alert("������ �ִ� 4000Bytes���� �Է� �����մϴ�.");
		        f.contents.focus();
		        return;
		     }    
		  

				
			f.submit();
		return true;
		}
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
	
		//���� ���ε�
		function doFileUpload() {
			
			var cw=screen.availWidth;     //ȭ�� ����
			var ch=screen.availHeight;    //ȭ�� ����
			
			var sw=500;    //��� â�� ����
			var sh=400;    //��� â�� ����
			
			var ml=(cw-sw)/2;        //��� �������� â�� x��ġ
			var mt=(ch-sh)/2;         //��� �������� â�� y��ġ
			
			window.open("/file/FileUploadSingPOP.do?jObj=fileGRP", "UPLOAD_POP",
					"width=" + sw + ",height=" + sh + ",top=" + mt + ",left=" + ml
							+ ",resizable=no,scrollbars=yes");
		}
		
		//�̹��� ÷�ΰ� �Ϸ�Ǹ� ����� �Լ�
		function doUploadOK(){
		
			alert("doUploadOK");
			var btnImg = document.getElementById("btnImg");
			
			btnImg.value = "���ε� �Ϸ�";
			btnImg.disabled;
			
		}
		
		
	</script>

</head>

<body>

    <div id="wrapper">

	<%@include file="/inc/menu.jsp" %>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">����������</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">��������
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                            	<form name="f" id="f" method="post" action="/hyg/hygInsert.do">
	
								
 
 										
 										<table class="table table-striped table-bordered table-hover"
									     id="dataTables-example">		
 										
 										<tr>
										<td align="center" width="120px"><b>�������� ����</b></td>
										<td><input type="text" name="title" maxlength="50" class="form-control" style= "width:400px"/></td>
										</tr>
										<tr>
										<td align="center" width="120px"><b>���� </b></td>
										<td>
										<textarea name="contents"  maxlength="2000"  class="form-control" rows="10" cols="68"/></textarea></td>
										</tr>
 										
 										
 										<tr>
										<td align="center"><b>�������� ����</b></td>
										<td>
											<input type="hidden" name="fileGRP" id="fileGRP" /><%//����� ������ ���ϱ׷� ���̵� %>
											<input type="button" id="btnImg" value="���"  onclick="doFileUpload()"/>
										</td>
									</tr>
									</table>
	
                                </form>
	                            <p align="right">
									<input type="button" value="���" onclick="doAction()" class="btn btn-outline btn-success"/>
									<input type="button" value="���" onclick="location.href='/hyg/hygList.do'" class="btn btn-outline btn-default"/>
	                            </p>
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

	<!-- ���� ó���� -->
	
	<iframe name="ifrProc" style="display:none"></iframe>

    <!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="../bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
    <script src="../bower_components/datatables-responsive/js/dataTables.responsive.js"></script>
    
    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
    });
    </script>

</body>

</html>
    