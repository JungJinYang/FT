<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="ac.kr.ft.com.util.CmmUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ac.kr.ft.com.dto.CommunityDTO"%>
<%
	CommunityDTO communityDto = (CommunityDTO) request.getAttribute("communityDto");

	if (communityDto == null) {
		communityDto = new CommunityDTO();
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

<title>�� Ŀ�´�Ƽ ����</title>

<%@include file="/inc/top.jsp"%>

<script type="text/javascript">
	function doAction1() {
		var f = document.getElementById("form1");
		
		if (f.title.value == "") {
			alert("������ �Է��Ͻñ� �ٶ��ϴ�.");
			f.title.focus();
			return false;
		}

		if (f.contents.value == "") {
			alert("������ �Է��Ͻñ� �ٶ��ϴ�.");
			f.contents.focus();

			return false;
		}

		f.submit();
		return true;
	}

	function doFileUpload() {

		var cw = screen.availWidth; //ȭ�� ����
		var ch = screen.availHeight; //ȭ�� ����

		var sw = 500; //��� â�� ����
		var sh = 400; //��� â�� ����

		var ml = (cw - sw) / 2; //��� �������� â�� x��ġ
		var mt = (ch - sh) / 2; //��� �������� â�� y��ġ

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

<script language="javascript">
function fc_chk_byte(obj_name,max_length)
{
   var ls_str     = obj_name.value; // �̺�Ʈ�� �Ͼ ��Ʈ���� value ��
   var li_str_len = ls_str.length;  // ��ü����
   // �����ʱ�ȭ
   var li_max      = max_length; // ������ ���ڼ� ũ��
   var i           = 0;  // for���� ���
   var li_byte     = 0;  // �ѱ��ϰ��� 2 �׹ܿ��� 1�� ����
   var li_len      = 0;  // substring�ϱ� ���ؼ� ���
   var ls_one_char = ""; // �ѱ��ھ� �˻��Ѵ�
   var ls_str2     = ""; // ���ڼ��� �ʰ��ϸ� �����Ҽ� ������������ �����ش�.
   
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
      alert( li_max + " Bytes�� �ʰ� �Է��Ҽ� �����ϴ�. \n �ʰ��� ������ �ڵ����� ���� �˴ϴ�. ");
      ls_str2 = ls_str.substr(0, li_len);
      obj_name.value = ls_str2; 
      document.frms.chkbytes.value = cal_length(obj_name.value);
   }
   obj_name.focus();   
   document.frms.chkbytes.value = cal_length(ls_str);
}

/**
 * �ѱ��� 2����Ʈ �� ����Ͽ� �Է¹��� ���ڿ��� DB�� ����� �� �� �����Ʈ�� �����ϴ��� ����Ѵ�.
 * ����(\r\n)�� 2����Ʈ�� �����Ѵ�.
 * @param val : �Է¹��� ���ڿ�
 */
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
</head>

<body onload="doOnload()">

	<div id="wrapper">

		<%@include file="/inc/menu.jsp"%>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">�� Ŀ�´�Ƽ ����</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">�� Ŀ�´�Ƽ ����</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">

								<form name="form1" id="form1" method="post" action="update.do">
									<input type="hidden" name="fileGRP" id="fileGRP" />



									<table width="100%"
										class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<tbody>
											<tr>
												<td align="center" width="100px"><b>����</b></td>
												<td>
												<input type="text" name="title" size="50" maxlength="200" onkeyup="fc_chk_byte(this,100);"
												 class="form-control" value="<%=CmmUtil.nvl(communityDto.getTitle())%>"/>
												</td>
												<td width="60px"><b>�����</b></td>
												
											
												<td width="200px"><%=CmmUtil.nvl(communityDto.getReg_dt())%></td>					
											
												
												<td width="100px"><b>��ȸ��</b></td>
												<td width="100px"><%=CmmUtil.nvl(communityDto.getRead_cnt())%></td>
											</tr>
											<tr>
												<td align="center" style="width: 100px"><b>����</b></td>
												<td colspan="6"><input type="button" id="fileGRP"
													value="����" onclick="doFileUpload()" /></td>



											</tr>
											<tr>
												<td align="center"><b>����</b></td>
												<td colspan="5"><textarea name="contents" style="width: 600px; height:300px;" 
												onkeyup="fc_chk_byte(this,4000);" class="form-control"><%=CmmUtil.nvl(communityDto.getContents())%></textarea>
												</td>
											</tr>






										</tbody>
									</table>
									<p align="right">

										<input type="button" value="Ȯ��" onclick="doAction1()"
											class="btn btn-outline btn-success"> <input
											type=button value="���" class="btn btn-outline btn-danger"
											onclick="location.href='communityList.do'" />
									</p>


									<input type="hidden" name="cmt_seq"
										value="<%=CmmUtil.nvl(communityDto.getCmt_seq())%>">

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