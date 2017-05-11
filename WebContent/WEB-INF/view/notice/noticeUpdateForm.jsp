<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.NoticeDTO"%>
<%
	NoticeDTO noticeDto = (NoticeDTO) request.getAttribute("noticeDto");

	if (noticeDto == null) {
		noticeDto = new NoticeDTO();
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

<title>�������׼���</title>

<%@include file="/inc/top.jsp"%>

<script type="text/javascript">
	function doAction(f) {
		if (f.title.value == "") {
			alert("������ �Է��Ͻñ� �ٶ��ϴ�.");
			f.title.focus();
			return false;
		}

		if (f.contents.value == "") {
			alert("������ �Է��Ͻñ� �ٶ��ϴ�.")
			f.contents.focus();

			return false;
		}

		f.target = "ifrProc";
		return true;
	}

	
	
	function doFileUpload() {

		var cw = screen.availWidth; //ȭ�� ����
		var ch = screen.availHeight; //ȭ�� ����

		var sw = 500; //��� â�� ����
		var sh = 400; //��� â�� ����

		var ml = (cw - sw) / 2; 
		var mt = (ch - sh) / 2; 

		window.open("/file/FileUploadSingPOP.do?jObj=fileGRP&vObj=doUploadOK",
				"UPLOAD_POP", "width=" + sw + ",height=" + sh + ",top=" + mt
						+ ",left=" + ml + ",resizable=no,scrollbars=yes");
	}
	
	
	//�̹��� ÷�ΰ� �Ϸ�Ǹ� ����� �Լ�
	function doUploadOK() {

		alert("doUploadOK");
		var btnImg = document.getElementById("btnImg");

		btnImg.value = "���ε� �Ϸ�";
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
					<h1 class="page-header">�������� ����</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">�������� ����</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">

								<form name="form1" method="post" action="noticeUpdate.do">
								<input type="hidden" name="fileGRP" id="fileGRP" />
									


									<table width="100%"
										class="table table-striped 	table-bordered table-hover"
										id="dataTables-example">
										<tbody>

											<tr>
												<td align="center"><b>����</b>
												<td><input type="text" name="title" size="40"
													value="<%=CmmUtil.nvl(noticeDto.getTitle())%>" /> 
													<b>�����</b><%=CmmUtil.nvl(noticeDto.getChg_dt())%>
													<b>��ȸ��</b><%=CmmUtil.nvl(noticeDto.getRead_cnt())%></td>
											</tr>

											<tr>
												<td align="center" style="width: 100px" ><b>����</b></td><td colspan="3">
                                                 
                                                <input type="button" id="fileGRP" value="����" onclick="doFileUpload()" /></td>

															</tr>
											<tr>
												<td align="center"><b>����</b></td>
												<td colspan="3">
												<textarea name="contents" rows="15" cols="100"><%=CmmUtil.nvl(noticeDto.getContents())%></textarea></td>
											</tr>
										</tbody>
									</table>


									<input type="hidden" name="notice_seq"
										value="<%=CmmUtil.nvl(noticeDto.getNotice_seq())%>">
									
									<p align="right">

										<input type="submit" value="Ȯ��" class="btn btn-outline btn-info">
										<input type=button value="���" class="btn btn-outline btn-success"
											onclick="location.href='noticeList.do'" />
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

	</div>
</body>

</html>